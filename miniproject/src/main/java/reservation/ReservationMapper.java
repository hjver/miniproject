package reservation;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import member.MemberDTO;

@Mapper
public interface ReservationMapper {
	public int reservation_insert(ReservationDTO rdto);
	public ReservationDTO reservation_selectone(Map<String, Integer> reserve);
}
