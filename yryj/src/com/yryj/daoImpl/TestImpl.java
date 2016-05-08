package com.yryj.daoImpl;

import com.google.code.morphia.Datastore;
import com.google.code.morphia.Morphia;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBObject;
import com.mongodb.Mongo;
import com.yryj.dao.TestDao;
import com.yryj.model.Test;
import com.yryj.model.User;

public class TestImpl implements TestDao{

	@Override
	public Test getTest(String id) {
		// TODO Auto-generated method stub
		try {
		Morphia mor=new Morphia();
		Mongo mongo=new Mongo();
		Datastore ds=mor.createDatastore(mongo, "tests");
		return ds.find(Test.class,"name","a").get();
		} catch (Exception e) {
            e.printStackTrace();
        }
		  
		return null;
	}

	@Override
	public void addTest(Test test) {
		// TODO Auto-generated method stub
		try {
			Morphia mor=new Morphia();
			Mongo mongo=new Mongo();
			Datastore ds=mor.createDatastore(mongo, "tests");
			 
	         // 用自定义BasicDBObjectUtils工具类，将User Enity对象转换成DBObject
			 test=new Test("jack","beijin");
	            //DBObject testo = mor.toDBObject(test);
	            ds.save(test);
	            System.out.println("add a test");
	            ds.save(new Test("a","b"));
	            System.out.println("add a test");
	            ds.save(new Test("c","c"));
	            System.out.println("add a test");
	            
//	            // 用BasicDBObjectBuilder构建一个DBObject对象
//	            user = BasicDBObjectBuilder.start("id", 1546555).append("name", "jojo").add("address", "gz").append("email", "hoojo_@126.com").get();
//	            users.insert(user);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	}

	@Override
	public void deleteTest(Test test) {
		// TODO Auto-generated method stub
		try {
			Morphia mor=new Morphia();
			Mongo mongo=new Mongo();
			Datastore ds=mor.createDatastore(mongo, "tests");
			ds.delete(ds.createQuery(User.class).field("name").equals("a"));
			} catch (Exception e) {
	            e.printStackTrace();
	        }
			  
		
	}

}
