package type;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("typeDAO")
public class TypeDAO {

	@Autowired
	private TypeMapper typeMapper;
	
	public List<TypeDTO> select_alltype() {
		return typeMapper.select_alltype();
	}
}
