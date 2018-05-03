package sy.controller;

import java.io.IOException;
import java.io.PrintWriter;

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
	public String login(Model model) {
		model.addAttribute("arl_login",session.getAttribute("loginEmail")!=null);
		return "member/login";
	}
	
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String login(String email ,String pw ,Model model) {
		if(memberService.getDao().login(email, pw)) {
			session.setAttribute("loginEmail", email);
			session.setAttribute("loginPw", pw);
			model.addAttribute("re_home", true);
		}else {
			model.addAttribute("login_fail", true);
		}
		
		
		return "member/login";
	}
	
	@RequestMapping(value="/logout")
	public String logout(String email ,String pw ,Model model) {
		session.removeAttribute("loginEmail");
		session.removeAttribute("loginPw");
		model.addAttribute("re_home", true);
		return "/home";
	}
	@RequestMapping("/register")
	public String register(Model model) {
		/*model.addAttribute("emails",memberService.getDao().emailList());*/
		return "member/register";
		
	}
	
	@RequestMapping(value="/register",method = RequestMethod.POST)
	public String register(String email,String id,String pw,Model model) {
		model.addAttribute("re_back", !memberService.register(email, id, pw));
		return "/home";
	}
	

	@RequestMapping(value="/check", method = RequestMethod.POST)
	@ResponseBody
	public String check(String email,Model model) {
		boolean flag = memberService.getDao().overlapCheck(email);
	
		return String.valueOf(model.addAttribute("check",flag));
		
		
	}
	
	
}
