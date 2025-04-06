package member;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
public class MemberDTO {
	int midx;
	String memail,mpasswd,mname,mmobile;
	String age_over14,terms_agree,privacy_agree, marketing_agree;
	String join_date;
	
	public int getMidx() {
		return midx;
	}
	public void setMidx(int midx) {
		this.midx = midx;
	}
	public String getMemail() {
		return memail;
	}
	public void setMemail(String memail) {
		this.memail = memail;
	}
	public String getMpasswd() {
		return mpasswd;
	}
	public void setMpasswd(String mpasswd) {
		this.mpasswd = mpasswd;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMmobile() {
		return mmobile;
	}
	public void setMmobile(String mmobile) {
		this.mmobile = mmobile;
	}
	public String getAge_over14() {
		return age_over14;
	}
	public void setAge_over14(String age_over14) {
		this.age_over14 = age_over14;
	}
	public String getTerms_agree() {
		return terms_agree;
	}
	public void setTerms_agree(String terms_agree) {
		this.terms_agree = terms_agree;
	}
	public String getPrivacy_agree() {
		return privacy_agree;
	}
	public void setPrivacy_agree(String privacy_agree) {
		this.privacy_agree = privacy_agree;
	}
	public String getMarketing_agree() {
		return marketing_agree;
	}
	public void setMarketing_agree(String marketing_agree) {
		this.marketing_agree = marketing_agree;
	}
	public String getJoin_date() {
		return join_date;
	}
	public void setJoin_date(String join_date) {
		this.join_date = join_date;
	}
}
