package com.yryj.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.mongodb.gridfs.GridFSDBFile;
import com.opensymphony.xwork2.ActionSupport;
import com.yryj.model.Activity;
import com.yryj.pub.Format;
import com.yryj.sercvice.ActivityManager;
import com.yryj.serviceImpl.ActivityML;

public class ActivityAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	
	@SuppressWarnings("deprecation")
	public String getAllActivity(){
		//GridFSDBFile
//		List<Map<String,Object>> activities=new ArrayList<Map<String,Object>>();
		ActivityManager am=new ActivityML();
		List<Activity> acts=am.getAll();  
		HttpSession session=ServletActionContext.getRequest().getSession();
		session.setAttribute("acts", acts);
		return SUCCESS;
	}
	
	public String getActivityPic(){
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response=ServletActionContext.getResponse(); 
		ServletOutputStream out = null;		
		String path = request.getParameter("path");
		ActivityManager am=new ActivityML();
		GridFSDBFile gridFile=am.writePicFileByPicName(path);
		try {
			out=response.getOutputStream();
			response.reset();
	        response.setContentType("image/jpg");//»ògif
			gridFile.writeTo(out);
			out.flush();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
			if(out!=null){
					out.close();
			}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
	}
}
