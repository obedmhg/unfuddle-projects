package com.ocorp.profile;

import org.apache.click.Page;
import org.apache.click.control.Form;
import org.apache.click.control.Label;
import org.apache.click.control.PasswordField;
import org.apache.click.control.Submit;
import org.apache.click.control.TextField;
import org.apache.click.util.Bindable;

import com.ocorp.dao.ProfileServiceDaoImpl;
import com.ocorp.jdo.User;

public class SmallLogin extends Page {
	private ProfileServiceDaoImpl profileService;

	@Bindable
	Form userForm = new Form("loginForm");

	public SmallLogin() {
		userForm.add(new TextField("User", true));
		userForm.add(new PasswordField("Password", true));
		addControl(userForm);
		userForm.add(new Submit("Log In"));
		userForm.setListener(this, "onSubmit");
		userForm.setColumns(4);
	}

	public boolean onSubmit() {
		if (userForm.isValid()) {
			User user = new User();
			user.setLoginName(userForm.getFieldValue("User"));
			user.setPassword(userForm.getFieldValue("Password"));
			user = getProfileService().getUser(user.getLoginName(), user.getPassword());
			setRedirect("/click-page.htm?loginName="
					+ user.getLoginName());
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