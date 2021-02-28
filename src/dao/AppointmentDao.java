package dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import utils.HibernateSessionFactory;
import entity.Appointment;
import entity.Student;


public class AppointmentDao {
	
	public void add(Appointment appointment){
    	Session session = HibernateSessionFactory.getSession();
    	Transaction tran = session.beginTransaction();
    	
    	session.save(appointment);
    	tran.commit();
    	session.close();
      }
	
	public void update(Appointment appointment){
    	Session session = HibernateSessionFactory.getSession();
    	Transaction tran = session.beginTransaction();
    	
    	session.update(appointment);
    	tran.commit();
    	session.close();
      }
	
	public void delete(Appointment appointment){
    	Session session = HibernateSessionFactory.getSession();
    	Transaction tran = session.beginTransaction();
    	
    	session.delete(appointment);
    	tran.commit();
    	session.close();
      }
	
	 public List<Appointment> findAll(){
     	Session session= HibernateSessionFactory.getSession();
     	Transaction tran= session.beginTransaction();
     	
     	String hql="from Appointment";
     	Query query= session.createQuery(hql);
     	List<Appointment> list= query.list();
     	
     	tran.commit();
     	session.close();
     	return list;
       }
   public List<Appointment> findByKeyword(String keyword){
     	Session session= HibernateSessionFactory.getSession();
     	Transaction tran= session.beginTransaction();
     	
     	String hql="from Appointment where Name like '%s'";
     		hql=String.format(hql,"%"+keyword+"%");
     	Query query= session.createQuery(hql);
     	List<Appointment> list= query.list();
     	
     	tran.commit();
     	session.close();
     	return list;
       }

}
