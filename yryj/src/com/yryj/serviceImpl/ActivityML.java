package com.yryj.serviceImpl;

import java.util.List;
import java.util.Map;

import com.mongodb.gridfs.GridFSDBFile;
import com.yryj.dao.ActivityDao;
import com.yryj.daoImpl.ActivityDL;
import com.yryj.model.Activity;
import com.yryj.model.Type;
import com.yryj.sercvice.ActivityManager;

public class ActivityML implements ActivityManager{
	private ActivityDao am=null;
	
	@Override
	public void save(Activity act) {
		// TODO Auto-generated method stub
		am=new ActivityDL();
		am.save(act);
	}

	@Override
	public void delete(long id) {
		// TODO Auto-generated method stub
		am=new ActivityDL();
		am.delete(id);
	}

	@Override
	public void update(Activity act) {
		// TODO Auto-generated method stub
		am=new ActivityDL();
		am.update(act);
	}

	@Override
	public  Activity find(long id) {
		// TODO Auto-generated method stub
		am=new ActivityDL();
		return am.find(id);
	}

	
	public List<Activity> getAll(){
		am=new ActivityDL();
		return am.getAll();
	}
	
	public GridFSDBFile writePicFileByPicName(String pic){
		am=new ActivityDL();
		return am.writePicFileByPicName(pic);
	}
}
