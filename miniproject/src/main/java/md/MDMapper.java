package md;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import type.TypeDTO;

@Mapper
public interface MDMapper {
	public List<MDDTO> select_allmd();
	public MDDTO select_onemd(int md_idx);
	public int update_mdviews(int md_idx);
}
