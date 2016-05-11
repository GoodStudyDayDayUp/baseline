package com.yryj.daoImpl;

import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.List;

import com.google.code.morphia.Datastore;
import com.google.code.morphia.Key;
import com.google.code.morphia.Morphia;
import com.google.code.morphia.query.UpdateOperations;
import com.mongodb.Mongo;
import com.mongodb.MongoException;
import com.mongodb.WriteResult;
import com.yryj.dao.ChapterDao;
import com.yryj.model.Chapter;
import com.yryj.pub.Format;


public class ChapterDL implements ChapterDao{
	String dbs;

	public ChapterDL(){
		dbs=Format.DATASTORE;
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

//	@Override
//	public void delete(long id) {
//		// TODO Auto-generated method stub
//		try {
//			Morphia mor=new Morphia();
//			Mongo mongo=new Mongo();
//			Datastore ds=mor.createDatastore(mongo, dbs);
//			ds.delete(Chapter.class,id);
//		} catch (UnknownHostException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (MongoException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//	}

	@Override
	public void update(Chapter chapter) {
		// TODO Auto-generated method stub
		try {
			Morphia mor=new Morphia();
			Mongo mongo=new Mongo();
			Datastore ds=mor.createDatastore(mongo, dbs);

			UpdateOperations<Chapter> ch = ds.createUpdateOperations(Chapter.class);
			//修改内容包含：点赞数,是否结束,浏览次数
			ch.set("zan", chapter.getZan()).set("isEnd", chapter.isEnd()).set("viewNum", chapter.getViewNum()).set("length", chapter.getLength());
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

	@Override
	public List getAStoryByTop(long id) {
		// TODO Auto-generated method stub
		try {
			Morphia mor=new Morphia();
			Mongo mongo=new Mongo();
			Datastore ds=mor.createDatastore(mongo, dbs);
			List<Chapter> chs=new ArrayList<Chapter>();
			Chapter root=ds.find(Chapter.class,"id",id).get();
			chs.add(root);
			Chapter child=null;
			do{
				child=getExactChapter(root);
				root=child;
				if(child!=null)
					chs.add(child);
			}while(child!=null);
			return chs;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}


	@Override
	public long getMaxLevel(long rootId) {
		// TODO Auto-generated method stub
		try {
			Morphia mor=new Morphia();
			Mongo mongo=new Mongo();
			Datastore ds=mor.createDatastore(mongo, dbs);
			List<Chapter> chs=ds.createQuery(Chapter.class).order("-level").asList();
			long level=0;
			if(chs.size()>0)
				level=chs.get(0).getLevel();
			return level;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}


	//根据父章节获取最受欢迎的子章节
	public Chapter getExactChapter(Chapter parentCh) {
		// TODO Auto-generated method stub
		try {
			Morphia mor=new Morphia();
			Mongo mongo=new Mongo();
			Datastore ds=mor.createDatastore(mongo, dbs);
			List<Chapter> chs=ds.createQuery(Chapter.class).field("parentId").equal(parentCh.getId()).order("-zan").asList();
			Chapter chapter=null;
			if(chs.size()>0)
				chapter=chs.get(0);
			return chapter;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	//mood有三种，mood为1的时候为更受欢迎的章节，mood为-1的时候为更不受欢迎的章节,mood为0的时候为最受欢迎的章节
	public Chapter getExactChapter(Chapter chapter,boolean left){
		try {
			Morphia mor=new Morphia();
			Mongo mongo=new Mongo();
			Datastore ds=mor.createDatastore(mongo, dbs);
			List<Chapter> chs=ds.createQuery(Chapter.class).field("parentId").equal(chapter.getParentId()).order("-zan").asList();
			if(chs.size()>0){
				int index = 0;
				for(int i=0;i<chs.size();i++){
					if(chs.get(i).getId()==chapter.getId()){
						if(left)
							index=i-1;
						else
							index=i+1;
						break;
					}
				}
				
				if(index==chs.size()){
					 return chs.get(0);
				}
				
				if(index<0)
					index+=chs.size();
				return chs.get(index);	
			}
			return null;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List getStory(Chapter c,boolean left) {
		// TODO Auto-generated method stub
		try {
			Chapter lef=getExactChapter(c,left);
			if(lef==null)
				return null;
			else
				return getAStoryByTop(lef.getId());
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	@Override
	public List getStoryBySF(String format, String style) {
		// TODO Auto-generated method stub
		try {
			Morphia mor=new Morphia();
			Mongo mongo=new Mongo();
			Datastore ds=mor.createDatastore(mongo, dbs);
			List<Chapter> chs=ds.createQuery(Chapter.class).field("parentId").equal(-1).field("format").equal(format).field("style").equal(style).order("-zan").asList();
			return chs;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List getStoryByLength(long mood) {
		// TODO Auto-generated method stub
		try {
			Morphia mor=new Morphia();
			Mongo mongo=new Mongo();
			Datastore ds=mor.createDatastore(mongo, dbs);
			List<Chapter> chs=ds.createQuery(Chapter.class).field("parentId").equal(-1).field("length").equal(mood).order("-zan").asList();
			return chs;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
