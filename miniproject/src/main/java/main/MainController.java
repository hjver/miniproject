package main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

	@GetMapping("/index.do")
	public String index() {
		return "WEB-INF/realty/index";
	}
}
