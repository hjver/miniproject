package type;

import lombok.Data;

@Data
public class TypeDTO {
	int bunyang_index,bunyang_units,bunyang_towers;
	String bunyang_title,bunyang_addr,bunyang_part,bunyang_info;
	String bunyang_date,bunyang_in,bunyang_img,bunyang_str;
	String bunyang_company,bunyang_tag;
	
	public int getBunyang_index() {
		return bunyang_index;
	}
	public void setBunyang_index(int bunyang_index) {
		this.bunyang_index = bunyang_index;
	}
	public int getBunyang_units() {
		return bunyang_units;
	}
	public void setBunyang_units(int bunyang_units) {
		this.bunyang_units = bunyang_units;
	}
	public int getBunyang_towers() {
		return bunyang_towers;
	}
	public void setBunyang_towers(int bunyang_towers) {
		this.bunyang_towers = bunyang_towers;
	}
	public String getBunyang_title() {
		return bunyang_title;
	}
	public void setBunyang_title(String bunyang_title) {
		this.bunyang_title = bunyang_title;
	}
	public String getBunyang_addr() {
		return bunyang_addr;
	}
	public void setBunyang_addr(String bunyang_addr) {
		this.bunyang_addr = bunyang_addr;
	}
	public String getBunyang_part() {
		return bunyang_part;
	}
	public void setBunyang_part(String bunyang_part) {
		this.bunyang_part = bunyang_part;
	}
	public String getBunyang_info() {
		return bunyang_info;
	}
	public void setBunyang_info(String bunyang_info) {
		this.bunyang_info = bunyang_info;
	}
	public String getBunyang_date() {
		return bunyang_date;
	}
	public void setBunyang_date(String bunyang_date) {
		this.bunyang_date = bunyang_date;
	}
	public String getBunyang_in() {
		return bunyang_in;
	}
	public void setBunyang_in(String bunyang_in) {
		this.bunyang_in = bunyang_in;
	}
	public String getBunyang_img() {
		return bunyang_img;
	}
	public void setBunyang_img(String bunyang_img) {
		this.bunyang_img = bunyang_img;
	}
	public String getBunyang_str() {
		return bunyang_str;
	}
	public void setBunyang_str(String bunyang_str) {
		this.bunyang_str = bunyang_str;
	}
	public String getBunyang_company() {
		return bunyang_company;
	}
	public void setBunyang_company(String bunyang_company) {
		this.bunyang_company = bunyang_company;
	}
	public String getBunyang_tag() {
		return bunyang_tag;
	}
	public void setBunyang_tag(String bunyang_tag) {
		this.bunyang_tag = bunyang_tag;
	}
	
	
}