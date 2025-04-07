package md;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import type.TypeDTO;

@Mapper
public interface MDMapper {
	public int count_md_all();
	public List<MDDTO> select_md_pageall(Map<String, Integer> pageinf);
	public int count_md_searchall(String search);
	public List<MDDTO> select_md_searchall(Map<String, Object> searchinf);
	public MDDTO select_md_one(int md_idx);
	public int update_views_md(int md_idx);
}
