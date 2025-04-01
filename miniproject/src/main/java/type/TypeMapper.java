package type;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TypeMapper {
	public List<TypeDTO> select_alltype();
	public TypeDTO select_onetype(int bunyang_index);
}
