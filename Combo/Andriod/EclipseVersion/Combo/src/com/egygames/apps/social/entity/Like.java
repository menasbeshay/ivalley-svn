
package com.egygames.apps.social.entity;

import java.util.HashMap;
import java.util.Map;

import org.codehaus.jackson.annotate.JsonAnyGetter;
import org.codehaus.jackson.annotate.JsonAnySetter;
import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.annotate.JsonProperty;
import org.codehaus.jackson.annotate.JsonPropertyOrder;

@JsonPropertyOrder({
    "ComboPostID",
    "ComboUserID",
    "UserName"
})
public class Like {

    @JsonProperty("ComboPostID")
    private String ComboPostID;
    @JsonProperty("ComboUserID")
    private String ComboUserID;
    @JsonProperty("UserName")
    private String UserName;
    @JsonIgnore
    private Map<String, Object> additionalProperties = new HashMap<String, Object>();

    /**
     * 
     * @return
     *     The ComboPostID
     */
    @JsonProperty("ComboPostID")
    public String getComboPostID() {
        return ComboPostID;
    }

    /**
     * 
     * @param ComboPostID
     *     The ComboPostID
     */
    @JsonProperty("ComboPostID")
    public void setComboPostID(String ComboPostID) {
        this.ComboPostID = ComboPostID;
    }

    /**
     * 
     * @return
     *     The ComboUserID
     */
    @JsonProperty("ComboUserID")
    public String getComboUserID() {
        return ComboUserID;
    }

    /**
     * 
     * @param ComboUserID
     *     The ComboUserID
     */
    @JsonProperty("ComboUserID")
    public void setComboUserID(String ComboUserID) {
        this.ComboUserID = ComboUserID;
    }

    /**
     * 
     * @return
     *     The UserName
     */
    @JsonProperty("UserName")
    public String getUserName() {
        return UserName;
    }

    /**
     * 
     * @param UserName
     *     The UserName
     */
    @JsonProperty("UserName")
    public void setUserName(String UserName) {
        this.UserName = UserName;
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
