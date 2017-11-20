package com.jang.example;

import java.util.List;

import us.codecraft.webmagic.Page;
import us.codecraft.webmagic.Site;
import us.codecraft.webmagic.Spider;
import us.codecraft.webmagic.processor.PageProcessor;

public class practce implements PageProcessor {
	private Site site = Site.me().setRetryTimes(1).setSleepTime(1000).addHeader("User-Agent",
			"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:56.0) Gecko/20100101 Firefox/56.0");

	@Override
	public Site getSite() {

		return site;
	}

	@Override
	public void process(Page page) {
		// List<String> jpg =
		// page.getHtml().xpath("//div[@class='slide']/a/img/@src").all();
		List<String> gifTitle = page.getJson().jsonPath("$..title").all(); // 将爬出的gif的名称存入数组
		List<String> gifUrl = page.getJson().jsonPath("$..icon").all();    //将爬出的gif的链接存入数组
		String imageUrl = "http:";
		for (int i = 0; i < gifTitle.size(); i++) {
			DownladGif.downlad(gifTitle.get(i) + ".gif", imageUrl + gifUrl.get(i), "d:\\image");    //传递参数以供下载
		}

		/*
		 * for (String a : jpg) { i++; System.out.println(i + ":\t" + a); }
		 */

	}

	public static void main(String[] args) {
		Spider.create(new practce()).addUrl("https://www.bilibili.com/index/index-icon.json").thread(1).run();   //启动爬虫
	}

}
