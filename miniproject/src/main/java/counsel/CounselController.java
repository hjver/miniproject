package counsel;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class CounselController {
	
	@Resource(name="CounselDAO")
	private CounselDAO cdao;

	@GetMapping("/counsel.do")
	public String counsel() {
		return "WEB-INF/realty/counsel";
	}
	
	@PostMapping("/counsel_ok.do")
	public String counsel_ok(@ModelAttribute CounselUserDTO cdto, Model m) {
		int result = cdao.counselinfo_insert(cdto);
		if(result > 0) {
	        m.addAttribute("msg", "상담신청이 정상적으로 접수되었습니다.");
	        m.addAttribute("url", "/index.do"); 		
		}
		else {
	        m.addAttribute("msg", "상담신청 중 오류가 발생했습니다.");
	        m.addAttribute("url", "/counsel.do");			
		}
		return "WEB-INF/realty/redirect";
	}
}
