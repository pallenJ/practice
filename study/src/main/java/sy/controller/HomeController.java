package sy.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class HomeController {
	private Logger log = LoggerFactory.getLogger(getClass());
	
	@RequestMapping(value= {"/", "/home"})
	public String home() {
		log.debug("home");
		return "/home";
	}
}