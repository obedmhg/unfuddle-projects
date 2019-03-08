package com.ocorp.onereasonfor;

import java.util.List;

import org.apache.click.Page;

import com.ocorp.content.ContentUtils;
import com.ocorp.dao.OneReasonForSeviceDaoImpl;
import com.ocorp.jdo.OneReasonFor;

public class OneReasonForList extends Page{
	
	private OneReasonForSeviceDaoImpl service;

	private List<OneReasonFor> reasons;
	
    public OneReasonForList() {
    	reasons = getReasons();
    	addModel("reasons", reasons);
    }

    public void onRender() {
    }

    public List<OneReasonFor> getReasons() {
    	if (reasons == null) {
			reasons = getOneReasonForDao().getTopOneReasonFor();
			for(OneReasonFor reason: reasons){
				String newDesc = "";
				if(reason.getDescription().contains("youtube.com")){
					newDesc = ContentUtils.getYoutubeCode(reason.getDescription());
				}else if (reason.getDescription().endsWith(".jpg") || 
					  reason.getDescription().endsWith(".png") ||
					  reason.getDescription().endsWith(".gif")){
					newDesc = ContentUtils.getImageCode(reason.getDescription());
				} else{
					newDesc = ContentUtils.getLinkCode(reason.getDescription());
				}
				reason.setDescription(newDesc);
			}
		}
    	return reasons;
	}
    

	public void setReasons(List<OneReasonFor> reasons) {
		this.reasons = reasons;
	}

	public OneReasonForSeviceDaoImpl getOneReasonForDao() {
		if (service == null) {
			service = new OneReasonForSeviceDaoImpl();
		}
		return service;
	}

	public void setOneReasonForDao(OneReasonForSeviceDaoImpl service) {
		this.service = service;
	}

}
