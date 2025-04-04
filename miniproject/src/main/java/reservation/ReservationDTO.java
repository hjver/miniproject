package reservation;

import lombok.Data;

@Data
public class ReservationDTO {
	int ridx, midx, bunyang_index;
	String visit_date, visit_time, visitors;
}
