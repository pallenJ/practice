package sy.controller;

import java.util.List;

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

import sy.bean.BoardDto;
import sy.service.BoardService;

@Controller
public class BoardController {


	@Autowired
	private HttpSession session;
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private HttpServletResponse response;

	private Logger log = LoggerFactory.getLogger(getClass());
	 
	@Autowired
	private BoardService boardService;
	
	@RequestMapping("/board")
	public String list(Model model) {
		int cnum=10;
		int pnum=10;
		List<BoardDto> list;
		/*
		
		String search=request.getParameter("search");
		String keyword=request.getParameter("keyword");
		
		boolean searchFlag=search!=null&&keyword!=null;
		
		*/
		int page=1;
		
		try {
			page = Integer.parseInt(request.getParameter("pg"));
		} catch (Exception e) {
		}
		
		int[]addValue;
		list=boardService.paging(page, cnum);
		addValue=boardService.paging(cnum, pnum, page);
		model.addAttribute("blist", list);
		model.addAttribute("pagingNum", addValue[0]);
		model.addAttribute("pageLast",  addValue[1]);
		model.addAttribute("lastPage",  addValue[2]);
		return "board/list";
	}
	@RequestMapping("/write")
	public String write(String parent,String gno,Model model) {
		if(session.getAttribute("loginEmail")==null) {
			model.addAttribute("re_login",true);
		}
		if(parent!=null&&gno!=null) {
			request.setAttribute("parent", parent);
			request.setAttribute("gno", gno);
		}
		return "board/write";
	}
	@RequestMapping(value="/write", method = RequestMethod.POST)
	public String write(String board,String title,String content,String secret,Model model) {
		log.debug("board={}",board);
		log.debug("title={}",title);
		log.debug("content={}",content);
		log.debug("secret={}",secret);
		
		boolean flag=
		boardService.getDao().register(board, title, secret, content, (String)session.getAttribute("loginEmail"));
		log.debug("={}",flag);
		
		model.addAttribute("re_list",true);
		return "board/list";
	}
	
}
