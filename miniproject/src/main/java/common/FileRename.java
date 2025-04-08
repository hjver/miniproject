package common;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

@Repository("FileRename")
public class FileRename {
	
	@Resource(name="RandomNumber")
	RandomNumber rNumber;
	
	public String rename(String filenm) {
		//파일 속성
		int pos = filenm.lastIndexOf(".");
		String fnm = filenm.substring(pos);
		
		//날짜
		Date day = new Date();
		SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");
		String today = sf.format(day);  //년월일
		
		//4자리 랜덤값
		String no = rNumber.make_num(4);
		String file_rename = today + no + fnm; //파일명 예시)202503301234.jpg
		
		return file_rename;
	}
}
