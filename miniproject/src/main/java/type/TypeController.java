package type;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import member.MemberDTO;
import reservation.ReservationDAO;
import reservation.ReservationDTO;

@Controller
public class TypeController {

	@Resource(name="TypeDAO")
	TypeDAO typeDAO;
	
	@Resource(name="ReservationDAO")
	ReservationDAO reserveDAO;
	
	@GetMapping("/api_alltype.do")
	@ResponseBody  //JSON 응답을 반환하도록 설정
	public String api_alltype(HttpServletResponse res) throws Exception {
		res.setContentType("text/html;charset=utf-8");
		PrintWriter pw = res.getWriter();
		
		List<TypeDTO> all = this.typeDAO.select_alltype();
		
		JSONObject alldata = new JSONObject();
		int i=0;
		JSONArray ja = new JSONArray();
		for(TypeDTO dto : all) {
			JSONObject jo = new JSONObject();
            jo.put("bunyang_index", dto.getBunyang_index());
            jo.put("bunyang_title", dto.getBunyang_title());
            jo.put("bunyang_addr", dto.getBunyang_addr());
            jo.put("bunyang_part", dto.getBunyang_part());
            jo.put("bunyang_info", dto.getBunyang_info());
            jo.put("bunyang_date", dto.getBunyang_date());
            jo.put("bunyang_in", dto.getBunyang_in());
            jo.put("bunyang_img", dto.getBunyang_img());
            jo.put("bunyang_str", dto.getBunyang_str());
            jo.put("bunyang_units", dto.getBunyang_units());
            jo.put("bunyang_towers", dto.getBunyang_towers());
            jo.put("bunyang_company", dto.getBunyang_company());
            jo.put("bunyang_tag", dto.getBunyang_tag());
            ja.put(jo);
		}
        alldata.put("type_db", ja);
        pw.print(alldata);

		pw.close();
		return null;
	}
	
	@GetMapping("/week_tails.do")
	public String week_tails(@RequestParam("key") int bunyang_index,
			HttpSession session, Model m){
		
		TypeDTO typeDTO = typeDAO.select_onetype(bunyang_index);
		
		MemberDTO userDTO = (MemberDTO)session.getAttribute("userDTO");
		int midx = userDTO.getMidx();
		Map<String, Integer> reserve = new HashMap<>();
		reserve.put("midx", midx);
		reserve.put("bunyang_index", bunyang_index);
		ReservationDTO reserveDTO = reserveDAO.reservation_selectone(reserve);
		
		Boolean reserved = false;  //midx, bunyang_index 예약여부
		if(reserveDTO != null) {
			reserved = true;
		}
		m.addAttribute("typeDTO", typeDTO);
		m.addAttribute("reserved", reserved);
		
		return "WEB-INF/realty/week_tails";
	}
}
