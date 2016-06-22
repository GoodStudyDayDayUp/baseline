package com.yryj.pub;

import java.text.SimpleDateFormat;
import java.util.HashMap;

public class Format {
	public static HashMap<String,Object> sendEmailTooken=new HashMap<String,Object>();	
	public static SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	public static String WRONG="wrong";
	public static String LOGIN="login";
	public static String DATASTORE="yryj";
	public static String NF="404";
	public static String PICSTORE="Photo";
	public static String managerName="000";
	
	//initPage为登录后要跳转的界面，为0的时候跳转到主界面，
	//为1的时候跳转到write.jsp
	//为2的时候跳转到creat_story.jsp
	public static int initPage=0;


	public static String smtpHost="smtp.qq.com";
	public static String from="1470545610@qq.com";
	public static String fromUserPassword="vebmkjyfnfgejhag";
	public static String subject="一人一句 找回密码";
	public static String messageEnd="'> 找回密码</a>";
	public static String messageStart="尊敬的一人一句用户：<br/> 找回密码请点击链接，<a href='http://localhost:8080/yryj/forget_step2.jsp";
	public static String messageType="text/html;charset=gb2312";
	public static String fromName="一人一句";
	public static String hostPort="587";

	//定义篇章长度的划分点
	public static int maxSmall=3;
	public static int maxMiddle=6;
	
	public static boolean isFind;
	
	/**
	 * 去掉字符串开头和结尾的‘#’
	 * @param str
	 * @return
	 */
	public static String formatString(String str){
		while(str.startsWith("#")){
			str=str.substring(1);
		}
		while(str.endsWith("#")){
			str=str.substring(0, str.length()-1);
		}
		return str;
	}
	
	/**
	 * 从数组rs中查找is是否存在,若存在就从rs中删除is,若不存在就讲is添加到rs中
	 * @param rs
	 * @param is
	 * @return
	 */
	public static String getFromArray(String[] rs,String is){
		 int i=0;
		 int index=0;
		 isFind=false;
		 String rs2String="";
		 
		/*for(;i<rs.length;i++){
			if(rs[i].equals(is)){
				isFind=true;
				i++;
				continue;
			}
			rs2String+=(rs[i]+"#");
		}*/
		for(;i<rs.length;i++){    //获取相同字符串所在的位置
			if(rs[i].equals(is)){
				isFind=true;
				index=i;
			}
		}
		if(isFind){
			for(int j=0;j<rs.length;j++){
				if(j!=index){
					rs2String+=(rs[j]+"#");
				}
			}
			rs2String=rs2String.substring(0,rs2String.length()-1);
		}
		
		if(!isFind){
			for(int k=0;k<rs.length;k++){
				rs2String+=(rs[k]+"#");
			}
			rs2String+=is;
		}
			
		return rs2String;
	}
	
	/**
	 * 判断rs数组中是否存在is
	 * @param rs
	 * @param is
	 * @return
	 */
	public static boolean findInArray(String[] rs,String is){
		for(int i=0;i<rs.length;i++){
			if(rs[i].equals(is)){
				return true;
			}
		}
		return false;
	}
}
