package notice;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface NoticeMapper {
	public List<NoticeDTO> select_noticeall();
}
