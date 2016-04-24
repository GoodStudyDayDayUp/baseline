package com.yryj.serviceImpl;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;

import com.yryj.action.ChapterAction;
import com.yryj.dao.ChapterDao;
import com.yryj.model.Chapter;
import com.yryj.sercvice.ChapterManager;

public class ChapterML implements ChapterManager{
	private ChapterDao chapterDao=null;
	private String filePath;	
	public void setChapterDao(ChapterDao chapterDao) {
		this.chapterDao = chapterDao;
	}

	public void save(Chapter chapter) {
		// TODO Auto-generated method stub
		chapterDao.save(chapter);
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		chapterDao.delete(id);
	}

	@Override
	public void update(Chapter chapter) {
		// TODO Auto-generated method stub
		chapterDao.update(chapter);
	}

	@Override
	public Chapter find(int id) {
		// TODO Auto-generated method stub
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
	public String read(int id) {
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
	
	
}
