package com.yryj.pub;

import java.text.SimpleDateFormat;

public class Format {
	public static SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	public static String WRONG="wrong";
	public static String LOGIN="login";
	public static String DATASTORE="yryj";

	public static String PICSTORE="Photo";
	public static String managerName="000";
	public static String managerPass="000";
	
	//initPageΪ��¼��Ҫ��ת�Ľ��棬Ϊ0��ʱ����ת�������棬
	//Ϊ1��ʱ����ת��write.jsp
	//Ϊ2��ʱ����ת��creat_story.jsp
	public static int initPage=0;


	//����ƪ�³��ȵĻ��ֵ�
	public static int maxSmall=3;
	public static int maxMiddle=6;
	
	public static boolean isFind;
	
	//ȥ���ַ�����ͷ�ͽ�β�ġ�#��
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
