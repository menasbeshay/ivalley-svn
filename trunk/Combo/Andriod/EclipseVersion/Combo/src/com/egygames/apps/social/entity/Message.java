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
    "ComboMsgID",
    "MsgText",
    "ComboUserID",
    "ComboUserName",
    "ProfilePic",
    "MsgDate",
    "Comments",
    "Attachments",
    "CommentsCount",
    "IsRead",
    "ToIds"
})
public class Message {

    @JsonProperty("ComboMsgID")
    private String ComboMsgID;
    @JsonProperty("MsgText")
    private String MsgText;
    @JsonProperty("ComboUserID")
    private String ComboUserID;
    @JsonProperty("ComboUserName")
    private String ComboUserName;
    @JsonProperty("ProfilePic")
    private String ProfilePic;
    @JsonProperty("MsgDate")
    private Long MsgDate;
    @JsonProperty("Comments")
    private List<Comment> Comments = new ArrayList<Comment>();
    @JsonProperty("Attachments")
    private List<Attachment> Attachments = new ArrayList<Attachment>();
    @JsonProperty("CommentsCount")
    private String CommentsCount;
    @JsonProperty("IsRead")
    private Boolean IsRead;
    @JsonProperty("ToIds")
    private String ToIds;
    @JsonIgnore
    private Map<String, Object> additionalProperties = new HashMap<String, Object>();

    /**
     * 
     * @return
     *     The ComboMsgID
     */
    @JsonProperty("ComboMsgID")
    public String getComboMsgID() {
        return ComboMsgID;
    }

    /**
     * 
     * @param ComboMsgID
     *     The ComboMsgID
     */
    @JsonProperty("ComboMsgID")
    public void setComboMsgID(String ComboMsgID) {
        this.ComboMsgID = ComboMsgID;
    }

    /**
     * 
     * @return
     *     The MsgText
     */
    @JsonProperty("MsgText")
    public String getMsgText() {
        return MsgText;
    }

    /**
     * 
     * @param MsgText
     *     The MsgText
     */
    @JsonProperty("MsgText")
    public void setMsgText(String MsgText) {
        this.MsgText = MsgText;
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
     *     The ComboUserName
     */
    @JsonProperty("ComboUserName")
    public String getComboUserName() {
        return ComboUserName;
    }

    /**
     * 
     * @param ComboUserName
     *     The ComboUserName
     */
    @JsonProperty("ComboUserName")
    public void setComboUserName(String ComboUserName) {
        this.ComboUserName = ComboUserName;
    }

    /**
     * 
     * @return
     *     The ProfilePic
     */
    @JsonProperty("ProfilePic")
    public String getProfilePic() {
        return ProfilePic;
    }

    /**
     * 
     * @param ProfilePic
     *     The ProfilePic
     */
    @JsonProperty("ProfilePic")
    public void setProfilePic(String ProfilePic) {
        this.ProfilePic = ProfilePic;
    }

    /**
     * 
     * @return
     *     The MsgDate
     */
    @JsonProperty("MsgDate")
    public Long getMsgDate() {
        return MsgDate;
    }

    /**
     * 
     * @param MsgDate
     *     The MsgDate
     */
    @JsonProperty("MsgDate")
    public void setMsgDate(Long MsgDate) {
        this.MsgDate = MsgDate;
    }

    /**
     * 
     * @return
     *     The Comments
     */
    @JsonProperty("Comments")
    public List<Comment> getComments() {
        return Comments;
    }

    /**
     * 
     * @param Comments
     *     The Comments
     */
    @JsonProperty("Comments")
    public void setComments(List<Comment> Comments) {
        this.Comments = Comments;
    }

    /**
     * 
     * @return
     *     The Attachments
     */
    @JsonProperty("Attachments")
    public List<Attachment> getAttachments() {
        return Attachments;
    }

    /**
     * 
     * @param Attachments
     *     The Attachments
     */
    @JsonProperty("Attachments")
    public void setAttachments(List<Attachment> Attachments) {
        this.Attachments = Attachments;
    }

    /**
     * 
     * @return
     *     The CommentsCount
     */
    @JsonProperty("CommentsCount")
    public String getCommentsCount() {
        return CommentsCount;
    }

    /**
     * 
     * @param CommentsCount
     *     The CommentsCount
     */
    @JsonProperty("CommentsCount")
    public void setCommentsCount(String CommentsCount) {
        this.CommentsCount = CommentsCount;
    }

    /**
     * 
     * @return
     *     The IsRead
     */
    @JsonProperty("IsRead")
    public Boolean getIsRead() {
        return IsRead;
    }

    /**
     * 
     * @param IsRead
     *     The IsRead
     */
    @JsonProperty("IsRead")
    public void setIsRead(Boolean IsRead) {
        this.IsRead = IsRead;
    }

    /**
     * 
     * @return
     *     The ToIds
     */
    @JsonProperty("ToIds")
    public String getToIds() {
        return ToIds;
    }

    /**
     * 
     * @param ToIds
     *     The ToIds
     */
    @JsonProperty("ToIds")
    public void setToIds(String ToIds) {
        this.ToIds = ToIds;
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
