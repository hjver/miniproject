package reservation;

import lombok.Data;

@Data
public class ReservationDTO {
	int ridx, midx;
	String visit_date, visit_time, visitors;
}
