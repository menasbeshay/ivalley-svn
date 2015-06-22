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

@JsonPropertyOrder({ "ComboPostID", "PostText","Source","IsFavourite","IsLike","IsCommented","IsReposted","UserRankID", "ComboUserID", "ComboUserName", "ProfilePic","FriendProfilePic", "PostDate", "Likes", "Comments", "PostAttachemnts", "Attachments", "CommentsCount", "ShareCount", "IsDownloadable"})
public class Post {

	@JsonProperty("ComboPostID")
	private String ComboPostID;
	@JsonProperty("PostText")
	private String PostText;
	@JsonProperty("Source")
	private int originalCreator;
	@JsonProperty("IsFavourite")
	private boolean IsFavourite;
	@JsonProperty("IsLike")
	private boolean IsLike;
	@JsonProperty("IsCommented")
	private boolean IsCommented;
	@JsonProperty("IsReposted")
	private boolean IsReposted;
	public boolean isIsCommented() {
		return IsCommented;
	}

	public void setIsCommented(boolean isCommented) {
		IsCommented = isCommented;
	}

	public boolean isIsReposted() {
		return IsReposted;
	}

	public void setIsReposted(boolean isReposted) {
		IsReposted = isReposted;
	}

	@JsonProperty("UserRankID")
	private int UserRankID;
	public boolean isIsLike() {
		return IsLike;
	}

	public void setIsLike(boolean isLike) {
		IsLike = isLike;
	}

	public int getUserRankID() {
		return UserRankID;
	}

	public void setUserRankID(int userRankID) {
		UserRankID = userRankID;
	}

	public boolean isIsFavourite() {
		return IsFavourite;
	}

	public void setIsFavourite(boolean isFavourite) {
		IsFavourite = isFavourite;
	}

	public int getOriginalCreator() {
		return originalCreator;
	}

	public void setOriginalCreator(int originalCreator) {
		this.originalCreator = originalCreator;
	}

	@JsonProperty("ComboUserID")
	private String ComboUserID;
	@JsonProperty("ComboUserName")
	private String ComboUserName;
	@JsonProperty("ProfilePic")
	private String ProfilePic;
	@JsonProperty("FriendProfilePic")
	private String FriendProfilePic;
	public String getFriendProfilePic() {
		return FriendProfilePic;
	}

	public void setFriendProfilePic(String friendProfilePic) {
		FriendProfilePic = friendProfilePic;
	}

	@JsonProperty("PostDate")
	private Long PostDate;
	@JsonProperty("Likes")
	private List<Like> Likes = new ArrayList<Like>();
	@JsonProperty("Comments")
	private List<Comment> Comments = new ArrayList<Comment>();
	@JsonProperty("PostAttachemnts")
	private List<Attachment> PostAttachemnts = new ArrayList<Attachment>();
	public List<Attachment> getPostAttachments() {
		return PostAttachemnts;
	}

	public void setPostAttachments(List<Attachment> postAttachments) {
		PostAttachemnts = postAttachments;
	}

	@JsonProperty("Attachments")
	private List<Attachment> Attachments = new ArrayList<Attachment>();
	@JsonProperty("CommentsCount")
	private Integer CommentsCount;

	@JsonProperty("ShareCount")
	private Integer ShareCount;

	@JsonProperty("IsDownloadable")
	private Boolean IsDownloadable;

	@JsonProperty("HashTags")
	private List<PostHashTag> HashTags = new ArrayList<PostHashTag>();

	@JsonProperty("UserTags")
	private List<PostUserTag> UserTagss = new ArrayList<PostUserTag>();//"UserTags"

	public List<PostHashTag> getHashTags() {
		return HashTags;
	}

	public void setHashTags(List<PostHashTag> HashTags) {
		this.HashTags = HashTags;
	}

	public List<PostUserTag> getUserTagss() {
		return UserTagss;
	}

	public void setUserTagss(List<PostUserTag> UserTagss) {
		this.UserTagss = UserTagss;
	}

	public Integer getShareCount() {
		return ShareCount;
	}

	public void setShareCount(Integer shareCount) {
		ShareCount = shareCount;
	}

	public Boolean getIsDownloadable() {
		return IsDownloadable;
	}

	public void setIsDownloadable(Boolean isDownloadable) {
		IsDownloadable = isDownloadable;
	}

	@JsonIgnore
	private Map<String, Object> additionalProperties = new HashMap<String, Object>();

	/**
	 * 
	 * @return The ComboPostID
	 */
	@JsonProperty("ComboPostID")
	public String getComboPostID() {
		return ComboPostID;
	}

	/**
	 * 
	 * @param ComboPostID
	 *            The ComboPostID
	 */
	@JsonProperty("ComboPostID")
	public void setComboPostID(String ComboPostID) {
		this.ComboPostID = ComboPostID;
	}

	/**
	 * 
	 * @return The PostText
	 */
	@JsonProperty("PostText")
	public String getPostText() {
		return PostText;
	}

	/**
	 * 
	 * @param PostText
	 *            The PostText
	 */
	@JsonProperty("PostText")
	public void setPostText(String PostText) {
		this.PostText = PostText;
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
	 * @return The PostDate
	 */
	@JsonProperty("PostDate")
	public Long getPostDate() {
		return PostDate;
	}

	/**
	 * 
	 * @param PostDate
	 *            The PostDate
	 */
	@JsonProperty("PostDate")
	public void setPostDate(Long PostDate) {
		this.PostDate = PostDate;
	}

	/**
	 * 
	 * @return The Likes
	 */
	@JsonProperty("Likes")
	public List<Like> getLikes() {
		return Likes;
	}

	/**
	 * 
	 * @param Likes
	 *            The Likes
	 */
	@JsonProperty("Likes")
	public void setLikes(List<Like> Likes) {
		this.Likes = Likes;
	}

	/**
	 * 
	 * @return The Comments
	 */
	@JsonProperty("Comments")
	public List<Comment> getComments() {
		return Comments;
	}

	/**
	 * 
	 * @param Comments
	 *            The Comments
	 */
	@JsonProperty("Comments")
	public void setComments(List<Comment> Comments) {
		this.Comments = Comments;
	}

	/**
	 * 
	 * @return The Attachments
	 */
	@JsonProperty("Attachments")
	public List<Attachment> getAttachments() {
		return Attachments;
	}

	/**
	 * 
	 * @param Attachments
	 *            The Attachments
	 */
	@JsonProperty("Attachments")
	public void setAttachments(List<Attachment> Attachments) {
		this.Attachments = Attachments;
	}

	@JsonAnyGetter
	public Map<String, Object> getAdditionalProperties() {
		return this.additionalProperties;
	}

	@JsonAnySetter
	public void setAdditionalProperty(String name, Object value) {
		this.additionalProperties.put(name, value);
	}

	@JsonProperty("ComboUserName")
	public String getComboUserName() {
		return ComboUserName;
	}

	/**
	 * 
	 * @param ComboUserName
	 *            The ComboUserName
	 */
	@JsonProperty("ComboUserName")
	public void setComboUserName(String ComboUserName) {
		this.ComboUserName = ComboUserName;
	}

	/**
	 * 
	 * @return The ProfilePic
	 */
	@JsonProperty("ProfilePic")
	public String getProfilePic() {
		return ProfilePic;
	}

	/**
	 * 
	 * @param ProfilePic
	 *            The ProfilePic
	 */
	@JsonProperty("ProfilePic")
	public void setProfilePic(String ProfilePic) {
		this.ProfilePic = ProfilePic;
	}

	@JsonProperty("CommentsCount")
	public Integer getCommentsCount() {
		return CommentsCount;
	}

	/**
	 * 
	 * @param CommentsCount
	 *            The CommentsCount
	 */
	@JsonProperty("CommentsCount")
	public void setCommentsCount(Integer CommentsCount) {
		this.CommentsCount = CommentsCount;
	}
}
