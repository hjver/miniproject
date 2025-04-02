package reservation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("reservationDAO")
public class ReservationDAO {
	
	@Autowired
	ReservationMapper rMapper;
	
	public int reservation_insert(ReservationDTO rdto) {
		return rMapper.reservation_insert(rdto);
	}
	
	public ReservationDTO reservation_selectone(int midx) {
		return rMapper.reservation_selectone(midx);
	}
}
