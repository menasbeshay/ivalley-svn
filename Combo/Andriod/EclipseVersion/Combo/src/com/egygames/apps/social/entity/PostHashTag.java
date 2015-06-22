package com.egygames.apps.social.entity;

import org.codehaus.jackson.annotate.JsonProperty;
import org.codehaus.jackson.annotate.JsonPropertyOrder;


@JsonPropertyOrder({ "HashTagID", "Offset", "TagName"})
public class PostHashTag {

	
	@JsonProperty("HashTagID")
	private String HashTagID;
	@JsonProperty("TagName")
	private String TagName;
	
	@JsonProperty("Offset")
	private Integer Offset;

	public String getHashTagID() {
		return HashTagID;
	}

	public void setHashTagID(String hashTagID) {
		HashTagID = hashTagID;
	}

	public String getTagName() {
		return TagName;
	}

	public void setTagName(String tagName) {
		TagName = tagName;
	}

	public Integer getOffset() {
		return Offset;
	}

	public void setOffset(Integer offset) {
		Offset = offset;
	}

		
}
