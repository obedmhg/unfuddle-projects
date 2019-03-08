package com.ocorp.onereasonfor;

import java.util.Date;

import org.apache.click.Page;
import org.apache.click.control.Checkbox;
import org.apache.click.control.Form;
import org.apache.click.control.PasswordField;
import org.apache.click.control.Submit;
import org.apache.click.control.TextArea;
import org.apache.click.control.TextField;
import org.apache.click.util.Bindable;

import com.ocorp.dao.OneReasonForSeviceDaoImpl;
import com.ocorp.dao.ProfileServiceDaoImpl;
import com.ocorp.jdo.OneReasonFor;
import com.ocorp.jdo.User;

public class CreateOneReasonFor extends Page{
	
	private OneReasonForSeviceDaoImpl service;
	
	@Bindable Form oneReason4Form = new Form("oneReason4Form");
	
	public CreateOneReasonFor(){
		TextField tittle = new TextField("Tittle", true);
		tittle.setWidth("300px");
		TextArea desc = new TextArea("Description", true);
		desc.setCols(30);
		desc.setRows(4);
		oneReason4Form.add(tittle);
		oneReason4Form.add(desc);
		CategorySelect category = new CategorySelect("Category");
		oneReason4Form.add(category);
		oneReason4Form.setListener(this, "onSubmit");
		oneReason4Form.add(new Submit("Create one Reason For"));
		addControl(oneReason4Form);
	}
	
    public boolean onSubmit() {
        if (oneReason4Form.isValid()) {
        	OneReasonFor or4 = new OneReasonFor();
        	or4.setTittle(oneReason4Form.getFieldValue("Tittle"));
        	or4.setCreationDate(new Date());
        	or4.setDescription(oneReason4Form.getFieldValue("Description"));
        	//Add the user
        	or4.setUser("Anonymous");
        	//TODO add categories
        	//or4.setCategory(oneReason4Form.getFieldValue("Category"));
            if (getService().createOneReasonFor(or4)){
            	setRedirect("/onereasonfor/one-reason-for-list.htm");
            }
        }
        return true;
    }
    
	public OneReasonForSeviceDaoImpl getService() {
		if (service == null) {
			service = new OneReasonForSeviceDaoImpl();
		}
		return service;
	}

	public void setService(OneReasonForSeviceDaoImpl service) {
		this.service = service;
	}

	
}