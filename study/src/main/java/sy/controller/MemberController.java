package sy.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.Key;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.RSAPublicKeySpec;

import javax.crypto.Cipher;
import javax.crypto.NoSuchPaddingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import sy.bean.MemberDto;
import sy.model.MemberDao;
import sy.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	private HttpSession session;
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private HttpServletResponse response;

	private Logger log = LoggerFactory.getLogger(getClass());
	@Autowired
	private MemberService memberService;

	@RequestMapping("/login")
	public String login(Model model) throws NoSuchAlgorithmException, InvalidKeySpecException {
		if (session.getAttribute("loginEmail") != null) {
			model.addAttribute("arl_login", true);
			return "member/login";
		}
		KeyPairGenerator generator = KeyPairGenerator.getInstance("RSA");
		generator.initialize(2048);

		KeyPair keyPair = generator.genKeyPair();
		KeyFactory keyFactory = KeyFactory.getInstance("RSA");

		PublicKey publicKey = keyPair.getPublic();
		PrivateKey privateKey = keyPair.getPrivate();

		session.setAttribute("_RSA_WEB_Key_", privateKey);

		RSAPublicKeySpec publicSpec = keyFactory.getKeySpec(publicKey, RSAPublicKeySpec.class);

		String publicKeyModulus = publicSpec.getModulus().toString(16);
		String publicKeyExponent = publicSpec.getPublicExponent().toString(16);

		request.setAttribute("RSAModulus", publicKeyModulus);
		request.setAttribute("RSAExponent", publicKeyExponent);

		return "member/login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(String email, String pw, Model model) throws Exception {
		PrivateKey privateKey = (PrivateKey) session.getAttribute("_RSA_WEB_Key_");

		email = decryptRsa(privateKey, email);
		pw = decryptRsa(privateKey, pw);
		session.removeAttribute("_RSA_WEB_Key_");

		if (memberService.getDao().login(email, pw)) {
			session.setAttribute("loginEmail", email);
			session.setAttribute("loginPw", pw);
			model.addAttribute("re_home", true);
		} else {
			model.addAttribute("login_fail", true);
		}

		return "member/login";
	}

	@RequestMapping(value = "/logout")
	public String logout(String email, String pw, Model model) {
		session.removeAttribute("loginEmail");
		session.removeAttribute("loginPw");
		model.addAttribute("re_home", true);
		return "/home";
	}

	@RequestMapping("/register")
	public String register(Model model) {
		return "member/register";

	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(String email, String name, String pw, Model model) {
		boolean flag = memberService.register(email, name, pw);
		model.addAttribute("re_fail", !flag);
		model.addAttribute("re_success", flag);
		return "member/register";
	}

	@RequestMapping(value = "/check", method = RequestMethod.POST)
	@ResponseBody
	public String check(String email, Model model) {
		boolean flag = memberService.getDao().overlapCheck(email);

		return String.valueOf(model.addAttribute("check", flag));

	}

	public void showMessage(String message) {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=UTF-8");
		try (PrintWriter out = response.getWriter();) {
			out.append("<script>");
			out.append("alert('" + message + "');");
			out.append("</script>");
			out.flush();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private String decryptRsa(PrivateKey privateKey, String securedValue) throws Exception {
		Cipher cipher = Cipher.getInstance("RSA");
		byte[] encryptedBytes = hexToByteArray(securedValue);
		cipher.init(Cipher.DECRYPT_MODE, privateKey);
		byte[] decryptedBytes = cipher.doFinal(encryptedBytes);
		String decryptedValue = new String(decryptedBytes, "utf-8");
		return decryptedValue;
	}

	public static byte[] hexToByteArray(String hex) {
		if (hex == null || hex.length() % 2 != 0) {
			return new byte[] {};
		}

		byte[] bytes = new byte[hex.length() / 2];
		for (int i = 0; i < hex.length(); i += 2) {
			byte value = (byte) Integer.parseInt(hex.substring(i, i + 2), 16);
			bytes[(int) Math.floor(i / 2)] = value;
		}
		return bytes;
	}

}
