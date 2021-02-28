package action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;



import service.ContactService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import entity.Contact;

public class ContactAction extends ActionSupport  implements ModelDriven<Contact>  {

private Contact contact = new Contact();
	
	@Override
	public Contact getModel() {
		
		return this.contact;
	}

	@Override
	public String execute() throws Exception {
		
		return SUCCESS;
	}

	private ContactService contactService;
	
	public void setContactService(ContactService contactService){
		this.contactService= contactService;
	}
	
	public String list(){
		ActionContext actionContext= ActionContext.getContext();
		List<Contact> list = this.contactService.findAll(contact);
		actionContext.put("list", list);
		
		return "findAll";
	}
	
    public String delete(){
		
		this.contactService.delete(contact);
		
		return "operSuccess";
	}
    
    public String query(){
   		
       	ActionContext actionContext= ActionContext.getContext();
       	HttpServletRequest request= ServletActionContext.getRequest();
       	String keyword= request.getParameter("keyWord");
   		List<Contact> list = this.contactService.findByKeyword(keyword);
   		actionContext.put("list", list);
   		
   		return "findAll";
   	}
    
        public String add(){
		ActionContext actionContext= ActionContext.getContext();
		
		this.contactService.add(contact);
		
		
		return "operSuccess";
	}
        
  
        public String edit(){
    		
    		this.contactService.update(contact);
    		
    		return "operSuccess";
    	}
    
	
}
