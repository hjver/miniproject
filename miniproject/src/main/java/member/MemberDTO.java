package member;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberDTO {
	int midx;
	String memail,mpasswd,mname,mmobile;
	String age_over14,terms_agree,privacy_agree, marketing_agree;
	String join_date;
}
