package md;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("mdDAO")
public class MDDAO {

	@Autowired
	private MDMapper mdMapper;
	
	public List<MDDTO> select_allmd() {
		return mdMapper.select_allmd();
	}
}

