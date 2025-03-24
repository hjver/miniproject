package member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("MemberDAO")
public class MemberDAO {
	
	@Autowired
	private MemberMapper mmapper;
	
	public int member_insert(MemberDTO mdto) {
		return mmapper.member_insert(mdto);
	}
	
	public MemberDTO member_one(String memail) {
		return mmapper.member_one(memail);
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
