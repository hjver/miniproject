package counsel;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("CounselDAO")
public class CounselDAO {
	
	@Autowired
	private CounselMapper counselMapper;
	
	public int counselinfo_insert(CounselUserDTO cdto) {
		return counselMapper.counselinfo_insert(cdto);
	}
}
