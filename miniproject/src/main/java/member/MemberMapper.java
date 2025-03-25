package member;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {
	public MemberDTO selectone_emailck(String memail);
	public int member_insert(MemberDTO mdto);
	public MemberDTO selectone_userck(Map<String, String> user);
}
