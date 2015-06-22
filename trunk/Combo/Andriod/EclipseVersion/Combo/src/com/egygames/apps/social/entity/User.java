package com.egygames.apps.social.entity;

import java.util.HashMap;
import java.util.Map;

import org.codehaus.jackson.annotate.JsonAnyGetter;
import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.annotate.JsonProperty;
import org.codehaus.jackson.annotate.JsonPropertyOrder;

@JsonPropertyOrder({ "ComboUserName","ComboUserID", "UserName", "DisplayName", "Password", "Email", "Bio", "ProfileImgID", "CoverImgID", "GenderID", "IsActivated", "ExternalIDType", "ExternalID", "DeviceID", "ActivationCode", "PassResetCode", "ProfilePic", "CoverPic", "FollowingCount",
		"FollowersCount", "PostsCount", "PostsLikeCount", "FriendsCount", "IsFollower", "IsFollowing", "IsFriend", "FriendRequestSent", "SecurityQuestion", "SecurityAnswer", "UserRankID", "ProfileLikerCount", "SecurityWord", "BirthDate", "Country", "Phone", "Website",
		"CountryFlagPath", "CountryID", "Location", "CommentsCount", "TotalActivityDays", "IsPrivateAccount" })
public class User {

	@JsonProperty("ComboUserID")
	private String ComboUserID;
	@JsonProperty("UserName")
	private String UserName;
	@JsonProperty("DisplayName")
	private String DisplayName;
	@JsonProperty("ComboUserName")
	private String ComboUserName;
	public String getComboUserName() {
		return ComboUserName;
	}

	public void setComboUserName(String comboUserName) {
		ComboUserName = comboUserName;
	}

	@JsonProperty("Password")
	private String Password;
	@JsonProperty("Email")
	private String Email;
	@JsonProperty("Bio")
	private String Bio;
	@JsonProperty("ProfileImgID")
	private String ProfileImgID;
	@JsonProperty("CoverImgID")
	private String CoverImgID;
	@JsonProperty("GenderID")
	private Integer GenderID;
	@JsonProperty("IsActivated")
	private Boolean IsActivated;
	@JsonProperty("ExternalIDType")
	private String ExternalIDType;
	@JsonProperty("ExternalID")
	private String ExternalID;
	@JsonProperty("DeviceID")
	private String DeviceID;
	@JsonProperty("ActivationCode")
	private String ActivationCode;
	@JsonProperty("PassResetCode")
	private String PassResetCode;
	@JsonProperty("ProfilePic")
	private String ProfilePic;
	@JsonProperty("CoverPic")
	private String CoverPic;

	@JsonProperty("FollowingCount")
	private Integer FollowingCount;
	@JsonProperty("FollowersCount")
	private Integer FollowersCount;
	@JsonProperty("PostsCount")
	private Integer PostsCount;
	@JsonProperty("PostsLikeCount")
	private Integer PostsLikeCount;
	@JsonProperty("FriendsCount")
	private Integer FriendsCount;
	
	@JsonProperty("IsFollowingRequestSent")
	private Boolean IsFollowingRequestSent;
	
	@JsonProperty("IsFollowerRequestSent")
	private Boolean IsFollowerRequestSent ;

	@JsonProperty("IsFollower")
	private Boolean IsFollower;
	@JsonProperty("IsFollowing")
	private Boolean IsFollowing;
	@JsonProperty("IsFriend")
	private Boolean IsFriend;
	@JsonProperty("FriendRequestSent")
	private int FriendRequestSent;

	@JsonProperty("SecurityQuestion")
	private String SecurityQuestion;
	@JsonProperty("SecurityAnswer")
	private String SecurityAnswer;
	@JsonProperty("UserRankID")
	private Integer UserRankID;

	@JsonProperty("SecurityWord")
	private String SecurityWord;

	@JsonProperty("ProfileLikerCount")
	private Integer ProfileLikerCount;

	@JsonProperty("BirthDate")
	private String BirthDate;

	@JsonProperty("Country")
	private String Country;

	@JsonProperty("Phone")
	private String Phone;

	@JsonProperty("CountryFlagPath")
	private String CountryFlagPath;

	@JsonProperty("IsPrivateAccount")
	private boolean IsPrivateAccount;

	public boolean getIsPrivateAccount() {
		return IsPrivateAccount;
	}

	public Boolean getIsFollowingRequestSent() {
		return IsFollowingRequestSent;
	}

	public void setIsFollowingRequestSent(Boolean isFollowingRequestSent) {
		IsFollowingRequestSent = isFollowingRequestSent;
	}

	public Boolean getIsFollowerRequestSent() {
		return IsFollowerRequestSent;
	}

	public void setIsFollowerRequestSent(Boolean isFollowerRequestSent) {
		IsFollowerRequestSent = isFollowerRequestSent;
	}

	public void setIsPrivateAccount(boolean isPrivateAccount) {
		IsPrivateAccount = isPrivateAccount;
	}

	public String getCountryFlagPath() {
		return CountryFlagPath;
	}

	public void setCountryFlagPath(String countryFlagPath) {
		CountryFlagPath = countryFlagPath;
	}

	public Integer getCountryID() {
		return CountryID;
	}

	public void setCountryID(Integer countryID) {
		CountryID = countryID;
	}

	public String getLocation() {
		return Location;
	}

	public void setLocation(String location) {
		Location = location;
	}

	public Integer getCommentsCount() {
		return CommentsCount;
	}

	public void setCommentsCount(Integer commentsCount) {
		CommentsCount = commentsCount;
	}

	public Integer getTotalActivityDays() {
		return TotalActivityDays;
	}

	public void setTotalActivityDays(Integer totalActivityDays) {
		TotalActivityDays = totalActivityDays;
	}

	@JsonProperty("CountryID")
	private Integer CountryID;
	@JsonProperty("Location")
	private String Location;
	@JsonProperty("CommentsCount")
	private Integer CommentsCount;
	@JsonProperty("TotalActivityDays")
	private Integer TotalActivityDays;

	public Integer getProfileLikerCount() {
		return ProfileLikerCount;
	}

	public void setProfileLikerCount(Integer profileLikerCount) {
		ProfileLikerCount = profileLikerCount;
	}

	public String getBirthDate() {
		return BirthDate;
	}

	public void setBirthDate(String birthDate) {
		BirthDate = birthDate;
	}

	public String getCountry() {
		return Country;
	}

	public void setCountry(String country) {
		Country = country;
	}

	public String getPhone() {
		return Phone;
	}

	public void setPhone(String phone) {
		Phone = phone;
	}

	public String getWebsite() {
		return Website;
	}

	public void setWebsite(String website) {
		Website = website;
	}

	@JsonProperty("Website")
	private String Website;

	public Integer getUserRankID() {
		return UserRankID;
	}

	public void setUserRankID(Integer userRankID) {
		UserRankID = userRankID;
	}

	public String getSecurityQuestion() {
		return SecurityQuestion;
	}

	public void setSecurityQuestion(String securityQuestion) {
		SecurityQuestion = securityQuestion;
	}

	public String getSecurityAnswer() {
		return SecurityAnswer;
	}

	public void setSecurityAnswer(String securityAnswer) {
		SecurityAnswer = securityAnswer;
	}

	public Boolean getIsFollower() {
		return IsFollower;
	}

	public void setIsFollower(Boolean isFollower) {
		IsFollower = isFollower;
	}

	public Boolean getIsFollowing() {
		return IsFollowing;
	}

	public void setIsFollowing(Boolean isFollowing) {
		IsFollowing = isFollowing;
	}

	public Boolean getIsFriend() {
		return IsFriend;
	}

	public void setIsFriend(Boolean isFriend) {
		IsFriend = isFriend;
	}

	public int getFriendRequestSent() {
		return FriendRequestSent;
	}

	public void setFriendRequestSent(int FriendRequestSent) {
		this.FriendRequestSent = FriendRequestSent;
	}

	@JsonIgnore
	private Map<String, Object> additionalProperties = new HashMap<String, Object>();

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
	 * @return The UserName
	 */
	@JsonProperty("UserName")
	public String getUserName() {
		return UserName;
	}

	/**
	 * 
	 * @param UserName
	 *            The UserName
	 */
	@JsonProperty("UserName")
	public void setUserName(String UserName) {
		this.UserName = UserName;
	}

	/**
	 * 
	 * @return The DisplayName
	 */
	@JsonProperty("DisplayName")
	public String getDisplayName() {
		return DisplayName;
	}

	/**
	 * 
	 * @param DisplayName
	 *            The DisplayName
	 */
	@JsonProperty("DisplayName")
	public void setDisplayName(String DisplayName) {
		this.DisplayName = DisplayName;
	}

	/**
	 * 
	 * @return The Password
	 */
	@JsonProperty("Password")
	public String getPassword() {
		return Password;
	}

	/**
	 * 
	 * @param Password
	 *            The Password
	 */
	@JsonProperty("Password")
	public void setPassword(String Password) {
		this.Password = Password;
	}

	/**
	 * 
	 * @return The Email
	 */
	@JsonProperty("Email")
	public String getEmail() {
		return Email;
	}

	/**
	 * 
	 * @param Email
	 *            The Email
	 */
	@JsonProperty("Email")
	public void setEmail(String Email) {
		this.Email = Email;
	}

	/**
	 * 
	 * @return The Bio
	 */
	@JsonProperty("Bio")
	public String getBio() {
		return Bio;
	}

	/**
	 * 
	 * @param Bio
	 *            The Bio
	 */
	@JsonProperty("Bio")
	public void setBio(String Bio) {
		this.Bio = Bio;
	}

	/**
	 * 
	 * @return The ProfileImgID
	 */
	@JsonProperty("ProfileImgID")
	public String getProfileImgID() {
		return ProfileImgID;
	}

	/**
	 * 
	 * @param ProfileImgID
	 *            The ProfileImgID
	 */
	@JsonProperty("ProfileImgID")
	public void setProfileImgID(String ProfileImgID) {
		this.ProfileImgID = ProfileImgID;
	}

	/**
	 * 
	 * @return The CoverImgID
	 */
	@JsonProperty("CoverImgID")
	public String getCoverImgID() {
		return CoverImgID;
	}

	/**
	 * 
	 * @param CoverImgID
	 *            The CoverImgID
	 */
	@JsonProperty("CoverImgID")
	public void setCoverImgID(String CoverImgID) {
		this.CoverImgID = CoverImgID;
	}

	/**
	 * 
	 * @return The GenderID
	 */
	@JsonProperty("GenderID")
	public Integer getGenderID() {
		return GenderID;
	}

	/**
	 * 
	 * @param GenderID
	 *            The GenderID
	 */
	@JsonProperty("GenderID")
	public void setGenderID(Integer GenderID) {
		this.GenderID = GenderID;
	}

	/**
	 * 
	 * @return The IsActivated
	 */
	@JsonProperty("IsActivated")
	public Boolean getIsActivated() {
		return IsActivated;
	}

	/**
	 * 
	 * @param IsActivated
	 *            The IsActivated
	 */
	@JsonProperty("IsActivated")
	public void setIsActivated(Boolean IsActivated) {
		this.IsActivated = IsActivated;
	}

	/**
	 * 
	 * @return The ExternalIDType
	 */
	@JsonProperty("ExternalIDType")
	public String getExternalIDType() {
		return ExternalIDType;
	}

	/**
	 * 
	 * @param ExternalIDType
	 *            The ExternalIDType
	 */
	@JsonProperty("ExternalIDType")
	public void setExternalIDType(String ExternalIDType) {
		this.ExternalIDType = ExternalIDType;
	}

	/**
	 * 
	 * @return The ExternalID
	 */
	@JsonProperty("ExternalID")
	public String getExternalID() {
		return ExternalID;
	}

	/**
	 * 
	 * @param ExternalID
	 *            The ExternalID
	 */
	@JsonProperty("ExternalID")
	public void setExternalID(String ExternalID) {
		this.ExternalID = ExternalID;
	}

	/**
	 * 
	 * @return The DeviceID
	 */
	@JsonProperty("DeviceID")
	public String getDeviceID() {
		return DeviceID;
	}

	/**
	 * 
	 * @param DeviceID
	 *            The DeviceID
	 */
	@JsonProperty("DeviceID")
	public void setDeviceID(String DeviceID) {
		this.DeviceID = DeviceID;
	}

	/**
	 * 
	 * @return The ActivationCode
	 */
	@JsonProperty("ActivationCode")
	public String getActivationCode() {
		return ActivationCode;
	}

	/**
	 * 
	 * @param ActivationCode
	 *            The ActivationCode
	 */
	@JsonProperty("ActivationCode")
	public void setActivationCode(String ActivationCode) {
		this.ActivationCode = ActivationCode;
	}

	/**
	 * 
	 * @return The PassResetCode
	 */
	@JsonProperty("PassResetCode")
	public String getPassResetCode() {
		return PassResetCode;
	}

	/**
	 * 
	 * @param PassResetCode
	 *            The PassResetCode
	 */
	@JsonProperty("PassResetCode")
	public void setPassResetCode(String PassResetCode) {
		this.PassResetCode = PassResetCode;
	}

	/**
	 * 
	 * @return The ProfilePic
	 */
	@JsonProperty("ProfilePic")
	public String getProfilePic() {
		return ProfilePic;
	}

	public String getCoverPic() {
		return CoverPic;
	}

	public void setCoverPic(String coverPic) {
		CoverPic = coverPic;
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

	/**
	 * 
	 * @return The FollowingCount
	 */
	@JsonProperty("FollowingCount")
	public Integer getFollowingCount() {
		return FollowingCount;
	}

	/**
	 * 
	 * @param FollowingCount
	 *            The FollowingCount
	 */
	@JsonProperty("FollowingCount")
	public void setFollowingCount(Integer FollowingCount) {
		this.FollowingCount = FollowingCount;
	}

	/**
	 * 
	 * @return The FollowersCount
	 */
	@JsonProperty("FollowersCount")
	public Integer getFollowersCount() {
		return FollowersCount;
	}

	/**
	 * 
	 * @param FollowersCount
	 *            The FollowersCount
	 */
	@JsonProperty("FollowersCount")
	public void setFollowersCount(Integer FollowersCount) {
		this.FollowersCount = FollowersCount;
	}

	/**
	 * 
	 * @return The PostsCount
	 */
	@JsonProperty("PostsCount")
	public Integer getPostsCount() {
		return PostsCount;
	}

	/**
	 * 
	 * @param PostsCount
	 *            The PostsCount
	 */
	@JsonProperty("PostsCount")
	public void setPostsCount(Integer PostsCount) {
		this.PostsCount = PostsCount;
	}

	/**
	 * 
	 * @return The PostsLikeCount
	 */
	@JsonProperty("PostsLikeCount")
	public Integer getPostsLikeCount() {
		return PostsLikeCount;
	}

	/**
	 * 
	 * @param PostsLikeCount
	 *            The PostsLikeCount
	 */
	@JsonProperty("PostsLikeCount")
	public void setPostsLikeCount(Integer PostsLikeCount) {
		this.PostsLikeCount = PostsLikeCount;
	}

	/**
	 * 
	 * @return The FriendsCount
	 */
	@JsonProperty("FriendsCount")
	public Integer getFriendsCount() {
		return FriendsCount;
	}

	/**
	 * 
	 * @param FriendsCount
	 *            The FriendsCount
	 */
	@JsonProperty("FriendsCount")
	public void setFriendsCount(Integer FriendsCount) {
		this.FriendsCount = FriendsCount;
	}

	@JsonAnyGetter
	public Map<String, Object> getAdditionalProperties() {
		return this.additionalProperties;
	}

	public String getSecurityWord() {
		return SecurityWord;
	}

	public void setSecurityWord(String securityWord) {
		SecurityWord = securityWord;
	}

}