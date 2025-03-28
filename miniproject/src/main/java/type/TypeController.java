package type;

import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TypeController {

	@Resource(name="typeDAO")
	TypeDAO typeDAO;
	
	@GetMapping("/api_alltype.do")
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
}
