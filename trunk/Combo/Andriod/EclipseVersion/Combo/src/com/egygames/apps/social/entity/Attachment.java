package com.egygames.apps.social.entity;

import java.util.HashMap;
import java.util.Map;

import org.codehaus.jackson.annotate.JsonAnyGetter;
import org.codehaus.jackson.annotate.JsonAnySetter;
import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.annotate.JsonProperty;

public class Attachment {

	@JsonProperty("AttachmentID")
	private String AttachmentID;
	@JsonProperty("Path")
	private String Path;
	@JsonProperty("AttachmentTypeID")
	private int AttachmentTypeID;
	public String getThumbsPath() {
		return ThumbsPath;
	}

	public void setThumbsPath(String thumbsPath) {
		ThumbsPath = thumbsPath;
	}

	@JsonProperty("ThumbsPath")
	private String ThumbsPath;

	@JsonIgnore
	private Map<String, Object> additionalProperties = new HashMap<String, Object>();

	/**
	 * 
	 * @return The AttachmentID
	 */
	@JsonProperty("AttachmentID")
	public String getAttachmentID() {
		return AttachmentID;
	}

	/**
	 * 
	 * @param AttachmentID
	 *            The AttachmentID
	 */
	@JsonProperty("AttachmentID")
	public void setAttachmentID(String AttachmentID) {
		this.AttachmentID = AttachmentID;
	}

	/**
	 * 
	 * @return The Path
	 */
	@JsonProperty("Path")
	public String getPath() {
		return Path;
	}

	/**
	 * 
	 * @param Path
	 *            The Path
	 */
	@JsonProperty("Path")
	public void setPath(String Path) {
		this.Path = Path;
	}

	/**
	 * 
	 * @return The AttachmentTypeID
	 */
	@JsonProperty("AttachmentTypeID")
	public int getAttachmentTypeID() {
		return AttachmentTypeID;
	}

	/**
	 * 
	 * @param AttachmentTypeID
	 *            The AttachmentTypeID
	 */
	@JsonProperty("AttachmentTypeID")
	public void setAttachmentTypeID(int AttachmentTypeID) {
		this.AttachmentTypeID = AttachmentTypeID;
	}

	@JsonAnyGetter
	public Map<String, Object> getAdditionalProperties() {
		return this.additionalProperties;
	}

	@JsonAnySetter
	public void setAdditionalProperty(String name, Object value) {
		this.additionalProperties.put(name, value);
	}

}
