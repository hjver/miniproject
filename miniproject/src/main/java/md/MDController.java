package md;

import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import type.TypeDAO;
import type.TypeDTO;

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
	        jo.put("md_index", dto.getMd_index());
	        jo.put("md_title", dto.getMd_title());
	        jo.put("md_detail", dto.getMd_detail());
	        jo.put("md_img", dto.getMd_img());
	        jo.put("md_link", dto.getMd_link());
	        ja.put(jo);
		}
		alldata.put("md_db", ja);
        pw.print(alldata);

		pw.close();
		return null;
	}
}
