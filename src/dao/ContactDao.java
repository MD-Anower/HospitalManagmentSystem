package dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import entity.Contact;
import utils.HibernateSessionFactory;


public class ContactDao {

	public void add(Contact contact){
    	Session session= HibernateSessionFactory.getSession();
    	Transaction tran= session.beginTransaction();
    	    	
    	session.save(contact);
    	tran.commit();
    	session.close();
      }
      
      public void update(Contact contact){
      	Session session= HibernateSessionFactory.getSession();
      	Transaction tran= session.beginTransaction();
      	
    	
      	session.update(contact);
      	tran.commit();
      	session.close();
        }
      
      public void delete(Contact contact){
        	Session session= HibernateSessionFactory.getSession();
        	Transaction tran= session.beginTransaction();
        	
        	session.delete(contact);
        	tran.commit();
        	session.close();
          }
      
      public List<Contact> findAll(){
        	Session session= HibernateSessionFactory.getSession();
        	Transaction tran= session.beginTransaction();
        	
        	String hql="from Contact";
        	Query query= session.createQuery(hql);
        	List<Contact> list= query.list();
        	
        	tran.commit();
        	session.close();
        	return list;
          }
      public List<Contact> findByKeyword(String keyword){
        	Session session= HibernateSessionFactory.getSession();
        	Transaction tran= session.beginTransaction();
        	
        	String hql="from Contact where Phone like '%s'or remark like '%s' or description like '%s'";
        		hql=String.format(hql,"%"+keyword+"%", "%"+keyword+"%" , "%"+keyword+"%");
        	Query query= session.createQuery(hql);
        	List<Contact> list= query.list();
        	
        	tran.commit();
        	session.close();
        	return list;
          }
}
