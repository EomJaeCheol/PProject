package com.DatabaseContents.Action;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

public class Naver {
	
	
	
	public String Time() throws IOException{
		
		//파싱할 주소를 target 한다
		String target="https://www.naver.com/";
		//객체 생성
		//URL로 target된 페이지를 열어준다.
		//ctrl+shift+o 라이브러리 자동추가
		HttpURLConnection con=(HttpURLConnection) new URL(target).openConnection();
		//con 안에는 URL에 설정된 페이지를 연결할수 있는 정보가 들어가게 된다.
		//파싱후 데이터를 담기 위해 BufferedReader사용
		BufferedReader br= new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
		String temp;
		String str=null;
		//한줄씩 읽어들일수 있게 함
		while((temp=br.readLine())!=null){
			if(temp.contains("var svt = \"")){
				temp=temp.split("var svt = \"")[1].split("\";")[0];
				int year=Integer.parseInt(temp.substring(0, 4));
				int month=Integer.parseInt(temp.substring(4,6));
				int day=Integer.parseInt(temp.substring(6,8));
				int hour=Integer.parseInt(temp.substring(8,10));
				int minute=Integer.parseInt(temp.substring(10,12));
				int second=Integer.parseInt(temp.substring(12,14));
				str=year+"-0"+month+"-0"+day+" "+"\n"+hour+":"+minute+":"+second;
				//System.out.println(year+"년"+month+"월"+day+"일"+hour+"시"+minute+"분"+second+"초");
				
			}
		}
		con.disconnect();
		br.close();
	
		return str;
	}

}
