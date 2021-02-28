package service;

import java.util.List;

import dao.ContactDao;
import entity.Contact;


public class ContactService {
	private ContactDao contactDao;
	
	public void setContactDao(ContactDao contactDao) {
		this.contactDao = contactDao;
	}

	public void add(Contact contact){
		 this.contactDao.add(contact);
	}
	
    public void update(Contact contact){
		this.contactDao.update(contact);
	}

    public void delete(Contact contact){
	     this.contactDao.delete(contact);
    }
    
    public List<Contact> findAll(Contact contact){
    	return this.contactDao.findAll();
    }
    public List<Contact> findByKeyword(String keyword){
    	return this.contactDao.findByKeyword(keyword);
    }

}
