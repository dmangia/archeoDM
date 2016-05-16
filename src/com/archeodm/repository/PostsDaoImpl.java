package com.archeodm.repository;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.archeodm.model.Posts;



@Repository("PostsDao")
public class PostsDaoImpl implements PostsDao { //aggancia alla classe Posts il DAO


	@Autowired
	SessionFactory sessionFactory;
	List results=null;
	
	public List getByUser(String id) {
		 

	     try{
	    	 Session session = sessionFactory.openSession();
	         String sql = "SELECT * FROM POSTS WHERE user_id=:user_id";
	         SQLQuery query = session.createSQLQuery(sql);
	         query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP); //get model bean from query
	         //query.addEntity(Posts.class);
	         query.setParameter("user_id", id);
	         results = query.list();
	         session.close();
	      }catch (HibernateException e) {
	         
	         e.printStackTrace(); 
	      } 
		
		return results;
	}

	
	public Posts getPostDetail(Integer id) {
		 
		Posts articolo=null;
		
		try {
			Session session = sessionFactory.openSession();
			session.beginTransaction();
			
			articolo = (Posts) session.get(Posts.class, id);
			System.out.println(articolo.getId() + " - " + articolo.getTitle());
			
			session.getTransaction().commit();
		}
		
			catch (HibernateException e) {
		        
		        e.printStackTrace(); 
		     }
		
		return articolo;
	}
	
	
	public List getByCategory(String categ){
		List results=null;
		try{
	    	 Session session = sessionFactory.openSession();
	         String sql = "SELECT * FROM POSTS WHERE category=:categ";
	         SQLQuery query = session.createSQLQuery(sql);
	         query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP); //get model bean from query
	         //query.addEntity(Posts.class);
	         query.setParameter("categ", categ);
	         results = query.list();
	         session.close();
	      }catch (HibernateException e) {
	         
	         e.printStackTrace(); 
	      } 
		
		return results;
	}

	 @Override
	 @Transactional
	 public int insertRow(Posts post){
		 Session session = sessionFactory.openSession();
		  Transaction tx = session.beginTransaction();
		  session.saveOrUpdate(post);
		  tx.commit();
		  Serializable id = session.getIdentifier(post);
		  session.close();
		  return (Integer) id;
		
	 }
	 
	 public int deleteRow(Integer id){
		 Session session = sessionFactory.openSession();
		  Transaction tx = session.beginTransaction();
		  Posts art = (Posts) session.load(Posts.class, id);
		  session.delete(art);
		  tx.commit();
		  Serializable ids = session.getIdentifier(art);
		  session.close();
		  return (Integer) ids;
		 
	 }
		public int updateRow(Posts item){
			Session session = sessionFactory.openSession();
			Transaction tx = session.beginTransaction();
			session.saveOrUpdate(item);
			tx.commit();
			Serializable id = session.getIdentifier(item);
			
			session.close();
			return (Integer) id;
			
		}
	 
	 
	 
}
