package com.egygames.apps.social.model;

import com.egygames.apps.social.entity.Response;


public interface NetworkListener {
	public enum Errors {
		NETWORK_ERROR, GENERAL_ERROR
	};
	public void responseReady(Response networkResponse, RequestListiner listenerToBeNotified);
	public void responseError(Errors error, RequestListiner listenerToBeNotified);

}
