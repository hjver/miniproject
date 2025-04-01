package md;

import lombok.Data;

@Data
public class MDDTO {
	int md_index;
	String md_title,md_detail,md_img,md_link;
	public int getMd_index() {
		return md_index;
	}
	public void setMd_index(int md_index) {
		this.md_index = md_index;
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
	public String getMd_img() {
		return md_img;
	}
	public void setMd_img(String md_img) {
		this.md_img = md_img;
	}
	public String getMd_link() {
		return md_link;
	}
	public void setMd_link(String md_link) {
		this.md_link = md_link;
	}
	
}
