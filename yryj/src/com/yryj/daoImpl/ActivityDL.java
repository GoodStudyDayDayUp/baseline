package com.yryj.daoImpl;

import java.io.File;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.google.code.morphia.Datastore;
import com.google.code.morphia.Morphia;
import com.google.code.morphia.query.UpdateOperations;
import com.mongodb.DB;
import com.mongodb.Mongo;
import com.mongodb.MongoException;
import com.mongodb.gridfs.GridFS;
import com.mongodb.gridfs.GridFSDBFile;
import com.mongodb.gridfs.GridFSInputFile;
import com.yryj.dao.ActivityDao;
import com.yryj.dao.TypeDao;
import com.yryj.model.Activity;
import com.yryj.model.Chapter;
import com.yryj.model.Type;
import com.yryj.pub.Format;

public class ActivityDL implements ActivityDao{
	String dbs;

	public ActivityDL(){
		dbs="yryj";
	}

	@Override
	public void save(Activity act) {
		// TODO Auto-generated method stub
		try {
			Morphia mor=new Morphia();
			Mongo mongo;
			mongo = new Mongo();
			Datastore ds=mor.createDatastore(mongo, dbs);
			List<Activity> ts=ds.createQuery(Activity.class).order("-id").asList();
			
			
			DB db=mongo.getDB(dbs);
			File imageFile=new File(act.getPic());
			GridFS gfsPhoto=new GridFS(db,Format.PICSTORE);
			GridFSInputFile gfsFile=gfsPhoto.createFile(imageFile);
			gfsFile.setFilename(act.getPic());
			gfsFile.save();
			
			long id = 0;
			if(ts.size()>0)
				id=ts.get(ts.size()-1).getId()+1;
			act.setId(id);

			ds.save(act);
			
			
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public void delete(long id) {
		// TODO Auto-generated method stub
		try {
			Morphia mor=new Morphia();
			Mongo mongo=new Mongo();
			Datastore ds=mor.createDatastore(mongo, dbs);
			ds.delete(Type.class,id);
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MongoException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public void update(Activity act) {
		// TODO Auto-generated method stub
		try {
			Morphia mor=new Morphia();
			Mongo mongo=new Mongo();
			Datastore ds=mor.createDatastore(mongo, dbs);

			UpdateOperations<Activity> ch = ds.createUpdateOperations(Activity.class);
			//修改内容
			ch.set("name", act.getName()).set("owner", act.getOwner()).set("pic", act.getPic()).set("state", act.getState()).set("url", act.getUrl());
			ds.update(ds.find(Activity.class, "id", act.getId()).getKey(), ch);
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MongoException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public GridFSDBFile writePicFileByPicName(String pic){
		
		try {
			Morphia mor=new Morphia();
			Mongo mongo=new Mongo();
			
			DB db=mongo.getDB(dbs);
			GridFS gfsPhoto=new GridFS(db,Format.PICSTORE);
			GridFSDBFile iOutput=gfsPhoto.findOne(pic);

			return iOutput;
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null; 
		
	}
	

	@Override
	public Activity find(long id) {
		// TODO Auto-generated method stub
		try {
			Morphia mor=new Morphia();
			Mongo mongo=new Mongo();
			Datastore ds=mor.createDatastore(mongo, dbs);
			Activity act=ds.find(Activity.class,"id",id).get();
			return act;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}
	
	
	
	
	public List<Activity> getAll(){
		try {
			Morphia mor=new Morphia();
			Mongo mongo=new Mongo();
			Datastore ds=mor.createDatastore(mongo, dbs);
			return ds.find(Activity.class).asList();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}
	
}