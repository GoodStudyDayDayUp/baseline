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
	
	//initPageΪ��¼��Ҫ��ת�Ľ��棬Ϊ0��ʱ����ת�������棬
	//Ϊ1��ʱ����ת��write.jsp
	//Ϊ2��ʱ����ת��creat_story.jsp
	public static int initPage=0;


	public static String smtpHost="smtp.qq.com";
	public static String from="1470545610@qq.com";
	public static String fromUserPassword="vebmkjyfnfgejhag";
	public static String subject="һ��һ�� �һ�����";
	public static String messageEnd="'> �һ�����</a>";
	public static String messageStart="�𾴵�һ��һ���û���<br/> �һ������������ӣ�<a href='http://localhost:8080/yryj/forget_step2.jsp";
	public static String messageType="text/html;charset=gb2312";
	public static String fromName="һ��һ��";
	public static String hostPort="587";

	//����ƪ�³��ȵĻ��ֵ�
	public static int maxSmall=3;
	public static int maxMiddle=6;
	
	public static boolean isFind;
	
	/**
	 * ȥ���ַ�����ͷ�ͽ�β�ġ�#��
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
	 * ������rs�в���is�Ƿ����,�����ھʹ�rs��ɾ��is,�������ھͽ�is��ӵ�rs��
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
		for(;i<rs.length;i++){    //��ȡ��ͬ�ַ������ڵ�λ��
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
	 * �ж�rs�������Ƿ����is
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
