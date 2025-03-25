package member;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import common.Encryptor;

@Controller
public class MemberController {
	
	@Resource(name="MemberDAO")
	private MemberDAO mdao;
	
	// 회원가입 화면 연결
	@GetMapping("/member_join.do")
	public String member_join() {
        return "WEB-INF/realty/member_join";  //회원가입 화면 uri : WEB-INF/realty/member_join.jsp
	}
	
	// 이메일 중복 체크 (ajax 응답)
	@GetMapping("/email_check.do")
	@ResponseBody  //ajax 응답용 : 메서드의 반환 값을 "뷰(jsp)"로 보내지 않고 바로 HTTP 응답(body)에 넣어서 보냄
	public String email_check(@RequestParam("memail") String memail) {
		String msg = "";
		MemberDTO one = this.mdao.selectone_emailck(memail); //DB에서 memail=memail인 데이터 select
		
		if(one == null) { //DB에 memail=memail인 데이터가 없으면 중복이 아니므로 "ok"
			msg = "ok";
		}
		else {
			msg = "no";
		}
		return msg;
	}
	
	// 회원가입 정보 DB 저장
	@PostMapping("/member_join_ok.do")
	public String member_join_ok(MemberDTO mdto, Model m) {
	    try {
	        // 패스워드 암호화
	        Encryptor enc = new Encryptor();
	        mdto.setMpasswd(enc.encodePassword(mdto.getMpasswd()));

	        // DB 저장 시도
	        int result = mdao.member_insert(mdto);
	        
	        // 성공 메시지 및 이동
	        if(result > 0) {
		        m.addAttribute("msg", "회원가입이 정상적으로 완료되었습니다.");
		        m.addAttribute("url", "/login.do"); // 로그인 페이지로 이동
	        }
	    } catch (DuplicateKeyException e) {
	        // 중복 오류 발생 시
	        m.addAttribute("msg", "이미 가입된 휴대폰 번호입니다. 다시 확인해 주세요.");
	        m.addAttribute("url", "/member_join.do"); // 다시 회원가입 페이지로
	    } catch (Exception e) {
	        // 기타 예외 처리
	        m.addAttribute("msg", "회원가입 중 오류가 발생했습니다.");
	        m.addAttribute("url", "/member_join.do");
	    }
	    
	    return "WEB-INF/realty/redirect";
	}
	
	// 회원가입 화면 연결
	@GetMapping("/login.do")
	public String login() {
        return "WEB-INF/realty/login";  //login 화면 uri : WEB-INF/realty/login.jsp
	}
	
	@PostMapping("/login_ok.do")
	public String login_ok(MemberDTO mdto, Model m) {
		// 패스워드 암호화
        Encryptor enc = new Encryptor();
        mdto.setMpasswd(enc.encodePassword(mdto.getMpasswd()));
        
        // 가입자 DB정보 확인
        Map<String, String> user = new HashMap<>();
        user.put("memail", mdto.getMemail());
        user.put("mpasswd", mdto.getMpasswd());
        MemberDTO one = this.mdao.selectone_userck(user);
        
        if(one != null) {
        	m.addAttribute("msg", "로그인 되었습니다.");
        	m.addAttribute("url", "/index.do");
        }
        else {
        	m.addAttribute("msg", "이메일 또는 패스워드가 다릅니다. 정확하게 입력해 주세요.");
        	m.addAttribute("url", "/login.do");
        }
        
		return "WEB-INF/realty/redirect";
	}
}
