package counsel;

import java.util.List;

import lombok.Data;

@Data
public class CounselUserDTO {
    private int cidx;  // 상담 요청 고유번호 (PK)
    private int midx;  // 회원 고유번호 (FK)
    private List<String> rental_type; // 임대 형태 (SET 타입)
    private List<String> housing_type; // 주거 형태 (SET 타입)
    private String preferred_date; // 상담 희망일자
    private String ctext; // 상담 내용
    
    // rentalType과 housingType을 DB에서 저장할 수 있도록 변환하는 메소드 추가
    public String getRental_type_toString() {
        return rental_type != null ? String.join(",", rental_type) : "";
    }

    public String getHousing_type_toString() {
        return housing_type != null ? String.join(",", housing_type) : "";
    }
}
