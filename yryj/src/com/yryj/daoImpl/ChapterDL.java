package com.yryj.daoImpl;

import java.net.UnknownHostException;
import java.util.List;

import org.springframework.orm.hibernate4.support.HibernateDaoSupport;

import com.google.code.morphia.Datastore;
import com.google.code.morphia.Key;
import com.google.code.morphia.Morphia;
import com.google.code.morphia.query.UpdateOperations;
import com.mongodb.Mongo;
import com.mongodb.MongoException;
import com.mongodb.WriteResult;
import com.yryj.dao.ChapterDao;
import com.yryj.model.Chapter;


public class ChapterDL implements ChapterDao{
	String dbs;
	
	public ChapterDL(){
		dbs="yryj";
	}
	
	@Override
	public Key<Chapter> save(Chapter chapter) {
		// TODO Auto-generated method stub
		try {
			Morphia mor=new Morphia();
			Mongo mongo;
			mongo = new Mongo();
			Datastore ds=mor.createDatastore(mongo, dbs);
			List<Chapter> chs=ds.createQuery(Chapter.class).order("-id").asList();
			long id = 0;
			if(chs.size()>0)
				id=chs.get(chs.size()-1).getId()+1;
			chapter.setId(id);
			
			return ds.save(chapter);
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MongoException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public void delete(long id) {
		// TODO Auto-generated method stub
		try {
			Morphia mor=new Morphia();
			Mongo mongo=new Mongo();
			Datastore ds=mor.createDatastore(mongo, dbs);
			ds.delete(Chapter.class,id);
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MongoException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public void update(Chapter chapter) {
		// TODO Auto-generated method stub
		try {
			Morphia mor=new Morphia();
			Mongo mongo=new Mongo();
			Datastore ds=mor.createDatastore(mongo, dbs);
			
			UpdateOperations<Chapter> ch = ds.createUpdateOperations(Chapter.class);
			//修改内容包含：点赞数,是否结束,浏览次数
			ch.set("zan", chapter.getZan()).set("isEnd", chapter.isEnd()).set("viewNum", chapter.getViewNum());
			ds.update(ds.find(Chapter.class, "_id", chapter.getId()).getKey(), ch);
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MongoException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public Chapter find(long  id) {
		// TODO Auto-generated method stub
		try {
			Morphia mor=new Morphia();
			Mongo mongo=new Mongo();
			Datastore ds=mor.createDatastore(mongo, dbs);
			return ds.find(Chapter.class,"_id",id).get();
			} catch (Exception e) {
	            e.printStackTrace();
	        }
			  
			return null;
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List getChildren(long parentId) {
		// TODO Auto-generated method stub
		try {
			Morphia mor=new Morphia();
			Mongo mongo=new Mongo();
			Datastore ds=mor.createDatastore(mongo, dbs);
			return ds.find(Chapter.class,"parentId",parentId).asList();
			} catch (Exception e) {
	            e.printStackTrace();
	        }
			  
			return null;
	}

	@Override
	public List getChapterByUName(String name) {
		// TODO Auto-generated method stub
		try {
			Morphia mor=new Morphia();
			Mongo mongo=new Mongo();
			Datastore ds=mor.createDatastore(mongo, dbs);
			return ds.find(Chapter.class,"userName",name).asList();
			} catch (Exception e) {
	            e.printStackTrace();
	        }
			  
			return null;
	}

}
