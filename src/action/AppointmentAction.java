package action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import service.AppointmentService;
import service.StudentService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import entity.Appointment;
import entity.Student;

public class AppointmentAction extends ActionSupport  implements ModelDriven<Appointment> {
	
	private Appointment appointment = new Appointment();
	
	@Override
	public Appointment getModel() {
		
		return this.appointment;
	}

	@Override
	public String execute() throws Exception {
		
		return SUCCESS;
	}

	private AppointmentService appointmentService;
	public void setAppointmentService(AppointmentService appointmentService){
		this.appointmentService= appointmentService;
	}
	
	public String list(){
		ActionContext actionContext= ActionContext.getContext();
		List<Appointment> list = this.appointmentService.findAll(appointment);
		actionContext.put("list", list);
		
		return "findAll";
	}
	
    public String delete(){
		
		this.appointmentService.delete(appointment);
		
		return "operSuccess";
	}
    
    public String query(){
   		
       	ActionContext actionContext= ActionContext.getContext();
       	HttpServletRequest request= ServletActionContext.getRequest();
       	String keyword= request.getParameter("keyWord");
   		List<Appointment> list = this.appointmentService.findByKeyword(keyword);
   		actionContext.put("list", list);
   		
   		return "findAll";
   	}
    
        public String add(){
		ActionContext actionContext= ActionContext.getContext();
		
		this.appointmentService.add(appointment);
		
		
		return "operSuccess";
	}
        
  
        public String edit(){
    		
    	this.appointmentService.update(appointment);
    		
    	return "operSuccess";
    }
    
}
