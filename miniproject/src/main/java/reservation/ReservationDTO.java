package reservation;

import lombok.Data;

@Data
public class ReservationDTO {
	int ridx, midx, bunyang_index;
	String visit_date, visit_time, visitors, bunyang_title;
	
	public String getBunyang_title() {
		return bunyang_title;
	}
	public void setBunyang_title(String bunyang_title) {
		this.bunyang_title = bunyang_title;
	}
	public int getRidx() {
		return ridx;
	}
	public void setRidx(int ridx) {
		this.ridx = ridx;
	}
	public int getMidx() {
		return midx;
	}
	public void setMidx(int midx) {
		this.midx = midx;
	}
	public int getBunyang_index() {
		return bunyang_index;
	}
	public void setBunyang_index(int bunyang_index) {
		this.bunyang_index = bunyang_index;
	}
	public String getVisit_date() {
		return visit_date;
	}
	public void setVisit_date(String visit_date) {
		this.visit_date = visit_date;
	}
	public String getVisit_time() {
		return visit_time;
	}
	public void setVisit_time(String visit_time) {
		this.visit_time = visit_time;
	}
	public String getVisitors() {
		return visitors;
	}
	public void setVisitors(String visitors) {
		this.visitors = visitors;
	}
}
