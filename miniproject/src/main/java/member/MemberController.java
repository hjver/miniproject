package member;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import common.Encryptor;
import reservation.ReservationDAO;
import reservation.ReservationDTO;

@Controller
public class MemberController extends Encryptor{
	
	@Resource(name="MemberDAO")
	private MemberDAO mdao;
	
	@Resource(name="ReservationDAO")
	private ReservationDAO rdao;
	
	
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
		Integer midx = this.mdao.selectone_emailck(memail); //DB에서 memail=memail인 데이터 select
		
		if(midx == null) { //DB에 memail=memail인 데이터가 없으면 중복이 아니므로 "ok"
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
	        mdto.setMpasswd(encodePassword(mdto.getMpasswd()));

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
	
	// 로그인 화면 연결
	@GetMapping("/login.do")
	public String login() {
        return "WEB-INF/realty/login";  //login 화면 uri : WEB-INF/realty/login.jsp
	}
	
	// 로그인 정보 확인 및 로그인
	@PostMapping("/login_ok.do")
	public String login_ok(MemberDTO mdto, HttpSession session, Model m) {
		// 패스워드 암호화
        mdto.setMpasswd(encodePassword(mdto.getMpasswd()));
        
        // 가입자 DB정보 확인
        Map<String, String> user = new HashMap<>();
        user.put("memail", mdto.getMemail());
        user.put("mpasswd", mdto.getMpasswd());
        MemberDTO userDTO = this.mdao.selectone_userck(user);
        
        if(userDTO != null) {
        	session.setAttribute("userDTO", userDTO);

        	m.addAttribute("msg", "로그인 되었습니다.");
        	m.addAttribute("url", "/index.do");
        }
        else {
        	m.addAttribute("msg", "이메일 또는 패스워드가 다릅니다. 정확하게 입력해 주세요.");
        	m.addAttribute("url", "/login.do");
        }
        
		return "WEB-INF/realty/redirect";
	}
	
	// 로그아웃
	@GetMapping("/logout.do")
	public String logout(HttpSession session) {
        session.invalidate(); // 세션 삭제
		return "WEB-INF/realty/index";
	}
	
	// 이메일 찾기 화면 연결
	@GetMapping("/email_search.do")
	public String email_search() {
		return "WEB-INF/realty/email_search";
	}
	
	// 이메일 찾기를 위한 가입자 DB정보 확인
	@PostMapping("/email_search_ok.do")
	public String email_search_ok(MemberDTO mdto, Model m) {

        // 가입자 DB정보 확인
        Map<String, String> user = new HashMap<>();
        user.put("mname", mdto.getMname());
        user.put("mmobile", mdto.getMmobile());
        String memail = this.mdao.selectone_emailsearch(user);

        if(memail != null) {
        	m.addAttribute("memail", memail);
        	return "WEB-INF/realty/search_myinfo";
        }
        else {
        	m.addAttribute("msg", "가입하신 정보는 확인되지 않습니다..");
        	m.addAttribute("url", "/email_search.do");
        	return "WEB-INF/realty/redirect";
        }
	}
	
	// 비밀번호 찾기 화면 연결
	@GetMapping("/passwd_search.do")
	public String passwd_search() {
		return "WEB-INF/realty/passwd_search";
	}
	
	// 패스워드 변경을 위한 가입자 DB정보 확인
	@PostMapping("/passwd_search_ok.do")
	public String passwd_search_ok(MemberDTO mdto, Model m) {

        // 가입자 DB정보 확인
        Map<String, String> user = new HashMap<>();
        user.put("memail", mdto.getMemail());
        user.put("mmobile", mdto.getMmobile());
        Integer midx = this.mdao.selectone_passwdsearch(user);

        if(midx != null) {
        	m.addAttribute("midx", midx);
        	return "WEB-INF/realty/search_mypass";
        }
        else {
        	m.addAttribute("msg", "가입하신 정보는 확인되지 않습니다..");
        	m.addAttribute("url", "/passwd_search.do");
        	return "WEB-INF/realty/redirect";
        }
	}
	
	// 패스워드 변경
	@PostMapping("/passwd_change_ok.do")
	public String email_change_ok(MemberDTO mdto, Model m) {
		// 패스워드 암호화
        mdto.setMpasswd(encodePassword(mdto.getMpasswd()));
		
        // 가입자 DB정보 확인
        Map<String, String> user = new HashMap<>();
        user.put("midx", String.valueOf(mdto.getMidx()));
        user.put("mpasswd", mdto.getMpasswd());
        int result = this.mdao.password_change(user);

        if(result > 0) {
        	m.addAttribute("msg", "패스워드가 변경되었습니다.");
        	m.addAttribute("url", "/login.do");
        }
        else {
        	m.addAttribute("msg", "오류가 발생하여 패스워드가 변경되지 않았습니다..");
        	m.addAttribute("url", "/search_mypass.do");
        }
        return "WEB-INF/realty/redirect";
	}
}
