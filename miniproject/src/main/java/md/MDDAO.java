package md;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("mdDAO")
public class MDDAO {

	@Autowired
	private MDMapper mdMapper;
	
	public int count_md_all() {
		return mdMapper.count_md_all();
	}
	
	public List<MDDTO> select_md_pageall(Map<String, Integer> pageinfo) {
		return mdMapper.select_md_pageall(pageinfo);
	}

	public int count_md_searchall(String search) {
		return mdMapper.count_md_searchall(search);
	}
	
	public List<MDDTO> select_md_searchall(Map<String, Object> pageinfo) {
		return mdMapper.select_md_searchall(pageinfo);
	}
	
	public MDDTO select_md_one(int md_idx) {
		return mdMapper.select_md_one(md_idx);
	}
	
	public int update_views_md(int md_idx) {
		return mdMapper.update_views_md(md_idx);
	}
}

