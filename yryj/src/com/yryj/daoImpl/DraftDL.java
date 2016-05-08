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
import com.yryj.model.Chapter;
import com.yryj.model.Draft;

public class DraftDL implements DraftDao{
	String dbs;
	
	public DraftDL(){
		dbs="draft";
	}
	
	@Override
	public Key<Draft> save(Draft draft) {
		// TODO Auto-generated method stub
		try {
			Morphia mor=new Morphia();
			Mongo mongo;
			mongo = new Mongo();
			Datastore ds=mor.createDatastore(mongo, dbs);
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
			ds.delete(ds.createQuery(Chapter.class).field("id").equals(id));
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
			
			UpdateOperations<Chapter> ch = ds.createUpdateOperations(Chapter.class);
			//ÐÞ¸ÄÄÚÈÝ
			ch.set("content", draft.getContent());
			ds.update(ds.find(Chapter.class, "id", draft.getId()).getKey(), ch);
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
			return ds.find(Draft.class,"id",id).get();
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
