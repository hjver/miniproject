package reservation;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ReservationController {

	@Resource(name="ReservationDAO")
	ReservationDAO rdao;
	
	@PostMapping("/reservation.do")
	public String reservation(
			@RequestParam("bunyang_title") String bunyang_title,
			Model m) {
		
		m.addAttribute("bunyang_title", bunyang_title);
		return "WEB-INF/realty/reservation";
	}
	
	@PostMapping("/reservation_check.do")
	public String reservation_check(ReservationDTO rdto, Model m) {

		try {
			int result = rdao.reservation_insert(rdto);
			System.out.println("테스트 : " + result);
			if(result > 0) {
		        m.addAttribute("msg", "방문예약등록이 정상적으로 완료되었습니다.");
		        m.addAttribute("url", "'/reservation_check.do?midx='+rdto.getMidx()");
	        }
		}
		catch (Exception e) {
	        m.addAttribute("msg", "방문예약등록 중 오류가 발생했습니다.");
	        m.addAttribute("url", "/reservation.do");
		}
		return "WEB-INF/realty/redirect";
	}
	
	@GetMapping("/reservation_check.do")
	public String reservation_check() {
		return "WEB-INF/realty/reservation_check";
	}
}
