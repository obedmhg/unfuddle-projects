package com.ocorp.dao;

import java.util.Date;
import java.util.List;

import javax.jdo.PersistenceManager;

import com.ocorp.jdo.GalleryUrl;
import com.ocorp.jdo.PMF;


public class GalleryUrlDao {
	
	 private PersistenceManager pm;

	public boolean createGalleryUrl(GalleryUrl galleryUrl) {
		boolean response = false;
		try {
			getPm().makePersistent(galleryUrl);
			response = true;
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			getPm().close();
		}
		return response;
	}

	public boolean deleteGalleryUrl(GalleryUrl galleryUrl) {
		boolean response = false;
		try {
			getPm().deletePersistent(galleryUrl);
			response = true;
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			getPm().close();
		}
		return response;
	}
	
	public List<GalleryUrl> getAllGalleryUrl() {
		String query = "select from " + GalleryUrl.class.getName() ;
        List<GalleryUrl> reasons = (List<GalleryUrl>) getPm().newQuery(query).execute();
		return reasons;
	}
	
	public List<GalleryUrl> getGAlleryUrl(String password) {
		List<GalleryUrl> reasons = null;
		try {
			String query = "select from " + GalleryUrl.class.getName() + " where password == cPassword " 
															+ "PARAMETERS  java.lang.String cPassword";
			reasons = (List<GalleryUrl>) getPm().newQuery(query).execute(password);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return reasons;
	}

	/**
	 * Getter of PersistenceManager
	 * @return
	 */
	public PersistenceManager getPm() {
		if(pm == null || pm.isClosed()){
			pm = PMF.get().getPersistenceManager();
		}
		return pm;
	}
	
}
