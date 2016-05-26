package com.yryj.action;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URL;
import java.net.URLConnection;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.yryj.daoImpl.ChapterDL;
import com.yryj.model.Activity;
import com.yryj.model.Chapter;
import com.yryj.model.Draft;
import com.yryj.model.Type;
import com.yryj.model.User;
import com.yryj.pub.Format;
import com.yryj.sercvice.ActivityManager;
import com.yryj.sercvice.ChapterManager;
import com.yryj.sercvice.TypeManager;
import com.yryj.serviceImpl.ActivityML;
import com.yryj.serviceImpl.ChapterML;
import com.yryj.serviceImpl.DraftML;
import com.yryj.serviceImpl.TypeML;

public class ChapterAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	private Chapter chapter;
	private ChapterManager chapterManager;
	private String content;
	private String key;
	private String format;
	private String style;
	private int formatId=-1;//��ʽ��types�е�index
	private int styleId=-1;//�����types�е�index
	private int mood=-1;  //moodΪƪ�µĳ������� �� 0Ϊ��ƪ��1��ƪ��2��ƪ


	public ChapterManager getChapterManager() {
		return chapterManager;
	}
	public void setChapterManager(ChapterManager chapterManager) {
		this.chapterManager = chapterManager;
	}
	public Chapter getChapter() {
		return chapter;
	}
	public void setChapter(Chapter chapter) {
		this.chapter = chapter;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}


	public int getFormatId() {
		return formatId;
	}
	public void setFormatId(int formatId) {
		this.formatId = formatId;
	}
	public int getStyleId() {
		return styleId;
	}
	public void setStyleId(int styleId) {
		this.styleId = styleId;
	}
	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}
	public String getFormat() {
		return format;
	}
	public void setFormat(String format) {
		this.format = format;
	}
	public String getStyle() {
		return style;
	}
	public void setStyle(String style) {
		this.style = style;
	}



	public int getMood() {
		return mood;
	}
	public void setMood(int mood) {
		this.mood = mood;
	}
	void getWebChapter(){
		chapter=new Chapter();
		chapter.setContent(content);
		chapter.setKey(Format.formatString(key));
	}

	public String execute() {
		try {
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return Format.WRONG;
		}
	}
	public String write()
	{
		try {
			HttpSession session=ServletActionContext.getRequest().getSession();
			User user =(User) session.getAttribute("user");
			HttpServletRequest request=ServletActionContext.getRequest();
			String header=request.getParameter("he");
			if(header!=null)
				session.setAttribute("parentChapter", null);
			Chapter parent=(Chapter)session.getAttribute("parentChapter");
			getWebChapter();
			if(user==null){
				Draft df=new Draft();
				df.setContent(content);
				if(parent!=null&&header==null){
					df.setParentId(parent.getId());					
					Format.initPage=1;
				}
				session.setAttribute("draft", df);
				session.setAttribute("msg", "��¼֮����ܷ�������~");
				Format.initPage=2;
				return "login";
			}

			//����ǲݸ�������ģ��Ӳݸ�����ɾ����Ӧ�ݸ�
			Draft df=(Draft) session.getAttribute("draft");
			chapterManager=new ChapterML();
			if(df!=null){
				DraftML dm =new DraftML();
				if(df.getId()>=0L){
					dm.delete(df.getId());
					chapter.setParentId(df.getParentId());
					if(df.getParentId()!=-1)
						chapter.setLevel(chapterManager.find(df.getParentId()).getLevel()+1);
					session.setAttribute("draft", null);
				}
			}
			chapter.setUserName(user.getName());
			//���ø��½ں��½ڵĲ�Σ�����ո��½�
			if(parent!=null){
				chapter.setParentId(parent.getId());
				chapter.setLevel(parent.getLevel()+1);
				List<Chapter> siblings=chapterManager.getChildren(parent.getId());
			    chapter.setLeftStory(siblings.size());
				session.setAttribute("parentChapter", null);
			}

			//����type��style
			chapter.setFormat(format);
			chapter.setStyle(style);
			if(chapter.getParentId()==-1){
				if(chapter.getFormat()==null||chapter.getFormat()=="")
					return "main";
			}
			chapterManager.save(chapter);
			//�������µĳ���Ϊ��ƪ��ƪ���߶�ƪ
			List<Chapter> story=(List<Chapter>) session.getAttribute("story");
			if(chapter.getLevel()>Format.maxMiddle&&chapter.getLength()!=2){
				story.get(0).setLength(2);
				chapterManager.update(story.get(0));
			}
			if(chapter.getLevel()<=Format.maxMiddle&&chapter.getLevel()>Format.maxSmall&&chapter.getLength()==0){
				story.get(0).setLength(1);
				chapterManager.update(story.get(0));
			}
			//parentΪ���½�
			if(parent!=null)
				return SUCCESS;
			else
				return "main";
		} catch (Exception e) {
			e.printStackTrace();
			return Format.WRONG;
		}
	}

	public String prepareWrite(){
		try {			
			chapterManager=new ChapterML();
			//��ȡ��ͷ
			HttpServletRequest request=ServletActionContext.getRequest();
			String is=request.getParameter("parentId");
			//���ڵ�ID��
			long index=Long.valueOf(is);
			HttpSession session=request.getSession();
			Chapter parent=chapterManager.find(index);
			session.setAttribute("parentChapter", parent);
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return Format.WRONG;
		}
	}

	public String getStarts(){
		chapterManager=new ChapterML();
		HttpSession session=ServletActionContext.getRequest().getSession();	
		List<Chapter> storys=new ArrayList<Chapter>();
		ArrayList<ArrayList<Type>> types =(ArrayList<ArrayList<Type>>) session.getAttribute("types");

		if(formatId!=-1){
			System.out.println(formatId);
			format=types.get(0).get(formatId).getContent();
			style=types.get(1).get(styleId).getContent();
			storys=chapterManager.getStoryBySF(format, style);
		}			
		System.out.println(storys.size());
		session.setAttribute("storys", storys);
		return SUCCESS;
	}

	//�������еĹ��¿�ͷ
	public String readStart()
	{
		try {			
			chapterManager=new ChapterML();
			HttpSession session=ServletActionContext.getRequest().getSession();	
			//��ȡ���еĿ�ͷ
			List<Chapter> storys=new ArrayList<Chapter>();
			//�ж��Ƿ�Ҫ���ݳ���������storys
			if(mood!=-1){
				storys=chapterManager.getStoryByLength(mood);
			}else{
				storys=chapterManager.getChildren(-1);
			}
			session.setAttribute("storys", storys);

			if(session.getAttribute("types")==null)
			//�ж��Ƿ��Ѿ�������type��
			{
				//��ȡ���е�����
				ArrayList<ArrayList<Type>> types = new ArrayList<ArrayList<Type>>();
				ArrayList<Type> style=new ArrayList<Type>();
				TypeManager typeManager=new TypeML();
							
				//			typeManager.save(new Type(0,1,"С˵"));
				//			typeManager.save(new Type(1,1,"ɢ��"));
				//			typeManager.save(new Type(2,1,"Ϸ��"));
				//			typeManager.save(new Type(3,1,"ʫ��"));
				//			typeManager.save(new Type(4,1,"����"));
				//			typeManager.save(new Type(5,2,"����"));
				//			typeManager.save(new Type(6,2,"����"));
				//			typeManager.save(new Type(7,2,"��"));
				//			typeManager.save(new Type(8,2,"����"));
				//			typeManager.save(new Type(9,2,"�ִ�"));


				//����һ����2������
				style=(ArrayList<Type>) typeManager.getClassByMood(1);
				types.add(style);
				style=(ArrayList<Type>) typeManager.getClassByMood(2);
				types.add(style);
				session.setAttribute("types", types);
				
				
				//���ͼƬ ����
//				Activity act=new Activity();
//				act.setName("123");
//				act.setOwner("abc");
//				act.setPic("C:\Users\15871\Desktop\shenyeshitang\���㳦.jpg");
//				act.setState(1);
//				act.setUrl("www.baidu.com");
//				ActivityManager am=new ActivityML();
//				am.save(act);
			}

			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return Format.WRONG;
		}
	}

	public String readStory(){
		try {			
			chapterManager=new ChapterML();
			//��ȡ��ͷ
			HttpServletRequest request=ServletActionContext.getRequest();
			HttpSession session=request.getSession();
			List<Chapter> story=(List<Chapter>) session.getAttribute("story");
			String is=request.getParameter("index");
			long index = 0;
			if(is!=null){
				//���ڵ�ID��
				index=Long.valueOf(is);
				index=chapterManager.getRootChapter(index);
				if(index==-1)
					return Format.NF;
			}
			else
				index=story.get(0).getId();
			story=chapterManager.getAStoryByTop(index);
			session.setAttribute("story", story);
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return Format.WRONG;
		}
	}

	public String  getLeftOrRight(){
		try {			
			chapterManager=new ChapterML();
			//��ȡ��ͷ
			HttpServletRequest request=ServletActionContext.getRequest();
			String is=request.getParameter("index");
			//���ڵ�ID��
			int index=Integer.valueOf(is);

			//moodΪ0��ʱ��Ϊ��Ϊ1��ʱ��Ϊ����
			String mood=request.getParameter("mood");
			int left=Integer.valueOf(mood);
			boolean isLeft=false;
			if(left==0)
				isLeft=true;
			HttpSession session=request.getSession();
			List<Chapter> lastStory=(List<Chapter>) session.getAttribute("story");
			List<Chapter> leftstory=chapterManager.getStory(lastStory.get(index), isLeft);
			List<Chapter> story=new ArrayList<Chapter>();
			for(int i=0;i<index;i++){
				story.add(lastStory.get(i));
			}

			if(leftstory!=null){
				for(int i=0;i<leftstory.size();i++){
					story.add(leftstory.get(i));
				}
				session.setAttribute("story", story);
			}
			
//			HttpServletResponse response=ServletActionContext.getResponse();
//			PrintWriter writer=response.getWriter();
			
//			writer.print(story);
//			writer.close();
			
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return Format.WRONG;
		}
	}

}