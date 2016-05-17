package com.yryj.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import com.google.code.morphia.Key;
import com.yryj.dao.RelationsDao;
import com.yryj.daoImpl.RelationsDL;
import com.yryj.model.Chapter;
import com.yryj.model.Relations;
import com.yryj.sercvice.ChapterManager;
import com.yryj.sercvice.RelationsManager;

public class RelationsML implements RelationsManager{
private RelationsDao relationsDao = null;
	@Override
	public Key<Relations> save(Relations relation) {
		// TODO Auto-generated method stub
		relationsDao=new RelationsDL();
		return relationsDao.save(relation);
	}

	@Override
	public void update(Relations relation) {
		// TODO Auto-generated method stub
		relationsDao=new RelationsDL();
		relationsDao.update(relation);
	}

	@Override
	public Relations findById(long id) {
		// TODO Auto-generated method stub
		relationsDao=new RelationsDL();
		return relationsDao.findById(id);
	}

	@Override
	public Relations findByUserId(long userId) {
		// TODO Auto-generated method stub
		relationsDao=new RelationsDL();
		return relationsDao.findByUserId(userId);
	}

	@Override
	public List<Chapter> getStoreChapter(long userId) {
		// TODO Auto-generated method stub
		Relations re=findByUserId(userId);
		List <Chapter> store=new ArrayList<Chapter>();
		if(re!=null){
			String rs=re.getU2cStore();
			String[] relations=null;
			ChapterManager cm=new ChapterML();
			if(rs.indexOf("#")!=-1){
				relations=rs.split("#");
			}else{
				relations=new String[1];
				relations[0]=rs;
			}

			for(int i=0;i<relations.length;i++){
				if(relations[i]!="")
				store.add(cm.find(Long.valueOf(relations[i])));
			}
		}
		return store;
	}

	@Override
	public List<Chapter> getLovedChapter(long userId) {
		// TODO Auto-generated method stub
		Relations re=findByUserId(userId);
		List <Chapter> loved=new ArrayList<Chapter>();
		if(re!=null){
			String rs=re.getU2cZan();
			String[] relations=null;
			ChapterManager cm=new ChapterML();
			if(rs.indexOf("#")!=-1){
				relations=rs.split("#");
			}else{
				relations=new String[1];
				relations[0]=rs;
			}

			for(int i=0;i<relations.length;i++){
				if(relations[i]!="")
				loved.add(cm.find(Long.valueOf(relations[i])));
			}
		}
		return loved;
	}

}
