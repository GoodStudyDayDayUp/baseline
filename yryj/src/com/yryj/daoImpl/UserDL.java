package com.yryj.daoImpl;

import java.net.UnknownHostException;
import java.util.List;

import com.google.code.morphia.Datastore;
import com.google.code.morphia.Morphia;
import com.google.code.morphia.query.UpdateOperations;
import com.mongodb.Mongo;
import com.mongodb.MongoException;
import com.yryj.dao.UserDao;
import com.yryj.model.Activity;
import com.yryj.model.Chapter;
import com.yryj.model.User;
import com.yryj.pub.Format;

public class UserDL implements UserDao{
	String dbs;

	public UserDL(){
		dbs=Format.DATASTORE;
	}

	
	
	@Override
	public void save(User user) {
		// TODO Auto-generated method stub
		try {
			Morphia mor=new Morphia();
			Mongo mongo;
			mongo = new Mongo();
			Datastore ds=mor.createDatastore(mongo, dbs);
			List<User> us=ds.createQuery(User.class).order("-id").asList();
			long id = 0;
			if(us.size()>0)
				id=us.get(us.size()-1).getId()+1;
			user.setId(id);

			ds.save(user);
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
			ds.delete(User.class,id);
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MongoException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public void update(User user) {
		// TODO Auto-generated method stub
		try {
			Morphia mor=new Morphia();
			Mongo mongo=new Mongo();
			Datastore ds=mor.createDatastore(mongo, dbs);

			UpdateOperations<User> ch = ds.createUpdateOperations(User.class);
			//修改内容包含：点赞数,是否结束,浏览次数
			ch.set("password", user.getPassword()).set("phone", user.getPhone()).set("point", user.getPoint());
			ds.update(ds.find(User.class, "_id", user.getId()).getKey(), ch);
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MongoException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public User find(long id) {
		// TODO Auto-generated method stub
		try {
			Morphia mor=new Morphia();
			Mongo mongo=new Mongo();
			Datastore ds=mor.createDatastore(mongo, dbs);
			return ds.find(User.class,"_id",id).get();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	public User findByName(String name)
	{
		try {
			Morphia mor=new Morphia();
			Mongo mongo=new Mongo();
			Datastore ds=mor.createDatastore(mongo, dbs);
			return ds.find(User.class,"name",name).get();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	@Override
	public User findByEmail(String email) {
		// TODO Auto-generated method stub
		try {
			Morphia mor=new Morphia();
			Mongo mongo=new Mongo();
			Datastore ds=mor.createDatastore(mongo, dbs);
			return ds.find(User.class,"email",email).get();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	@Override
	public User findByPhone(String phone) {
		// TODO Auto-generated method stub
		try {
			Morphia mor=new Morphia();
			Mongo mongo=new Mongo();
			Datastore ds=mor.createDatastore(mongo, dbs);
			return ds.find(User.class,"phone",phone).get();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	@Override
	public List<User> getAll(){
		try {
			Morphia mor=new Morphia();
			Mongo mongo=new Mongo();
			Datastore ds=mor.createDatastore(mongo, dbs);
			return ds.find(User.class).asList();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}
}