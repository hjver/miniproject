package member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MemberController {
	
	@GetMapping("/member_join.do")
	public String member_join() {
        return "WEB-INF/realty/member_join";
	}
	
	@GetMapping("/email_check.do")
	public void email_check(String memail) {
		
	}
}
