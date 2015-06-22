package com.egygames.apps.social.entity;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.annotate.JsonProperty;

public class UploadResponse {
	@JsonProperty(value = "ErrorCode")
	private Number errorCode;
	@JsonProperty(value = "ErrorMsg")
	private String errorMsg;
	@JsonProperty(value = "bool_result")
	private boolean bool_result;
	@JsonIgnore
	private String uploadId;
	public String getUploadId() {
		return uploadId;
	}

	public void setUploadId(String uploadId) {
		this.uploadId = uploadId;
	}

	@JsonProperty(value = "Entity")
	private Attachment entity;

	public Attachment getEntity() {
		return this.entity;
	}

	public void setEntity(Attachment entity) {
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
