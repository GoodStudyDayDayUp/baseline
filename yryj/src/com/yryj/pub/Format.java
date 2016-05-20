package com.yryj.pub;

import java.text.SimpleDateFormat;

public class Format {
	public static SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	public static String WRONG="wrong";
	public static String LOGIN="login";
	public static String DATASTORE="yryj";
	public static boolean headerDraft=false;
	
	//定义篇章长度的划分点
	public static int maxSmall=3;
	public static int maxMiddle=6;
	
	public static boolean isFind;
	
	//去掉字符串开头和结尾的‘#’
	public static String formatString(String str){
		while(str.startsWith("#")){
			str=str.substring(1);
		}
		while(str.endsWith("#")){
			str=str.substring(0, str.length()-1);
		}
		return str;
	}
	
	public static String getFromArray(String[] rs,String is){
		 int i=0;
		 isFind=false;
		 String rs2String="";
		 
		for(;i<rs.length;i++){
			if(rs[i].equals(is)){
				isFind=true;
				i++;
				continue;
			}
			rs2String+=(rs[i]+"#");
		}
		rs2String=rs2String.substring(0,rs2String.length()-1);
		if(!isFind)
			rs2String+=("#"+is);
		return rs2String;
	}
	
	public static boolean findInArray(String[] rs,String is){
		for(int i=0;i<rs.length;i++){
			if(rs[i].equals(is)){
				return true;
			}
		}
		return false;
	}
	
}
