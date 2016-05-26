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


	//点赞操作
	public String setLove(){
		try {

			HttpSession session=ServletActionContext.getRequest().getSession();
			User user =(User) session.getAttribute("user");
			if(user==null){
				session.setAttribute("msg", "请先登录");
				return Format.LOGIN;
			}

			HttpServletRequest request=ServletActionContext.getRequest();
			String is=request.getParameter("id");
			String relations="";
			long chapterId=Integer.valueOf(is);		

			ChapterManager cm=new ChapterML(); 
			relationManager=new RelationsML();

			Relations relation=relationManager.findByUserId(user.getId());

			//新用户，还没有建立关系
			if(relation==null){
				relation=new Relations();
				relation.setU2cZan(is);
				relation.setuId(user.getId());
				relationManager.save(relation);
				Chapter chapter=cm.find(chapterId);
				chapter.setZan(chapter.getZan()+1);
				cm.update(chapter);
				return null;
			}

			relations=relation.getU2cZan();

			if(relations!=""){
				//已经用#连接起来了，至少两个
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

			//修改章节的点赞数
			
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

	//收藏操作
		public String setStore(){
			try {

				HttpSession session=ServletActionContext.getRequest().getSession();
				User user =(User) session.getAttribute("user");
				if(user==null){
					session.setAttribute("msg", "请先登录");
					return Format.LOGIN;
				}

				HttpServletRequest request=ServletActionContext.getRequest();
				String is=request.getParameter("id");
				String relations="";	

				relationManager=new RelationsML();

				Relations relation=relationManager.findByUserId(user.getId());

				//新用户，还没有建立关系
				if(relation==null){
					relation=new Relations();
					relation.setU2cStore(is);
					relation.setuId(user.getId());
					relationManager.save(relation);
					return null;
				}

				relations=relation.getU2cStore();

				if(relations!=""){
					//已经用#连接起来了，至少两个
					if(relations.indexOf("#")!=-1){
						String [] rs=relations.split("#");
						String rs2String = Format.getFromArray(rs,is);
						relation.setU2cStore(rs2String);

					}else{
						if(relation.getU2cStore().equals(is))
							relation.setU2cStore("");
						else{
							relations+=("#"+is);
							relation.setU2cStore(relations);
						}

					}
				}else{

					relation.setU2cStore(is);

				}
				
				relationManager.update(relation);

			
				return null;			
			} catch (Exception e) {
				e.printStackTrace();
				return Format.WRONG;
			}
		}
		
		
		//关注操作
			public String setAttention(){
				try {

					HttpSession session=ServletActionContext.getRequest().getSession();
					User user =(User) session.getAttribute("user");
					if(user==null){
						session.setAttribute("msg", "请先登录");
						return Format.LOGIN;
					}

					//获取要关注的用户的id
					HttpServletRequest request=ServletActionContext.getRequest();
					String i2uId=request.getParameter("id");
					
					String relations="";	// 当前用户关注列表
					String relations1="";	//被关注的用户的粉丝列表

					relationManager=new RelationsML();

					Relations relation=relationManager.findByUserId(user.getId());     //新增我的关注
					Relations relation1=relationManager.findByUserId(Integer.parseInt(i2uId));    //新增我的粉丝

					//新用户，还没有建立关系
					if(relation==null){
						relation=new Relations();
						relation.setI2u(i2uId);
						relation.setuId(user.getId());
						relationManager.save(relation);
						
					}
					if(relation1==null){
						relation1=new Relations();
						relation1.setU2i(String.valueOf(user.getId()));
						relation1.setuId(Integer.parseInt(i2uId));
						relationManager.save(relation1);
						
					}
					

					relations=relation.getI2u();
					relations1=relation1.getU2i();

					if(relations!=""){
						//已经用#连接起来了，至少两个
						if(relations.indexOf("#")!=-1){
							String [] rs=relations.split("#");
							String rs2String = Format.getFromArray(rs,i2uId);
							relation.setU2cStore(rs2String);

						}else{
							if(relation.getI2u().equals(i2uId))
								relation.setI2u("");
							else{
								relations+=("#"+i2uId);
								relation.setI2u(relations);
							}

						}
					}else{

						relation.setI2u(i2uId);

					}
					
					if(relations1!=""){
						//已经用#连接起来了，至少两个
						if(relations1.indexOf("#")!=-1){
							String [] rs=relations1.split("#");
							String rs2String = Format.getFromArray(rs,String.valueOf(user.getId()));
							relation1.setU2cStore(rs2String);

						}else{
							if(relation1.getU2i().equals(String.valueOf(user.getId())))
								relation1.setU2i("");
							else{
								relations1+=("#"+String.valueOf(user.getId()));
								relation1.setU2i(relations1);
							}

						}
					}else{

						relation1.setU2i(String.valueOf(user.getId()));

					}
					
					relationManager.update(relation);
					relationManager.update(relation1);

				
					return "success";			
				} catch (Exception e) {
					e.printStackTrace();
					return Format.WRONG;
				}
			}

}
