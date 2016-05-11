package com.yryj.action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.yryj.model.Chapter;
import com.yryj.model.Relations;
import com.yryj.model.User;
import com.yryj.pub.Format;
import com.yryj.sercvice.ChapterManager;
import com.yryj.sercvice.RelationsManager;
import com.yryj.serviceImpl.ChapterML;
import com.yryj.serviceImpl.RelationsML;

public class RelationAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	private RelationsManager relationManager; 


	//���޲���
	public String setLove(){
		try {

			HttpSession session=ServletActionContext.getRequest().getSession();
			User user =(User) session.getAttribute("user");
			if(user==null)
				return Format.LOGIN;

			HttpServletRequest request=ServletActionContext.getRequest();
			String is=request.getParameter("id");
			if(is==null)
				return Format.LOGIN;
			String relations="";
			long chapterId=Integer.valueOf(is);		

			ChapterManager cm=new ChapterML(); 
			relationManager=new RelationsML();

			Relations relation=relationManager.findByUserId(user.getId());

			//���û�����û�н�����ϵ
			if(relation==null){
				relation=new Relations();
				relation.setU2cZan(is);
				relationManager.save(relation);
				return null;
			}

			relations=relation.getU2cZan();

			if(relations!=""){
				//�Ѿ���#���������ˣ���������
				if(relations.indexOf("#")!=-1){
					String [] rs=relations.split("#");
					String rs2String = Format.getFromArray(rs,is);
					relation.setU2cZan(rs2String);

				}else{
					if(relation.getU2cZan().equals(is))
						relation.setU2cZan("");
					else{
						relations+=("#"+is);
						relation.setU2cZan(relations);
					}

				}
			}else{

				relation.setU2cZan(is);

			}
			
			relationManager.update(relation);

			//�޸��½ڵĵ�����
			
			Chapter chapter=cm.find(chapterId);
			if(Format.isFind){
				chapter.setZan(chapter.getZan()-1);
				Format.isFind=false;
			}
			else
				chapter.setZan(chapter.getZan()+1);
			cm.update(chapter);

			return null;			
		} catch (Exception e) {
			e.printStackTrace();
			return Format.WRONG;
		}
	}

	
}
