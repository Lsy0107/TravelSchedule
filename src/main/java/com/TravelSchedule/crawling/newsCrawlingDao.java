package com.TravelSchedule.crawling;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.TravelSchedule.dto.News;

public interface newsCrawlingDao {

	int insertNews(@Param("img")String img, @Param("title")String title, @Param("time")String time, @Param("url") String url);

	ArrayList<News> selectNewsList();

	
}
