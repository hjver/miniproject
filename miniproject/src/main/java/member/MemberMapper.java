package member;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {
	public int member_insert(MemberDTO mdto);
	public MemberDTO member_one(String memail);
}
