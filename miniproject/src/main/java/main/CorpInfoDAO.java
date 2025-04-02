package main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import md.MDDTO;

@Repository("corpinfoDAO")
public class CorpInfoDAO {

	@Autowired
	CorpInfoMapper corpinfoMapper;
	
	public CorpInfoDTO select_corpinfo(){
		return corpinfoMapper.select_corpinfo();
	}
}
