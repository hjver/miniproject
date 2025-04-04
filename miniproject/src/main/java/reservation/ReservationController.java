package reservation;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import member.MemberDTO;

@Controller
public class ReservationController {

	@Resource(name="ReservationDAO")
	ReservationDAO reserveDAO;
	
	@PostMapping("/reservation.do")
	public String reservation(
			@RequestParam("bunyang_index") String bunyang_index,
			@RequestParam("bunyang_title") String bunyang_title,
			Model m) {

		m.addAttribute("bunyang_index", bunyang_index);
		m.addAttribute("bunyang_title", bunyang_title);
		return "WEB-INF/realty/reservation";
	}
	
	
	@PostMapping("/reservation_ok.do")
	public String reservation_ok(ReservationDTO reserveDTO,
			@RequestParam("bunyang_title") String bunyang_title,
			Model m) {
		
		int check = 0;
		try {
			int result = reserveDAO.reservation_insert(reserveDTO);
			if(result > 0) {
				check = 1; //정상 메시지 노출 후 예약 확인 화면으로 이동
				m.addAttribute("msg", "방문예약등록이 정상적으로 완료되었습니다.");
	        }
		}
		catch (Exception e) {
			System.out.println(e);
			check = 0;  //오류 메세지 노출 후 예약 화면으로 이동
			m.addAttribute("msg", "시스템 오류로 예약이 완료되지 않았습니다.");
		}
		
		m.addAttribute("check", check);
		m.addAttribute("bunyang_title", bunyang_title);
		m.addAttribute("reserveDTO", reserveDTO);
		
		return "WEB-INF/realty/reservation_check";
	}
	
	@PostMapping("/reservation_check.do")
	public String reservation_check(
			@RequestParam("bunyang_index") int bunyang_index,
			@RequestParam("bunyang_title") String bunyang_title,
			HttpSession session,
			Model m) {
		
		MemberDTO userDTO = (MemberDTO)session.getAttribute("userDTO");
		int midx = userDTO.getMidx();
		Map<String, Integer> reserve = new HashMap<>();
		reserve.put("midx", midx);
		reserve.put("bunyang_index", bunyang_index);
		ReservationDTO reserveDTO = reserveDAO.reservation_selectone(reserve);
		
		int check = 2; //예약화면 바로 이동 
		m.addAttribute("check", check);
		m.addAttribute("bunyang_title", bunyang_title);
		m.addAttribute("reserveDTO", reserveDTO);
		
		return "WEB-INF/realty/reservation_check";
	}
}
