package main;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

	@Resource(name="corpinfoDAO")
	CorpInfoDAO corpinfoDAO;
	
	@GetMapping("/index.do")
	public String index(Model m) {
		
		CorpInfoDTO corpinfoDTO = corpinfoDAO.select_corpinfo();
		m.addAttribute("corpinfoDTO", corpinfoDTO);
				
		return "WEB-INF/realty/index";
	}
}
