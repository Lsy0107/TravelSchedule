package com.TravelSchedule.crawling;
import java.util.ArrayList;
import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.PageLoadStrategy;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.TravelSchedule.dto.News;

@Service
public class newsCrawlingService {

	@Autowired
	newsCrawlingDao ndao;
	
	public void getNews() {
		System.out.println("joongang news 크롤링 service");
		System.out.println("service - getPrdList_11st(String searchText)");
		ChromeOptions chromeOptions = new ChromeOptions();
	    chromeOptions.setPageLoadStrategy(PageLoadStrategy.NORMAL);
	    chromeOptions.addArguments("headless");
	    WebDriver driver = new ChromeDriver(chromeOptions);

	    String connectUrl = "https://www.joongang.co.kr/travel/domestic";
        
        driver.get(connectUrl);
        List<WebElement> items = driver.findElements(By.cssSelector("#container > section > section > div > ul > li"));
        ArrayList<News> newsList = ndao.selectNewsList();
        for(WebElement item : items) {
        	String img = "";
        	try {
        	   img = item.findElement(By.cssSelector("figure > a > img")).getAttribute("src");				
			} catch (Exception e) {
				// TODO: handle exception
			}
        	String img_1 = img.split("/_ir_380x213_/l.jpg")[0];
        	System.out.print("img : "+img_1);
        	String title = item.findElement(By.cssSelector("div > h2 > a")).getText();
        	System.out.print(" && title : "+title);
        	String url = item.findElement(By.cssSelector("div > h2 > a")).getAttribute("href");
        	System.out.print(" && url : "+url);
        	String time = item.findElement(By.cssSelector("div.meta > p")).getText();
        	System.out.println(" && time : " + time);
        	boolean eq = true;
        	
        	for(News news : newsList){
        		if(news.getNewtitle().equals(title)) {
        			eq = false;
        			break;
        		}
        	}
        	if(!img.equals("") && eq && title.length()<=50) {
        		int rs = ndao.insertNews(img_1,title,time, url);          		
        	}
        	
        }
        driver.quit();
		
	}

	public ArrayList<News> getNewsList() {
		System.out.println("newsService - getNewsList()");
		return ndao.selectNewsList();
	}

}
