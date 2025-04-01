package md;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import type.TypeDTO;

@Mapper
public interface MDMapper {
	public List<MDDTO> select_allmd();
}
