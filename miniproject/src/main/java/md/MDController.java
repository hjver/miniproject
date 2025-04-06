package md;

import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MDController {

	@Resource(name="mdDAO")
	MDDAO mdDAO;
	
	@GetMapping("/api_allmd.do")
	@ResponseBody  //JSON 응답을 반환하도록 설정
	public String api_allmd(HttpServletResponse res) throws Exception {
		res.setContentType("text/html;charset=utf-8");
		PrintWriter pw = res.getWriter();
		
		List<MDDTO> all = this.mdDAO.select_allmd();
		
		JSONObject alldata = new JSONObject();
		int i=0;
		JSONArray ja = new JSONArray();
		for(MDDTO dto : all) {
			JSONObject jo = new JSONObject();	
	        jo.put("md_idx", dto.getMd_idx());
	        jo.put("md_title", dto.getMd_title());
	        jo.put("md_detail", dto.getMd_detail());
	        jo.put("md_img_ori", dto.getMd_img_ori());
	        ja.put(jo);
		}
		alldata.put("md_notice", ja);
        pw.print(alldata);

		pw.close();
		return null;
	}
	
	@GetMapping("/md_board.do")
	public String md_board(Model m) {
		
		List<MDDTO> md_all = this.mdDAO.select_allmd();
		m.addAttribute("md_all", md_all);
		
		return "/WEB-INF/realty/md_board";
	}
	
	@GetMapping("/md_board_view.do")
	public String md_board_view(@RequestParam("key") int md_idx,  Model m) {
		
		MDDTO mdDTO = this.mdDAO.select_onemd(md_idx);
		m.addAttribute("mdDTO", mdDTO);
		
		return "/WEB-INF/realty/md_board_view";
	}
	
	@GetMapping("/md_board_write.do")
	public String md_board_write() {
		return "/WEB-INF/realty/md_board_write";
	}
	
	@PostMapping("/md_board_write_ok.do")
	public String md_board_write_ok(MDDTO mdDTO, Model m) {
		
		List<MDDTO> md_all = this.mdDAO.select_allmd();
		m.addAttribute("md_all", md_all);
		
		return "/WEB-INF/realty/md_board";
	}
}
