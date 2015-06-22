package com.egygames.apps.social.entity;

import java.util.List;

import org.codehaus.jackson.annotate.JsonProperty;

public class Response<T> {
	@JsonProperty(value = "ErrorCode")
	private Number errorCode;
	@JsonProperty(value = "ErrorMsg")
	private String errorMsg;
	@JsonProperty(value = "bool_result")
	private boolean bool_result;
	@JsonProperty(value = "NotificationType")
	private int notificationType;

	public int getNotificationType() {
		return notificationType;
	}

	public void setNotificationType(int notificationType) {
		this.notificationType = notificationType;
	}

	@JsonProperty(value = "Entity")
	private List<T> entity;

	public List<T> getEntity() {
		return this.entity;
	}

	public void setEntity(List<T> entity) {
		this.entity = entity;
	}

	public Number getErrorCode() {
		return this.errorCode;
	}

	public void setErrorCode(Number errorCode) {
		this.errorCode = errorCode;
	}

	public String getErrorMsg() {
		return this.errorMsg;
	}

	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}

	public boolean getBool_result() {
		return this.bool_result;
	}

	public void setBool_result(boolean bool_result) {
		this.bool_result = bool_result;
	}
}
