package com.ocorp.jdo;

import java.util.List;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

import com.google.appengine.api.datastore.Key;

@PersistenceCapable
public class User {
	@PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
    private Key key;

	@Persistent
    private String loginName;

	@Persistent
	private String password;
	
	@Persistent
	private String email;
	
	@Persistent
    private String completeName;

    @Persistent
    private Boolean active;
    
    @Persistent
    private List<OneReasonFor> myReasons;
    
    @Persistent
    private UserProfile userProfile;
    
	public Key getKey() {
		return key;
	}

	public void setKey(Key key) {
		this.key = key;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCompleteName() {
		return completeName;
	}

	public void setCompleteName(String cName) {
		this.completeName = cName;
	}

	public Boolean getActive() {
		return active;
	}

	public void setActive(Boolean active) {
		this.active = active;
	}

	public UserProfile getUserProfile() {
		return userProfile;
	}

	public void setUserProfile(UserProfile userProfile) {
		this.userProfile = userProfile;
	}

	public List<OneReasonFor> getMyReasons() {
		return myReasons;
	}

	public void setMyReasons(List<OneReasonFor> myReasons) {
		this.myReasons = myReasons;
	}

}
