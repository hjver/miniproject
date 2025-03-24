package member;

import java.io.PrintWriter;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MemberController {
	
	@Resource(name="MemberDAO")
	private MemberDAO mdao;
	
	@GetMapping("/member_join.do")
	public String member_join() {
        return "WEB-INF/realty/member_join";
	}
	
	@GetMapping("/email_check.do")
	@ResponseBody
	public String email_check(@RequestParam("memail") String memail) {
		String msg = "";
		MemberDTO one = this.mdao.member_one(memail);
		if(one == null) {
			msg = "ok";
		}
		else {
			msg = "no";
		}
		return msg;
	}
}
