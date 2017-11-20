package com.jang.example;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;

public class DownladGif {
	public static void downlad(String gifName, String gifUrl, String savePath) {
		URLConnection conn = null;
		URL url = null;
		InputStream is = null;
		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;
		OutputStream os = null;
		try {
			url = new URL(gifUrl);     //定义下载连接
			conn = url.openConnection();  //打开链接
			conn.setConnectTimeout(100);      //设置链接时间
			is = conn.getInputStream();       //定义输入流
			bis = new BufferedInputStream(is, 10000); //定义缓冲流
			byte[] bs = new byte[1024];
			int len;
			File sf = new File(savePath);          
			if (!sf.exists()) {
				sf.mkdirs();                             //新建存放图片的文件夹
			}
			os = new FileOutputStream(sf.getPath() + "\\" + gifName);
			bos = new BufferedOutputStream(os, 1000000);
			while ((len = bis.read(bs)) != -1) {
				bos.write(bs, 0, len);
			}
			bos.close();        
			bis.close();
			os.close();
			is.close();                       //关闭流

		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
