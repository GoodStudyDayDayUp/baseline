package com.yryj.daoImpl;

import java.net.UnknownHostException;
import java.util.List;

import com.google.code.morphia.Datastore;
import com.google.code.morphia.Key;
import com.google.code.morphia.Morphia;
import com.google.code.morphia.query.UpdateOperations;
import com.mongodb.Mongo;
import com.mongodb.MongoException;
import com.yryj.dao.RelationsDao;
import com.yryj.model.Chapter;
import com.yryj.model.Relations;
import com.yryj.pub.Format;

public class RelationsDL implements RelationsDao{
	String dbs;

	public RelationsDL(){
		dbs=Format.DATASTORE;
	}


	@Override
	public Key<Relations> save(Relations relation) {
		// TODO Auto-generated method stub
		try {
			Morphia mor=new Morphia();
			Mongo mongo;
			mongo = new Mongo();
			Datastore ds=mor.createDatastore(mongo, dbs);
			List<Relations> rs=ds.createQuery(Relations.class).order("-id").asList();
			long id = 0;
			if(rs.size()>0)
				id=rs.get(rs.size()-1).getId()+1;
			relation.setId(id);

			return ds.save(relation);
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
	public void update(Relations relation) {
		// TODO Auto-generated method stub
		try {
			Morphia mor=new Morphia();
			Mongo mongo=new Mongo();
			Datastore ds=mor.createDatastore(mongo, dbs);

			UpdateOperations<Relations> re = ds.createUpdateOperations(Relations.class);
			//修改内容包含：点赞数,是否结束,浏览次数
			re.set("u2i", relation.getU2i() ).set("i2u", relation.getI2u()).set("u2cZan", relation.getU2cZan()).set("u2cStore", relation.getU2cStore());
			ds.update(ds.find(Relations.class, "_id", relation.getId()).getKey(), re);
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MongoException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public Relations findById(long id) {
		// TODO Auto-generated method stub
		try {
			Morphia mor=new Morphia();
			Mongo mongo=new Mongo();
			Datastore ds=mor.createDatastore(mongo, dbs);
			return ds.find(Relations.class,"_id",id).get();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	@Override
	public Relations findByUserId(long userId) {
		// TODO Auto-generated method stub
		try {
			Morphia mor=new Morphia();
			Mongo mongo=new Mongo();
			Datastore ds=mor.createDatastore(mongo, dbs);
			return ds.find(Relations.class,"uId",userId).get();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

}
