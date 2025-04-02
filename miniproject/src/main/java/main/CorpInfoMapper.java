package main;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CorpInfoMapper {
	public CorpInfoDTO select_corpinfo();
}
