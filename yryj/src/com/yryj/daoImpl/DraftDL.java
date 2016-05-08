package com.yryj.daoImpl;
import java.net.UnknownHostException;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;

import com.google.code.morphia.Datastore;
import com.google.code.morphia.Key;
import com.google.code.morphia.Morphia;
import com.google.code.morphia.query.UpdateOperations;
import com.mongodb.Mongo;
import com.mongodb.MongoException;
import com.yryj.dao.DraftDao;
import com.yryj.model.Draft;

public class DraftDL implements DraftDao{
	String dbs;
	
	public DraftDL(){
		dbs="yryj";
	}
	
	@Override
	public Key<Draft> save(Draft draft) {
		// TODO Auto-generated method stub
		try {
			Morphia mor=new Morphia();
			Mongo mongo;
			mongo = new Mongo();
			Datastore ds=mor.createDatastore(mongo, dbs);
			List<Draft> dfs=ds.createQuery(Draft.class).order("-id").asList();
			long id = 0;
			if(dfs.size()>0)
				id=dfs.get(dfs.size()-1).getId()+1;
			draft.setId(id);
			return ds.save(draft);
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
			ds.delete(Draft.class,id);
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MongoException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public void update(Draft draft) {
		// TODO Auto-generated method stub
		try {
			Morphia mor=new Morphia();
			Mongo mongo=new Mongo();
			Datastore ds=mor.createDatastore(mongo, dbs);
			
			UpdateOperations<Draft> ch = ds.createUpdateOperations(Draft.class);
			//ÐÞ¸ÄÄÚÈÝ
			ch.set("content", draft.getContent());
			ds.update(ds.find(Draft.class, "_id", draft.getId()).getKey(), ch);
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MongoException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public Draft findById(long id) {
		// TODO Auto-generated method stub
		try {
			Morphia mor=new Morphia();
			Mongo mongo=new Mongo();
			Datastore ds=mor.createDatastore(mongo, dbs);
			return ds.find(Draft.class,"_id",id).get();
			} catch (Exception e) {
	            e.printStackTrace();
	        }
			  
			return null;
	}

	@Override
	public List findByUserId(long userId) {
		// TODO Auto-generated method stub
		try {
			Morphia mor=new Morphia();
			Mongo mongo=new Mongo();
			Datastore ds=mor.createDatastore(mongo, dbs);
			return ds.find(Draft.class,"userId",userId).asList();
			} catch (Exception e) {
	            e.printStackTrace();
	        }
			  
			return null;
	}

}
