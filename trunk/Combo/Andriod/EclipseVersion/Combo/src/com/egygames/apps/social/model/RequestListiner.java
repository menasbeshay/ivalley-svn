package com.egygames.apps.social.model;

public interface RequestListiner {
	public void requestDone(Object result);

	public void requestError(String result);

	public void requestError(int errorResource);

}
