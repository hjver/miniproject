package notice;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

public class NoticeController {

	@Resource(name="NoticeDAO")
	NoticeDAO noticeDAO;
	
	@GetMapping("/my_board.do")
	public String notice(Model m) {
		
		List<NoticeDTO> notice_all = noticeDAO.select_noticeall();
		m.addAttribute("notice_all", notice_all);
		
		return "/WEB-INF/realty/my_board";
	}
	
}
