package com.yryj.serviceImpl;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import com.yryj.action.ChapterAction;
import com.yryj.dao.ChapterDao;
import com.yryj.daoImpl.ChapterDL;
import com.yryj.model.Chapter;
import com.yryj.model.Story;
import com.yryj.sercvice.ChapterManager;
@SuppressWarnings("rawtypes")
public class ChapterML implements ChapterManager{
	private ChapterDao chapterDao=null;
	private String filePath;
	
	public void save(Chapter chapter) {
		// TODO Auto-generated method stub
		chapterDao = new ChapterDL();
		chapterDao.save(chapter);
	}

	@Override
	public void delete(long id) {
		// TODO Auto-generated method stub
		chapterDao = new ChapterDL();
		chapterDao.delete(id);
	}

	@Override
	public void update(Chapter chapter) {
		// TODO Auto-generated method stub
		chapterDao = new ChapterDL();
		chapterDao.update(chapter);
	}

	@Override
	public Chapter find(long id) {
		// TODO Auto-generated method stub
		chapterDao = new ChapterDL();
		return chapterDao.find(id);
	}
	
	@SuppressWarnings("resource")
	@Override
	public String write(String content,Chapter parent) {
		// TODO Auto-generated method stub
			byte[] data = content.getBytes();
			int numOfChild = chapterDao.getChildren(parent).size();
			String leftName = numOfChild+".txt";
			String fileName = numOfChild+1+".txt";
			if(parent==null)
			{
				filePath = ChapterAction.class.getClassLoader().getResource("").getPath();
				filePath = filePath.split("WEB-INF")[0];
				filePath = filePath+"files/"+fileName;
			}
			else
				filePath = filePath.replaceAll(leftName, fileName);
			filePath = filePath.replaceAll("\\\\", "/");
			try {
				File file = new File(filePath);
				FileOutputStream outStream = new FileOutputStream(file);
				outStream.write(data);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
			return filePath;
	}

	@Override
	public String read(long id) {
		// TODO Auto-generated method stub
		Chapter chapter = chapterDao.find(id);
		filePath = chapter.getContent();
		String content = "";
		try {
            String encoding="GBK";
            File file=new File(filePath);
            
            if(file.isFile() && file.exists()){ //判断文件是否存在
                InputStreamReader read = new InputStreamReader(
                new FileInputStream(file),encoding);//考虑到编码格式
                BufferedReader bufferedReader = new BufferedReader(read);
                String lineTxt = null;
                while((lineTxt = bufferedReader.readLine()) != null){
                   content = content + lineTxt + "\n";
                }
                read.close();
		    }else{
		        content = "找不到指定的文件";
		    }
	    } catch (Exception e) {
        	content = "读取文件内容出错";
	        e.printStackTrace();
	    }
		return content;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List getTree(Story story) {
		// TODO Auto-generated method stub
		Chapter rootChapter = chapterDao.find(story.getChapter().getId());
		List list = new ArrayList();
		list.add(rootChapter);
		list.addAll(traversal(list));
		return list;
	}
	@SuppressWarnings("unchecked")
	private List traversal(List list)
	{
		List childList = new ArrayList<Chapter>();
		for(int i=0;i<list.size();i++)
		{
			List cNode = traversal(chapterDao.getChildren((Chapter)list.get(i)));
			childList.addAll(cNode);
		}
		return childList;
	}

	@Override
	public List getChildren(Chapter parent) {
		// TODO Auto-generated method stub
		return chapterDao.getChildren(parent);
	}
	
}
