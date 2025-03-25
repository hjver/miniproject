package member;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("MemberDAO")
public class MemberDAO {
	
	@Autowired
	private MemberMapper mmapper;
	
	public MemberDTO selectone_emailck(String memail) {
		return mmapper.selectone_emailck(memail);
	}
	
	public int member_insert(MemberDTO mdto) {
		return mmapper.member_insert(mdto);
	}
	
	public MemberDTO selectone_userck(Map<String, String> user) {
		return mmapper.selectone_userck(user);
	}

	/*
	@Resource(name="template")
	public SqlSessionTemplate st;
	
	public int member_insert(MemberDTO mdto) {
		int result = this.st.insert("member_insert", mdto);
		return result;
	}
	*/
}
