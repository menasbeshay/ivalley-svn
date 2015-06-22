package com.egygames.apps.social.model;

import com.egygames.apps.social.BaseActivity;
import com.egygames.apps.social.NotificationsActivity;

public class DefaultRequestListiner implements RequestListiner {
	BaseActivity activity=null;
	public DefaultRequestListiner() {
		// TODO Auto-generated constructor stub
	}
	public DefaultRequestListiner(BaseActivity activity) {
		// TODO Auto-generated constructor stub
		this.activity=activity;
	}

	@Override
	public void requestDone(Object result) {
		// TODO Auto-generated method stub
		if(activity!=null)
		((NotificationsActivity)	activity).reload();
	}

	@Override
	public void requestError(String result) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void requestError(int errorResource) {
		// TODO Auto-generated method stub
		
	}

}
