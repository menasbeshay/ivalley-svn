package com.egygames.apps.social.entity;

import java.util.HashMap;
import java.util.Map;

import org.codehaus.jackson.annotate.JsonAnyGetter;
import org.codehaus.jackson.annotate.JsonAnySetter;
import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.annotate.JsonProperty;
import org.codehaus.jackson.annotate.JsonPropertyOrder;

@JsonPropertyOrder({ "TotalNotificationsCount", "TotalMsgCommentsCount" })
public class NotificationCommentsUnReadCounter {

	@JsonProperty("TotalNotificationsCount")
	private Integer totalNotificationsCount;
	@JsonProperty("TotalMsgCommentsCount")
	private Integer totalMsgCommentsCount;

	public Integer getTotalNotificationsCount() {
		return totalNotificationsCount;
	}

	public void setTotalNotificationsCount(Integer totalNotificationsCount) {
		this.totalNotificationsCount = totalNotificationsCount;
	}

	public Integer getTotalMsgCommentsCount() {
		return totalMsgCommentsCount;
	}

	public void setTotalMsgCommentsCount(Integer totalMsgCommentsCount) {
		this.totalMsgCommentsCount = totalMsgCommentsCount;
	}

	@JsonIgnore
	private Map<String, Object> additionalProperties = new HashMap<String, Object>();

	@JsonAnyGetter
	public Map<String, Object> getAdditionalProperties() {
		return this.additionalProperties;
	}

	@JsonAnySetter
	public void setAdditionalProperty(String name, Object value) {
		this.additionalProperties.put(name, value);
	}

}
