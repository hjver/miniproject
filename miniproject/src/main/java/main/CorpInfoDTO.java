package main;

import lombok.Data;

@Data
public class CorpInfoDTO {
	String company_name,ceo_name,address,biz_reg_no,telecom_sales_no;
	String privacy_officer,sales_contact,fax_number;
	
	public String getCompany_name() {
		return company_name;
	}
	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}
	public String getCeo_name() {
		return ceo_name;
	}
	public void setCeo_name(String ceo_name) {
		this.ceo_name = ceo_name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getBiz_reg_no() {
		return biz_reg_no;
	}
	public void setBiz_reg_no(String biz_reg_no) {
		this.biz_reg_no = biz_reg_no;
	}
	public String getTelecom_sales_no() {
		return telecom_sales_no;
	}
	public void setTelecom_sales_no(String telecom_sales_no) {
		this.telecom_sales_no = telecom_sales_no;
	}
	public String getPrivacy_officer() {
		return privacy_officer;
	}
	public void setPrivacy_officer(String privacy_officer) {
		this.privacy_officer = privacy_officer;
	}
	public String getSales_contact() {
		return sales_contact;
	}
	public void setSales_contact(String sales_contact) {
		this.sales_contact = sales_contact;
	}
	public String getFax_number() {
		return fax_number;
	}
	public void setFax_number(String fax_number) {
		this.fax_number = fax_number;
	}
}
