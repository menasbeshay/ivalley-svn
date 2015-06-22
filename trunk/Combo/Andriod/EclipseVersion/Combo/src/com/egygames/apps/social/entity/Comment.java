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
    "ComboCommentID",
    "ComboPostID",
    "ComboMsgID",
    "CommentText",
    "PostCreatorID",
    "ComboUserID",
    "ComboUserName",
    "ProfilePic",
    "CommentDate",
    "Likes",
    "Attachments",
    "IsRead"
})
public class Comment {

    @JsonProperty("ComboCommentID")
    private String ComboCommentID;
    @JsonProperty("ComboPostID")
    private String ComboPostID;
    @JsonProperty("PostCreatorID")
    private String PostCreatorID;
    public String getCreatorUserID() {
		return PostCreatorID;
	}

	public void setCreatorUserID(String PostCreator) {
		PostCreatorID = PostCreator;
	}

	@JsonProperty("ComboMsgID")
    private String ComboMsgID;
    @JsonProperty("CommentText")
    private String CommentText;
    @JsonProperty("ComboUserID")
    private String ComboUserID;
    @JsonProperty("ComboUserName")
    private String ComboUserName;
    @JsonProperty("ProfilePic")
    private String ProfilePic;
    @JsonProperty("CommentDate")
    private Long CommentDate;
    @JsonProperty("Likes")
    private List<Like> Likes = new ArrayList<Like>();
    @JsonProperty("Attachments")
    private List<Attachment> Attachments = new ArrayList<Attachment>();
    @JsonProperty("IsRead")
    private Boolean IsRead;
    
    @JsonProperty("HashTags")
	private List<PostHashTag> HashTags = new ArrayList<PostHashTag>();

	@JsonProperty("UserTags")
	private List<PostUserTag> UserTagss = new ArrayList<PostUserTag>();

    
    public List<PostHashTag> getHashTags() {
		return HashTags;
	}

	public void setHashTags(List<PostHashTag> hashTags) {
		HashTags = hashTags;
	}

	public List<PostUserTag> getUserTagss() {
		return UserTagss;
	}

	public void setUserTagss(List<PostUserTag> userTagss) {
		UserTagss = userTagss;
	}

	@JsonIgnore
    private boolean IsLocal=false;
    
    public boolean getIsLocal() {
		return IsLocal;
	}

	public void setIsLocal(boolean isLocal) {
		IsLocal = isLocal;
	}

	@JsonIgnore
    private Map<String, Object> additionalProperties = new HashMap<String, Object>();

    /**
     * 
     * @return
     *     The ComboCommentID
     */
    @JsonProperty("ComboCommentID")
    public String getComboCommentID() {
        return ComboCommentID;
    }

    /**
     * 
     * @param ComboCommentID
     *     The ComboCommentID
     */
    @JsonProperty("ComboCommentID")
    public void setComboCommentID(String ComboCommentID) {
        this.ComboCommentID = ComboCommentID;
    }

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
     *     The CommentText
     */
    @JsonProperty("CommentText")
    public String getCommentText() {
        return CommentText;
    }

    /**
     * 
     * @param CommentText
     *     The CommentText
     */
    @JsonProperty("CommentText")
    public void setCommentText(String CommentText) {
        this.CommentText = CommentText;
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
     *     The CommentDate
     */
    @JsonProperty("CommentDate")
    public Long getCommentDate() {
        return CommentDate;
    }

    /**
     * 
     * @param CommentDate
     *     The CommentDate
     */
    @JsonProperty("CommentDate")
    public void setCommentDate(Long CommentDate) {
        this.CommentDate = CommentDate;
    }

    /**
     * 
     * @return
     *     The Likes
     */
    @JsonProperty("Likes")
    public List<Like> getLikes() {
        return Likes;
    }

    /**
     * 
     * @param Likes
     *     The Likes
     */
    @JsonProperty("Likes")
    public void setLikes(List<Like> Likes) {
        this.Likes = Likes;
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

    @JsonAnyGetter
    public Map<String, Object> getAdditionalProperties() {
        return this.additionalProperties;
    }

    @JsonAnySetter
    public void setAdditionalProperty(String name, Object value) {
        this.additionalProperties.put(name, value);
    }

}
