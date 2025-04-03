package reservation;

import lombok.Data;

@Data
public class ReservationDTO {
	int ridx, bunyang_index, midx;
	String visit_date, visit_time, visitors;
}
