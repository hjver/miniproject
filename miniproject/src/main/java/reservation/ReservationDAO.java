package reservation;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("ReservationDAO")
public class ReservationDAO {
	
	@Autowired
	ReservationMapper rMapper;
	
	public int reservation_insert(ReservationDTO rdto) {
		return rMapper.reservation_insert(rdto);
	}
	
	public ReservationDTO reservation_selectone(Map<String, Integer> reserve) {
		return rMapper.reservation_selectone(reserve);
	}
	
	public List<ReservationDTO> reservation_selectall(int midx){
		return rMapper.reservation_selectall(midx);
	}
	
	public int reservation_count(int midx) {
		return rMapper.reservation_count(midx);
	}
	
	public int reservation_delete(int ridx) {
		return rMapper.reservation_delete(ridx);
	}
}
