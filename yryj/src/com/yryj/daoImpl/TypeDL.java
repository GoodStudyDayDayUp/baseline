package com.yryj.daoImpl;

import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;


import com.google.code.morphia.Datastore;
import com.google.code.morphia.Morphia;
import com.google.code.morphia.query.UpdateOperations;
import com.mongodb.Mongo;
import com.mongodb.MongoException;
import com.yryj.dao.TypeDao;
import com.yryj.model.Chapter;
import com.yryj.model.Type;

public class TypeDL implements TypeDao{
	String dbs;

	public TypeDL(){
		dbs="yryj";
	}

	@Override
	public void save(Type type) {
		// TODO Auto-generated method stub
		try {
			Morphia mor=new Morphia();
			Mongo mongo;
			mongo = new Mongo();
			Datastore ds=mor.createDatastore(mongo, dbs);
			List<Type> ts=ds.createQuery(Type.class).order("-id").asList();
			long id = 0;
			if(ts.size()>0)
				id=ts.get(ts.size()-1).getId()+1;
			type.setId(id);

			ds.save(type);
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MongoException e) {
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
	public void update(Type type) {
		// TODO Auto-generated method stub
		try {
			Morphia mor=new Morphia();
			Mongo mongo=new Mongo();
			Datastore ds=mor.createDatastore(mongo, dbs);

			UpdateOperations<Chapter> ch = ds.createUpdateOperations(Chapter.class);
			//修改内容
			ch.set("content", type.getContent());
			ds.update(ds.find(Chapter.class, "id", type.getId()).getKey(), ch);
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MongoException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public Type find(long id) {
		// TODO Auto-generated method stub
		try {
			Morphia mor=new Morphia();
			Mongo mongo=new Mongo();
			Datastore ds=mor.createDatastore(mongo, dbs);
			return ds.find(Type.class,"id",id).get();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	@Override
	public List getClassByMood(long mood) {
		// TODO Auto-generated method stub
		try {
			Morphia mor=new Morphia();
			Mongo mongo=new Mongo();
			Datastore ds=mor.createDatastore(mongo, dbs);
			return ds.find(Type.class,"mood",mood).asList();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	@Override
	public Type findByMoodAndIndex(long mood, int index) {
		// TODO Auto-generated method stub
		ArrayList<Type> types = (ArrayList<Type>) getClassByMood(mood);
		return types.get(index+1);
	}

	
}