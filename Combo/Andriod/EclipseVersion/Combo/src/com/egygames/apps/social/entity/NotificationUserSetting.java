
package com.egygames.apps.social.entity;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.codehaus.jackson.annotate.JsonAnyGetter;
import org.codehaus.jackson.annotate.JsonAnySetter;
import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.annotate.JsonProperty;
import org.codehaus.jackson.annotate.JsonPropertyOrder;

@JsonPropertyOrder({
    "NotificationUserSetting"
})
public class NotificationUserSetting {

    @JsonProperty("NotificationUserSetting")
    private List<NotificationUserSettingItem> NotificationUserSetting = new ArrayList<NotificationUserSettingItem>();
    @JsonIgnore
    private Map<String, Object> additionalProperties = new HashMap<String, Object>();

    /**
     * 
     * @return
     *     The NotificationUserSetting
     */
    @JsonProperty("NotificationUserSetting")
    public List<NotificationUserSettingItem> getNotificationUserSetting() {
        return NotificationUserSetting;
    }

    /**
     * 
     * @param NotificationUserSetting
     *     The NotificationUserSetting
     */
    @JsonProperty("NotificationUserSetting")
    public void setNotificationUserSetting(List<NotificationUserSettingItem> NotificationUserSetting) {
        this.NotificationUserSetting = NotificationUserSetting;
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
