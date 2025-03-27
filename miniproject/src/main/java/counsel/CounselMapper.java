package counsel;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CounselMapper {
	public int counselinfo_insert(CounselUserDTO cdto);
}
