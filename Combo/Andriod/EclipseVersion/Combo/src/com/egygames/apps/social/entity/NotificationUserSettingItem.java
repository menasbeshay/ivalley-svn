
package com.egygames.apps.social.entity;

import java.util.HashMap;
import java.util.Map;

import org.codehaus.jackson.annotate.JsonAnyGetter;
import org.codehaus.jackson.annotate.JsonAnySetter;
import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.annotate.JsonProperty;
import org.codehaus.jackson.annotate.JsonPropertyOrder;

@JsonPropertyOrder({
    "NotificationTypeID",
    "ComboUserID",
    "Status"
})
public class NotificationUserSettingItem {

    @JsonProperty("NotificationTypeID")
    private Integer NotificationTypeID;
    @JsonProperty("ComboUserID")
    private Integer ComboUserID;
    @JsonProperty("Status")
    private Integer Status;
    @JsonIgnore
    private Map<String, Object> additionalProperties = new HashMap<String, Object>();

    /**
     * 
     * @return
     *     The NotificationTypeID
     */
    @JsonProperty("NotificationTypeID")
    public Integer getNotificationTypeID() {
        return NotificationTypeID;
    }

    /**
     * 
     * @param NotificationTypeID
     *     The NotificationTypeID
     */
    @JsonProperty("NotificationTypeID")
    public void setNotificationTypeID(Integer NotificationTypeID) {
        this.NotificationTypeID = NotificationTypeID;
    }

    /**
     * 
     * @return
     *     The ComboUserID
     */
    @JsonProperty("ComboUserID")
    public Integer getComboUserID() {
        return ComboUserID;
    }

    /**
     * 
     * @param ComboUserID
     *     The ComboUserID
     */
    @JsonProperty("ComboUserID")
    public void setComboUserID(Integer ComboUserID) {
        this.ComboUserID = ComboUserID;
    }

    /**
     * 
     * @return
     *     The Status
     */
    @JsonProperty("Status")
    public Integer getStatus() {
        return Status;
    }

    /**
     * 
     * @param Status
     *     The Status
     */
    @JsonProperty("Status")
    public void setStatus(Integer Status) {
        this.Status = Status;
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
