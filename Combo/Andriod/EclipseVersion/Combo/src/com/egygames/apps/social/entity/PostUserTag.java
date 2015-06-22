package com.egygames.apps.social.entity;

import org.codehaus.jackson.annotate.JsonProperty;
import org.codehaus.jackson.annotate.JsonPropertyOrder;


@JsonPropertyOrder({ "ComboPostID", "ComboUserID", "UserName", "Offset"})
public class PostUserTag {

	
	@JsonProperty("ComboPostID")
	private String ComboPostID;
	@JsonProperty("ComboUserID")
	private String ComboUserID;
	@JsonProperty("UserName")
	private String UserName;
	
	@JsonProperty("Offset")
	private Integer Offset;

	public String getComboPostID() {
		return ComboPostID;
	}

	public void setComboPostID(String comboPostID) {
		ComboPostID = comboPostID;
	}

	public String getComboUserID() {
		return ComboUserID;
	}

	public void setComboUserID(String comboUserID) {
		ComboUserID = comboUserID;
	}

	public String getUserName() {
		return UserName;
	}

	public void setUserName(String userName) {
		UserName = userName;
	}

	public Integer getOffset() {
		return Offset;
	}

	public void setOffset(Integer offset) {
		Offset = offset;
	}
	
	
	
	
}
