package notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("NoticeDAO")
public class NoticeDAO {

	@Autowired
	NoticeMapper noticeMapper;
	
	public List<NoticeDTO> select_noticeall(){
		return noticeMapper.select_noticeall();
	}
}
