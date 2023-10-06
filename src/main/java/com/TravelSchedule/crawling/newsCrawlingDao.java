package com.TravelSchedule.crawling;

import org.apache.ibatis.annotations.Param;

public interface newsCrawlingDao {

	int insertNews(@Param("img")String img, @Param("title")String title, @Param("time")String time, @Param("url") String url);

	
}
