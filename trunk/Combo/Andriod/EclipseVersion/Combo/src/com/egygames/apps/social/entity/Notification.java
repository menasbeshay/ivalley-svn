package com.egygames.apps.social.entity;

import java.util.HashMap;
import java.util.Map;

import org.codehaus.jackson.annotate.JsonAnyGetter;
import org.codehaus.jackson.annotate.JsonAnySetter;
import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.annotate.JsonProperty;
import org.codehaus.jackson.annotate.JsonPropertyOrder;

@JsonPropertyOrder({ "ComboNotificationID", "ComboUserID", "NotificationType", "NotificationDate", "NotificationBody", "IsRead" })
public class Notification {

	public enum NotificationTypeEnum {
		UNKNOWN(-1),
		LIKE(1),RANK(15),BIRTHDAY(16),FOLLOW_FRIEND(7), ACCEPT_FOLLOW_REQUEST(14)
		,COMMENT_ON_POST(2),SHARE_POST(5),MENTION(13),CHAT(17),OLD(8);
		// , ADD_FRIEND(3), RECEIVE_MSG(4), ACCEPT_FRIEND(6), UNFRIEND(9), COMMENT_ON_MESSAGE(10),LIKE_PROFILE(11),UNLIKE_PROFILE(12)
		//;
		private int _value;

		NotificationTypeEnum(int Value) {
			this._value = Value;
		}

		public int getValue() {
			return _value;
		}

		public static NotificationTypeEnum fromInt(Integer i) {
			for (NotificationTypeEnum b : NotificationTypeEnum.values()) {
				if (i.equals(b.getValue())) {
					return b;
				}
			}
			return NotificationTypeEnum.UNKNOWN;
		}

	};

	@JsonProperty("ComboNotificationID")
	private String ComboNotificationID;
	@JsonProperty("ComboUserID")
	private String ComboUserID;
	@JsonProperty("NotificationType")
	private Integer NotificationType;
	@JsonProperty("NotificationDate")
	private Long NotificationDate;
	@JsonProperty("NotificationBody")
	private String NotificationBody;
	@JsonProperty("IsRead")
	private Boolean IsRead;
	@JsonIgnore
	private String tag;

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	@JsonIgnore
	private Map<String, Object> additionalProperties = new HashMap<String, Object>();

	/**
	 * 
	 * @return The ComboNotificationID
	 */
	@JsonProperty("ComboNotificationID")
	public String getComboNotificationID() {
		return ComboNotificationID;
	}

	/**
	 * 
	 * @param ComboNotificationID
	 *            The ComboNotificationID
	 */
	@JsonProperty("ComboNotificationID")
	public void setComboNotificationID(String ComboNotificationID) {
		this.ComboNotificationID = ComboNotificationID;
	}

	/**
	 * 
	 * @return The ComboUserID
	 */
	@JsonProperty("ComboUserID")
	public String getComboUserID() {
		return ComboUserID;
	}

	/**
	 * 
	 * @param ComboUserID
	 *            The ComboUserID
	 */
	@JsonProperty("ComboUserID")
	public void setComboUserID(String ComboUserID) {
		this.ComboUserID = ComboUserID;
	}

	/**
	 * 
	 * @return The NotificationType
	 */
	@JsonProperty("NotificationType")
	private Integer getNotificationType() {
		return NotificationType;
	}

	/**
	 * 
	 * @param NotificationType
	 *            The NotificationType
	 */
	@JsonProperty("NotificationType")
	public void setNotificationType(Integer NotificationType) {
		this.NotificationType = NotificationType;
	}

	public NotificationTypeEnum getNotificationTypeEnum() {
		return NotificationTypeEnum.fromInt(NotificationType);
	}

	/**
	 * 
	 * @return The NotificationDate
	 */
	@JsonProperty("NotificationDate")
	public Long getNotificationDate() {
		return NotificationDate;
	}

	/**
	 * 
	 * @param NotificationDate
	 *            The NotificationDate
	 */
	@JsonProperty("NotificationDate")
	public void setNotificationDate(Long NotificationDate) {
		this.NotificationDate = NotificationDate;
	}

	/**
	 * 
	 * @return The NotificationBody
	 */
	@JsonProperty("NotificationBody")
	public String getNotificationBody() {
		return NotificationBody;
	}

	/**
	 * 
	 * @param NotificationBody
	 *            The NotificationBody
	 */
	@JsonProperty("NotificationBody")
	public void setNotificationBody(String NotificationBody) {
		this.NotificationBody = NotificationBody;
	}

	/**
	 * 
	 * @return The IsRead
	 */
	@JsonProperty("IsRead")
	public Boolean getIsRead() {
		return IsRead;
	}

	/**
	 * 
	 * @param IsRead
	 *            The IsRead
	 */
	@JsonProperty("IsRead")
	public void setIsRead(Boolean IsRead) {
		this.IsRead = IsRead;
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
