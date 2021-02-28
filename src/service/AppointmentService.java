package service;

import java.util.List;

import dao.AppointmentDao;
import entity.Appointment;


public class AppointmentService {
	private AppointmentDao appointmentDao;
	public void setAppointmentDao(AppointmentDao appointmentDao) {
		this.appointmentDao = appointmentDao;
	}

	public void add(Appointment appointment){
		 this.appointmentDao.add(appointment);
	}
	
    public void update(Appointment appointment){
		this.appointmentDao.update(appointment);
	}

    public void delete(Appointment appointment){
	     this.appointmentDao.delete(appointment);
    }
    
    public List<Appointment> findAll(Appointment appointment){
    	return this.appointmentDao.findAll();
    }
    public List<Appointment> findByKeyword(String keyword){
    	return this.appointmentDao.findByKeyword(keyword);
    }

}
