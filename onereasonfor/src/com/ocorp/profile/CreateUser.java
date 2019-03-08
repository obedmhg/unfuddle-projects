package com.ocorp.profile;

import org.apache.click.Page;
import org.apache.click.control.Checkbox;
import org.apache.click.control.Form;
import org.apache.click.control.Label;
import org.apache.click.control.PasswordField;
import org.apache.click.control.Submit;
import org.apache.click.control.TextField;
import org.apache.click.util.Bindable;

import com.ocorp.dao.ProfileServiceDaoImpl;
import com.ocorp.jdo.User;

public class CreateUser extends Page{
	
	private ProfileServiceDaoImpl profileService;
	
	private Label message = new Label("message");
	
	@Bindable Form userForm = new Form("profileForm");
	public CreateUser(){
		userForm.add(new TextField("Complete Name"));
		userForm.add(new TextField("Login Name", true));
		userForm.add(new PasswordField("Password", true));
		userForm.add(new TextField("eMail", true));
		addControl(userForm);
		userForm.add(new Submit("Create my account"));
		userForm.setListener(this, "onSubmit");
	}
	
    public boolean onSubmit() {
        if (userForm.isValid()) {
        	User user = new User();
            user.setLoginName(userForm.getFieldValue("Login Name"));
            user.setPassword(userForm.getFieldValue("Password"));
            user.setEmail(userForm.getFieldValue("eMail"));
            user.setCompleteName(userForm.getFieldValue("Complete Name"));
            getProfileService().createUser(user);
            User loggedUser = getProfileService().getUser(userForm.getFieldValue("Login Name"), userForm.getFieldValue("Password"));
            setRedirect("/click-page.htm?loginName=" + loggedUser.getLoginName());
        }
        return true;
    }
    
	public ProfileServiceDaoImpl getProfileService() {
		if (profileService == null) {
			profileService = new ProfileServiceDaoImpl();
		}
		return profileService;
	}

	public void setProfileService(ProfileServiceDaoImpl profileService) {
		this.profileService = profileService;
	}
    
}
