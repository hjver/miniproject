package md;

import lombok.Data;

@Data
public class MDDTO {
	int md_idx,nviews;
	String md_title,md_detail,md_img_ori,md_img_pass,nwriter,reg_date;
	
	public int getMd_idx() {
		return md_idx;
	}
	public void setMd_idx(int md_idx) {
		this.md_idx = md_idx;
	}
	public int getNviews() {
		return nviews;
	}
	public void setNviews(int nviews) {
		this.nviews = nviews;
	}
	public String getMd_title() {
		return md_title;
	}
	public void setMd_title(String md_title) {
		this.md_title = md_title;
	}
	public String getMd_detail() {
		return md_detail;
	}
	public void setMd_detail(String md_detail) {
		this.md_detail = md_detail;
	}
	public String getMd_img_ori() {
		return md_img_ori;
	}
	public void setMd_img_ori(String md_img_ori) {
		this.md_img_ori = md_img_ori;
	}
	public String getMd_img_pass() {
		return md_img_pass;
	}
	public void setMd_img_pass(String md_img_pass) {
		this.md_img_pass = md_img_pass;
	}
	public String getNwriter() {
		return nwriter;
	}
	public void setNwriter(String nwriter) {
		this.nwriter = nwriter;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}	
}
