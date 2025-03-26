package member;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("MemberDAO")
public class MemberDAO {
	
	@Autowired
	private MemberMapper memberMapper;
	
	public MemberDTO selectone_emailck(String memail) {
		return memberMapper.selectone_emailck(memail);
	}
	
	public int member_insert(MemberDTO mdto) {
		return memberMapper.member_insert(mdto);
	}
	
	public MemberDTO selectone_userck(Map<String, String> user) {
		return memberMapper.selectone_userck(user);
	}
	
	public MemberDTO selectone_emailsearch(Map<String, String> user) {
		return memberMapper.selectone_emailsearch(user);
	}
	
	public MemberDTO selectone_passwdsearch(Map<String, String> user) {
		return memberMapper.selectone_passwdsearch(user);
	}
	
	public int password_change(Map<String, String> user) {
		return memberMapper.password_change(user);
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
