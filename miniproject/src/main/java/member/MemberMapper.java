package member;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {
	public Integer selectone_emailck(String memail);
	public int member_insert(MemberDTO mdto);
	public MemberDTO selectone_userck(Map<String, String> user);
	public String selectone_emailsearch(Map<String, String> user);
	public Integer selectone_passwdsearch(Map<String, String> user);
	public int password_change(Map<String, String> user);
}
