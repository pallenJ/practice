package sy.controller;

import java.io.PrintWriter;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.RSAPublicKeySpec;

import javax.crypto.Cipher;
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
	public String login(Model model) throws Exception {
		if (session.getAttribute("loginEmail") != null) {
			model.addAttribute("arl_login", true);
			return "member/login";
		}

		RSAPublicKeySpec publicSpec = incryptionRSA();
		
		String publicKeyModulus = publicSpec.getModulus().toString(16);
		String publicKeyExponent = publicSpec.getPublicExponent().toString(16);

		request.setAttribute("RSAModulus", publicKeyModulus);
		request.setAttribute("RSAExponent", publicKeyExponent);
		
		return "member/login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(String email, String pw, Model model) throws Exception {
		PrivateKey privateKey = (PrivateKey) session.getAttribute("_RSA_WEB_Key_");

		email = decryptionRSA(privateKey, email);
		pw = decryptionRSA(privateKey, pw);
		session.removeAttribute("_RSA_WEB_Key_");

		if (memberService.getDao().login(email, pw)) {
			session.setAttribute("loginEmail", email);
			session.setAttribute("loginGrade", memberService.getDao().myInfo(email).getGrade());
			model.addAttribute("re_home", true);
		} else {
			model.addAttribute("_fail", true);
		}

		return "member/login";
	}

	@RequestMapping(value = "/logout")
	public String logout(Model model) {
		session.removeAttribute("loginEmail");
		session.removeAttribute("loginGrade");
		model.addAttribute("re_home", true);
		return "/home";
	}

	@RequestMapping("/register")
	public String register(Model model) throws Exception {
		if (session.getAttribute("loginEmail") != null) {
			model.addAttribute("arl_login", true);
			return "/home";
		}
		
		RSAPublicKeySpec publicSpec = incryptionRSA();
		
		String publicKeyModulus = publicSpec.getModulus().toString(16);
		String publicKeyExponent = publicSpec.getPublicExponent().toString(16);

		session.setAttribute("RSAModulus", publicKeyModulus);
		session.setAttribute("RSAExponent", publicKeyExponent);
		return "member/register";

	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(String email, String name, String pw, Model model) throws Exception {
		
		PrivateKey privateKey = (PrivateKey) session.getAttribute("_RSA_WEB_Key_");

		email = decryptionRSA(privateKey, email);
		name  = decryptionRSA(privateKey, name);
		pw 	  = decryptionRSA(privateKey, pw);
		
		session.removeAttribute("_RSA_WEB_Key_");
		
		
		boolean flag = memberService.register(email, name, pw);
		model.addAttribute("re_fail", !flag);
		model.addAttribute("re_home", flag);
		if(flag) {
		session.setAttribute("loginEmail", email);
		session.setAttribute("loginGrade", "normal");
		}
		return "member/register";
	}
	
	@RequestMapping(value = {"/emailList","/emaillist","/memberlist","/memberList"})
	public String emailList(Model model) {
		Object grade = session.getAttribute("loginGrade");
		if(grade==null||!grade.equals("admin")) {
			model.addAttribute("_fail", true);
			model.addAttribute("errorMSG","권한이 부족 합니다");
			return "/home";
		}
		model.addAttribute("emailList", memberService.getDao().emailList());
		return "member/memberList";
	}
	@RequestMapping(value = {"/emailpf","/emailPf"})
	public String emailPf(String email,Model model) {
		String pfKey=memberService.emailPf(email);
		model.addAttribute("pfKey", pfKey);
		return "member/emailpf";
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
	
	
	
	private RSAPublicKeySpec incryptionRSA() throws Exception {
		KeyPairGenerator generator = KeyPairGenerator.getInstance("RSA");
		generator.initialize(2048);

		KeyPair keyPair = generator.genKeyPair();
		KeyFactory keyFactory = KeyFactory.getInstance("RSA");

		PublicKey publicKey = keyPair.getPublic();
		PrivateKey privateKey = keyPair.getPrivate();

		session.setAttribute("_RSA_WEB_Key_", privateKey);

		return keyFactory.getKeySpec(publicKey, RSAPublicKeySpec.class);
	}
	
	private String decryptionRSA(PrivateKey privateKey, String securedValue) throws Exception {
		
		Cipher cipher = Cipher.getInstance("RSA");
        byte[] encryptedBytes = memberService.hexToByteArray(securedValue);
        cipher.init(Cipher.DECRYPT_MODE, privateKey);
        byte[] decryptedBytes = cipher.doFinal(encryptedBytes);
        String decryptedValue = new String(decryptedBytes, "utf-8");
        return decryptedValue;
	}


}
