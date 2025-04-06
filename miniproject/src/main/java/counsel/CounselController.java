package counsel;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CounselController {
	
	@Resource(name="CounselDAO")
	private CounselDAO cdao;

	@PostMapping("/counsel.do")
	public String counsel(@RequestParam("midx") int midx) {
		return "WEB-INF/realty/counsel";
	}
	
	@PostMapping("/counsel_ok.do")
	public String counsel_ok(@ModelAttribute CounselUserDTO cdto, Model m) {
		int result = cdao.counselinfo_insert(cdto);
		if(result > 0) {
	        m.addAttribute("msg", "담당자가 확인 후 해당 상담일시에 맞춰서 연락 드립니다.");
	        m.addAttribute("url", "/index.do"); 		
		}
		else {
	        m.addAttribute("msg", "상담신청 중 오류가 발생했습니다.");
	        m.addAttribute("url", "/counsel.do");			
		}
		return "WEB-INF/realty/redirect";
	}
}
