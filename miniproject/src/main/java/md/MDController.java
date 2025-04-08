package md;

import java.io.File;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import common.FileRename;

@Controller
public class MDController {
	
	private static final int cnt_main = 4;  //메인메이지 MD 노출갯수
	private static final int cnt_per_page = 10; //페이지당 출력 갯수
	private static final String upload_dir = "/md_room/";

	@Resource(name="mdDAO")
	MDDAO mdDAO;
	
	@Resource(name="FileRename")
	FileRename fileRename;
	
	@GetMapping("/api_allmd.do")
	@ResponseBody  //JSON 응답을 반환하도록 설정
	public String api_allmd(HttpServletResponse res) throws Exception {
		res.setContentType("text/html;charset=utf-8");
		PrintWriter pw = res.getWriter();
		
		Map<String, Integer> pageinfo = new HashMap<String, Integer>();
		pageinfo.put("pageno", 0);
		pageinfo.put("cnt_per_page", cnt_main);
		List<MDDTO> md_pageall = this.mdDAO.select_md_pageall(pageinfo);
		
		JSONObject alldata = new JSONObject();
		int i=0;
		JSONArray ja = new JSONArray();
		for(MDDTO dto : md_pageall) {
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
	public String md_board(Model m,
			@RequestParam(defaultValue="", required=false) String search,
			@RequestParam(defaultValue="1", required=false) Integer pageno
			) {
		
		int total;
		int pageno_cnt;
		List<MDDTO> md_pageall;
		
		if(search.equals("")) {  //검색어가 없는 경우(전체) 
			total = this.mdDAO.count_md_all();
			pageno_cnt = (int)Math.ceil((double)total/(double)cnt_per_page);  //페이지번호 갯수
		
			Map<String, Integer> pageinfo = new HashMap<String, Integer>();
			pageinfo.put("pageno", pageno-1);
			pageinfo.put("cnt_per_page", cnt_per_page);
			md_pageall = this.mdDAO.select_md_pageall(pageinfo);
		}
		else {  //검색어가 있는 경우 
			total = this.mdDAO.count_md_searchall(search);
			pageno_cnt = (int)Math.ceil((double)total/(double)cnt_per_page);  //페이지번호 갯수
		
			Map<String, Object> searchinfo = new HashMap<String, Object>();
			searchinfo.put("search", search);
			searchinfo.put("pageno", pageno-1);
			searchinfo.put("cnt_per_page", cnt_per_page);
			md_pageall = this.mdDAO.select_md_searchall(searchinfo);
		}
		
		m.addAttribute("total", total);
		m.addAttribute("pageno_cnt", pageno_cnt);
		m.addAttribute("md_pageall", md_pageall);
		m.addAttribute("search", search);
		
		return "/WEB-INF/realty/md_board";
	}
	
	@GetMapping("/md_board_view.do")
	public String md_board_view(@RequestParam("key") int md_idx,  Model m) {
		
		this.mdDAO.update_views_md(md_idx);
		
		MDDTO mdDTO = this.mdDAO.select_md_one(md_idx);
		m.addAttribute("mdDTO", mdDTO);
		
		return "/WEB-INF/realty/md_board_view";
	}
	
	@GetMapping("/md_board_write.do")
	public String md_board_write() {
		return "/WEB-INF/realty/md_board_write";
	}
	
	@PostMapping("/md_board_write_ok.do")
	public String md_board_write_ok(MDDTO mdDTO, MultipartFile nfile, HttpServletRequest req, Model m) throws Exception {
		
		String orifilenm = nfile.getOriginalFilename();
		String newfilenm = this.fileRename.rename(orifilenm);
		String uploadpath = req.getServletContext().getRealPath(upload_dir);
		File upload_full_dir = new File(uploadpath);
		System.out.println(upload_full_dir + newfilenm);
		// 디렉토리가 없으면 생성
		if (!upload_full_dir.exists()) {
			upload_full_dir.mkdirs();
		}
		
		FileCopyUtils.copy(nfile.getBytes(), new File(uploadpath + newfilenm)); //이미지 파일 저장
		
		mdDTO.setMd_img_ori(orifilenm);
		mdDTO.setMd_img_path(upload_dir + newfilenm);
		int result = this.mdDAO.insert_md_notice(mdDTO);
		if(result > 0) {
			int total = this.mdDAO.count_md_all();
			int pageno_cnt = (int)Math.ceil((double)total/(double)cnt_per_page);  //페이지번호 갯수
		
			Map<String, Integer> pageinfo = new HashMap<String, Integer>();
			pageinfo.put("pageno", 0);
			pageinfo.put("cnt_per_page", cnt_per_page);
			List<MDDTO> md_pageall = this.mdDAO.select_md_pageall(pageinfo);
			
			m.addAttribute("total", total);
			m.addAttribute("pageno_cnt", pageno_cnt);
			m.addAttribute("md_pageall", md_pageall);
			m.addAttribute("search", "");
		}
		return "/WEB-INF/realty/md_board";
	}
}
