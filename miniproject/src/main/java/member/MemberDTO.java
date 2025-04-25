package member;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
public class MemberDTO {
	int midx, mcode;
	String mid, memail,mpasswd,mname,mnicknm,mmobile;
	String age_over14,terms_agree,privacy_agree, marketing_agree;
	String join_date;
}
