package com.egygames.apps.social.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;

import android.app.Activity;

import com.alexbbb.uploadservice.UploadService;
import com.combomobile.R;
import com.egygames.apps.social.BaseActivity;
import com.egygames.apps.social.entity.Attachment;
import com.egygames.apps.social.entity.Comment;
import com.egygames.apps.social.entity.Message;
import com.egygames.apps.social.entity.Notification;
import com.egygames.apps.social.entity.NotificationCommentsUnReadCounter;
import com.egygames.apps.social.entity.NotificationUserSetting;
import com.egygames.apps.social.entity.Post;
import com.egygames.apps.social.entity.Response;
import com.egygames.apps.social.entity.User;
import com.egygames.apps.social.model.upload.UploadReceiver;
import com.egygames.apps.social.views.util.Util;
import com.kbeanie.imagechooser.api.FileUtils;

public class Model implements NetworkListener {

	public static Model instance;
	private NetworkHandler request;
	private BaseActivity context;
	private Activity context1;
	public int newMessagesCount = 10;
	public int newNotifacationsCount = 9;

	// public ConnectivityChanged connectionStatus;

	public Model(BaseActivity context) {
		this.context = context;
		// connectionStatus=context.connectionStatus;
		instance = this;
		UploadService.NAMESPACE = "com.combomobile";

	}
	public Model(Activity context) {
		this.context1 = context;
		// connectionStatus=context.connectionStatus;
		instance = this;
		UploadService.NAMESPACE = "com.combomobile";

	}

	public static Model getInstance(BaseActivity context) {
		if (instance == null)
			new Model(context);
		return instance;
	}
	public static Model getInstance(Activity context) {
		if (instance == null)
			new Model(context);
		return instance;
	}

	public void login(final String name, final String password, final RequestListiner listener) {
		List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>(1);
		nameValuePairs.add(new BasicNameValuePair("username", name));
		nameValuePairs.add(new BasicNameValuePair("password", password));
		nameValuePairs.add(new BasicNameValuePair("DeviceID", Util.instance.getGCMRegestrationId()));
		request = new NetworkHandler<User>(new User(), "GetUser", nameValuePairs, this, listener);

	}

	public void requestFollowFriend (final String userId, final String followerId, final RequestListiner listener) {
		List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>(1);
		nameValuePairs.add(new BasicNameValuePair("userId", userId));
		nameValuePairs.add(new BasicNameValuePair("FollowerId", followerId));
		request = new NetworkHandler<User>(new User(), "RequestFollowFriend", nameValuePairs, this, listener);
	}
	
	public void toggleFollowFriend(final String userId, final String followerId, final RequestListiner listener) {
		List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>(1);
		nameValuePairs.add(new BasicNameValuePair("userId", userId));
		nameValuePairs.add(new BasicNameValuePair("FollowerId", followerId));
		request = new NetworkHandler<User>(new User(), "ToggleFollowFriend", nameValuePairs, this, listener);
	}

	public void reportPost(final String postId, final String description, final RequestListiner listener) {
		List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>(1);
		nameValuePairs.add(new BasicNameValuePair("id", postId));
		nameValuePairs.add(new BasicNameValuePair("description", description));
		request = new NetworkHandler<User>(new User(), "ReportPost", nameValuePairs, this, listener);
	}
	
	public void reportComment(final String postId, final String description, final RequestListiner listener) {
		List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>(1);
		nameValuePairs.add(new BasicNameValuePair("id", postId));
		nameValuePairs.add(new BasicNameValuePair("description", description));
		request = new NetworkHandler<User>(new User(), "ReportComment", nameValuePairs, this, listener);
	}
	
	public void reportUser(final String userId,final String reportedUserId, final String description, final RequestListiner listener) {
		List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>(3);
		nameValuePairs.add(new BasicNameValuePair("userId", userId));
		nameValuePairs.add(new BasicNameValuePair("ReportedUserID", reportedUserId));
		nameValuePairs.add(new BasicNameValuePair("ReportText", description));
		request = new NetworkHandler<User>(new User(), "ReportUser", nameValuePairs, this, listener);
	}
	
	public void postLikeFriends(final String postId, final String userId, final RequestListiner listener) {
		List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>(1);
		nameValuePairs.add(new BasicNameValuePair("PostID", postId));
		nameValuePairs.add(new BasicNameValuePair("UserID", userId));
		request = new NetworkHandler<User>(new User(), "GetPostLikes", nameValuePairs, this, listener);
	}
	
	public void getPostShares(final String postId, final String userId, final RequestListiner listener) {
		List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>(1);
		nameValuePairs.add(new BasicNameValuePair("PostID", postId));
		nameValuePairs.add(new BasicNameValuePair("UserID", userId));
		request = new NetworkHandler<User>(new User(), "GetPostShares", nameValuePairs, this, listener);
	}
	//

	public void toggleNotificationIsRead(final String notificationId, boolean isRead, final RequestListiner listener) {
		List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>(1);
		nameValuePairs.add(new BasicNameValuePair("id", notificationId));
		nameValuePairs.add(new BasicNameValuePair("isRead", isRead + ""));
		request = new NetworkHandler<User>(new User(), "ToggleNotificationIsRead", nameValuePairs, this, listener);
	}

	public void updateUser(User user, final RequestListiner listener) {
		request = new NetworkHandler<User>("UpdateUser", user, "user", this, listener);
	}

	public void setNotificationSettings(NotificationUserSetting notificationUserArray, final RequestListiner listener) {
		request = new NetworkHandler<NotificationUserSetting>("SetNotificationSettings",notificationUserArray, "NotificationUserSetting", this, listener);

	}
	
	public void addFriend(final String userId, final String friendId, final RequestListiner listener) {
		List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>(1);
		nameValuePairs.add(new BasicNameValuePair("userId", userId));
		nameValuePairs.add(new BasicNameValuePair("FriendId", friendId));
		request = new NetworkHandler<User>(new User(), "AddFriend", nameValuePairs, this, listener);

	}

	public void removeFriend(final String userId, final String friendId, final RequestListiner listener) {
		List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>(1);
		nameValuePairs.add(new BasicNameValuePair("userId", userId));
		nameValuePairs.add(new BasicNameValuePair("FriendId", friendId));
		request = new NetworkHandler<User>(new User(), "RemoveFriend", nameValuePairs, this, listener);

	}

	public void getUserFullProfile(final String userId, final String friendId, final RequestListiner listener) {
		List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>(1);
		nameValuePairs.add(new BasicNameValuePair("requester", userId));
		nameValuePairs.add(new BasicNameValuePair("id", friendId));
		request = new NetworkHandler<User>(new User(), "GetUserByID", nameValuePairs, this, listener);

	}

	public void getPostsByType(final String userId, int page, String method, final RequestListiner listener) {
		List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>(2);
		nameValuePairs.add(new BasicNameValuePair("UserID", userId));
		nameValuePairs.add(new BasicNameValuePair("Page", page + ""));
		request = new NetworkHandler<Post>(new Post(), method, nameValuePairs, this, listener);

	}

	//
	// public void getAudioPosts(final String userId, int page, final
	// RequestListiner listener) {
	// List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>(1);
	// nameValuePairs.add(new BasicNameValuePair("UserID", userId));
	// nameValuePairs.add(new BasicNameValuePair("Page", page + ""));
	// request = new NetworkHandler<Post>(new Post(), "GetAudioPosts",
	// nameValuePairs, this, listener);
	//
	// }
	//
	//
	// public void getTextPosts(final String userId, int page, final
	// RequestListiner listener) {
	// List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>(1);
	// nameValuePairs.add(new BasicNameValuePair("UserID", userId));
	// nameValuePairs.add(new BasicNameValuePair("Page", page + ""));
	// request = new NetworkHandler<Post>(new Post(), "GetTextPosts",
	// nameValuePairs, this, listener);
	//
	// }
	//
	// public void getVideoPosts(final String userId, int page, final
	// RequestListiner listener) {
	// List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>(1);
	// nameValuePairs.add(new BasicNameValuePair("UserID", userId));
	// nameValuePairs.add(new BasicNameValuePair("Page", page + ""));
	// request = new NetworkHandler<Post>(new Post(), "GetVedioPosts",
	// nameValuePairs, this, listener);
	//
	// }
	//
	public void respondToFriendRequest(final String userId, final String friendId, final boolean isAccepted, final RequestListiner listener) {
		List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>(1);
		nameValuePairs.add(new BasicNameValuePair("userId", userId));
		nameValuePairs.add(new BasicNameValuePair("FriendId", friendId));
		nameValuePairs.add(new BasicNameValuePair("isAccepted", isAccepted + ""));
		request = new NetworkHandler<User>(new User(), "RespondToFriendRequest", nameValuePairs, this, listener);

	}

	public void respondToFollowRequest(String notificationID,final String userId, final String friendId, final boolean isAccepted, final RequestListiner listener) {
		List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>(1);
		nameValuePairs.add(new BasicNameValuePair("userId", userId));
		nameValuePairs.add(new BasicNameValuePair("followerId", friendId));
		nameValuePairs.add(new BasicNameValuePair("IsApproved", isAccepted + ""));
		nameValuePairs.add(new BasicNameValuePair("notificationID", notificationID + ""));
		request = new NetworkHandler<User>(new User(), "RespondToRequestFollowFriend", nameValuePairs, this, listener);

	}
	
	public void searchForFriends(final String userId, final String searchText, final int pageIndex, final RequestListiner listener) {
		List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>(1);
		nameValuePairs.add(new BasicNameValuePair("userId", userId));
		nameValuePairs.add(new BasicNameValuePair("searchText", searchText));
		nameValuePairs.add(new BasicNameValuePair("pageIndex", pageIndex + ""));
		request = new NetworkHandler<User>(new User(), "SearchForFriends", nameValuePairs, this, listener);
		// request = new NetworkHandler<User>(new User(), "GetUsers",
		// nameValuePairs, this, listener);
	}

	public void searchPosts(final String userId, final String searchText, final int pageIndex, final RequestListiner listener) {
		List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>(1);
		nameValuePairs.add(new BasicNameValuePair("requester", userId));
		nameValuePairs.add(new BasicNameValuePair("filterText", searchText));
		nameValuePairs.add(new BasicNameValuePair("Page", pageIndex + ""));
		request = new NetworkHandler<Post>(new Post(), "SearchPosts", nameValuePairs, this, listener);
	}

	public void searchOnFriends(final String userId, final String searchText, final int pageIndex, final RequestListiner listener) {
		List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>(1);
		nameValuePairs.add(new BasicNameValuePair("userId", userId));
		nameValuePairs.add(new BasicNameValuePair("searchText", searchText));
		nameValuePairs.add(new BasicNameValuePair("pageIndex", pageIndex + ""));
		request = new NetworkHandler<User>(new User(), "SearchOnFriends", nameValuePairs, this, listener);
		// request = new NetworkHandler<User>(new User(), "GetUsers",
		// nameValuePairs, this, listener);
	}
	
	public void searchForTagging(final String userId, final String searchText, final String postID, final int pageIndex, final RequestListiner listener) {
		List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>(1);
		nameValuePairs.add(new BasicNameValuePair("userId", userId));
		nameValuePairs.add(new BasicNameValuePair("searchText", searchText));
		nameValuePairs.add(new BasicNameValuePair("postId", postID));
		nameValuePairs.add(new BasicNameValuePair("pageIndex", pageIndex + ""));
		request = new NetworkHandler<User>(new User(), "SearchForTagging", nameValuePairs, this, listener);
		// request = new NetworkHandler<User>(new User(), "GetUsers",
		// nameValuePairs, this, listener);
	}

	public void resetPassword(final String name, String answer, final RequestListiner listener) {
		List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>(1);
		nameValuePairs.add(new BasicNameValuePair("Username", name));
		nameValuePairs.add(new BasicNameValuePair("securityWord", answer));
		request = new NetworkHandler<User>(new User(), "ForgetPassword", nameValuePairs, this, listener);

	}

	public void getUsers(final RequestListiner listener) {
		List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>(1);
		request = new NetworkHandler<User>(new User(), "GetUsers", nameValuePairs, this, listener);

	}

	public void toggleLikePostByID(final String postId, final String userid, final RequestListiner listener) {
		List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>(2);
		nameValuePairs.add(new BasicNameValuePair("id", postId));
		nameValuePairs.add(new BasicNameValuePair("userid", userid));
		request = new NetworkHandler<User>(new User(), "ToggleLikePostByID", nameValuePairs, this, listener);

	}

	public void toggleFavouritePostByID(final String postId, final String userid, final RequestListiner listener) {
		List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>(2);
		nameValuePairs.add(new BasicNameValuePair("id", postId));
		nameValuePairs.add(new BasicNameValuePair("userid", userid));
		request = new NetworkHandler<User>(new User(), "ToggleFavouritePostByID", nameValuePairs, this, listener);

	}

	
	public void unFollowPost(final String postId, final String userid, final RequestListiner listener) {
		// List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>(2);
		// nameValuePairs.add(new BasicNameValuePair("id", postId));
		// nameValuePairs.add(new BasicNameValuePair("userid", userid));
		// request = new NetworkHandler<User>(new User(), "UnFollowPost",
		// nameValuePairs, this, listener);

	}

	public void sharePost(final String postId, final String userid, final RequestListiner listener) {
		List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>(2);
		nameValuePairs.add(new BasicNameValuePair("PostId", postId));
		nameValuePairs.add(new BasicNameValuePair("UserId", userid));
		request = new NetworkHandler<User>(new User(), "SharePost", nameValuePairs, this, listener);

	}

	public void createUser(String email, String password, String userName, String displayName, String answer, final RequestListiner listener) {
		User user = new User();
		user.setUserName(userName);
		user.setDisplayName(displayName);
		user.setPassword(password);
		user.setEmail(email);
		user.setDeviceID(Util.getInstance(context).getGCMRegestrationId());
		user.setSecurityWord(answer);
		// user.setSecurityQuestion("to be removed");
		// user.setSecurityAnswer("to be removed");
		// user.setBirthDate("1/1/1990 12:00:00 AM");
		// user.setCountry("ddd");
		// user.setPhone("ddd");
		// user.setWebsite("ddd");
		request = new NetworkHandler<User>("AddUser", user, "user", this, listener);

	}

	public void upload(final BaseActivity context, String uploadID, String filePath, String contentType, String userId, final RequestListiner listener) {
		UploadReceiver.upload(context, uploadID, "file", filePath, "temp." + FileUtils.getFileExtension(filePath), contentType, userId, listener);
	}

	public void upload(final BaseActivity context, String uploadID, boolean isProfile, String filePath, String contentType, String userId, final RequestListiner listener) {
		UploadReceiver.upload(context, uploadID, isProfile, "file", filePath, "temp." + FileUtils.getFileExtension(filePath), contentType, userId, listener);
	}

	public void getPostsList(String userId, int page, final RequestListiner listener) {
		List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>(2);
		nameValuePairs.add(new BasicNameValuePair("UserID", userId));
		nameValuePairs.add(new BasicNameValuePair("Page", page + ""));
		request = new NetworkHandler<Post>(new Post(), "GetPosts", nameValuePairs, this, listener);

	}

	public void getPostByID(String postId, int page, final RequestListiner listener) {
		List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>(2);
		nameValuePairs.add(new BasicNameValuePair("id", postId));
		nameValuePairs.add(new BasicNameValuePair("CommentPage", page + ""));
		request = new NetworkHandler<Post>(new Post(), "GetPostByID", nameValuePairs, this, listener);

	}

	public void deletePost(String id, final RequestListiner listener) {
		List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>(2);
		nameValuePairs.add(new BasicNameValuePair("id", id));
		request = new NetworkHandler<Post>(new Post(), "DeletePost", nameValuePairs, this, listener);

	}
	
	public void deleteComment(String id, final RequestListiner listener) {
		List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>(2);
		nameValuePairs.add(new BasicNameValuePair("id", id));
		request = new NetworkHandler<Post>(new Post(), "DeleteCommnet", nameValuePairs, this, listener);

	}
	
	public void deleteSharedPost(String userId,String id, final RequestListiner listener) {
		List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>(2);
		nameValuePairs.add(new BasicNameValuePair("PostID", id));
		nameValuePairs.add(new BasicNameValuePair("UserID", id));
		request = new NetworkHandler<Post>(new Post(), "DeleteSharedPost", nameValuePairs, this, listener);

	}

	public void deleteMessage(String id, final RequestListiner listener) {
		List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>(2);
		nameValuePairs.add(new BasicNameValuePair("id", id));
		request = new NetworkHandler<Post>(new Post(), "DeleteMsg", nameValuePairs, this, listener);

	}

	public void getMessageComments(String messageId, int page, final RequestListiner listener) {
		List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>(2);
		nameValuePairs.add(new BasicNameValuePair("MsgID", messageId));
		nameValuePairs.add(new BasicNameValuePair("Page", page + ""));
		nameValuePairs.add(new BasicNameValuePair("order", "asc"));

		request = new NetworkHandler<Comment>(new Comment(), "GetMessageComments", nameValuePairs, this, listener);

	}

	public void getFriendsPosts(String userId, int page, final RequestListiner listener) {
		List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>(2);
		nameValuePairs.add(new BasicNameValuePair("UserID", userId));
		nameValuePairs.add(new BasicNameValuePair("Page", page + ""));
		request = new NetworkHandler<Post>(new Post(), "GetFriendsPosts", nameValuePairs, this, listener);

	}

	public void getNotifications(String userId, int page, final RequestListiner listener) {
		List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>(2);
		nameValuePairs.add(new BasicNameValuePair("userID", userId));
		nameValuePairs.add(new BasicNameValuePair("pageIndex", page + ""));
		request = new NetworkHandler<Notification>(new Notification(), "GetNotifications", nameValuePairs, this, listener);

	}
	

	public void getNotificationsCommentsUnReadCounts(String userId, final RequestListiner listener) {
		List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>(1);
		nameValuePairs.add(new BasicNameValuePair("userID", userId+""));
		request = new NetworkHandler<NotificationCommentsUnReadCounter>(new NotificationCommentsUnReadCounter(), "GetCountUnReadNotificationsAndUnReadMsgComments", nameValuePairs, this, listener);

	}
	public void logout(String userId, final RequestListiner listener) {
		List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>(1);
		nameValuePairs.add(new BasicNameValuePair("ComboUserID", userId+""));
		request = new NetworkHandler<User>(new User(), "Logout", nameValuePairs, this, listener);

	}

	public void getFollowingPosts(String userId, int page, final RequestListiner listener) {
		List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>(2);
		nameValuePairs.add(new BasicNameValuePair("UserID", userId));
		nameValuePairs.add(new BasicNameValuePair("Page", page + ""));
		request = new NetworkHandler<Post>(new Post(), "GetFollowingPosts", nameValuePairs, this, listener);

	}

	public void getMessagesBetweenUsers(String userId, String friendId, int page, final RequestListiner listener) {
		List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>(2);
		nameValuePairs.add(new BasicNameValuePair("_1stUserID", userId));
		nameValuePairs.add(new BasicNameValuePair("_2ndUserID", friendId));
		nameValuePairs.add(new BasicNameValuePair("Page", page + ""));
		request = new NetworkHandler<Message>(new Message(), "GetMessagesBetweenUsers", nameValuePairs, this, listener);

	}

	public void toggleBanFriend(String userId, String friendId, final RequestListiner listener) {
		List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>(2);
		nameValuePairs.add(new BasicNameValuePair("userId", userId));
		nameValuePairs.add(new BasicNameValuePair("FriendId", friendId));
		nameValuePairs.add(new BasicNameValuePair("IsBanned", true + ""));

	}
	
	public void toggleBlockFriend(String userId, String friendId, final RequestListiner listener) {
		List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>(2);
		nameValuePairs.add(new BasicNameValuePair("userId", userId));
		nameValuePairs.add(new BasicNameValuePair("BlockedUserID", friendId));
		request = new NetworkHandler<Message>(new Message(), "ToggleBlockUser", nameValuePairs, this, listener);

	}

	public void getFriends(String userId, int page, String method, final RequestListiner listener) {
		List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>(2);
		nameValuePairs.add(new BasicNameValuePair("userID", userId));
		nameValuePairs.add(new BasicNameValuePair("pageIndex", page + ""));
		request = new NetworkHandler<User>(new User(), method, nameValuePairs, this, listener);

	}

	public void getProfileFollowers(String userId, int page, final RequestListiner listener) {
		List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>(2);
		nameValuePairs.add(new BasicNameValuePair("userID", userId));
		nameValuePairs.add(new BasicNameValuePair("pageIndex", page + ""));
		request = new NetworkHandler<User>(new User(), "GetProfileFollowers", nameValuePairs, this, listener);

	}

	public void getProfileFollowing(String userId, int page, final RequestListiner listener) {
		List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>(2);
		nameValuePairs.add(new BasicNameValuePair("userID", userId));
		nameValuePairs.add(new BasicNameValuePair("pageIndex", page + ""));
		request = new NetworkHandler<User>(new User(), "GetProfileFollowing", nameValuePairs, this, listener);

	}

	public void addNewPost(Post post, final RequestListiner listener) {

		request = new NetworkHandler<Post>("AddPost", post, "post", this, listener);

	}

	public void updatePost(final RequestListiner listener, Post post) {
		request = new NetworkHandler<Post>("UpdatePost", post, "post", this, listener);

	}

	public void addMessage(String userId, String friendId, String messageText, ArrayList<Attachment> attachments, final RequestListiner listener) {
		Message message = new Message();
		message.setComboUserID(userId);
		message.setToIds(friendId);
		if (attachments != null)
			message.setAttachments(attachments);

		message.setMsgText(messageText);
		request = new NetworkHandler<Message>("AddMessage", message, "msg", this, listener);
	}

	public void addMessageComment(Comment comment, final RequestListiner listener) {
		request = new NetworkHandler<Comment>("AddMessageComment", comment, "comment", this, listener);
	}

	public void addComment(Comment comment, final RequestListiner listener) {
		request = new NetworkHandler<Comment>("AddComment", comment, "comment", this, listener);
	}
	
	public void addComment(String userId, String postID, String commentText, ArrayList<Attachment> attachments, final RequestListiner listener) {
		Comment comment = new Comment();
		comment.setComboPostID(postID);
		if (attachments != null)
			comment.setAttachments(attachments);
		comment.setComboUserID(userId);
		comment.setCommentText(commentText);
		request = new NetworkHandler<Comment>("AddComment", comment, "comment", this, listener);
	}

	public void addMessageComment(String userId, String messageId, String commentText, ArrayList<Attachment> attachments, final RequestListiner listener) {
		Comment comment = new Comment();
		comment.setComboMsgID(messageId);
		if (attachments != null)
			comment.setAttachments(attachments);
		comment.setComboUserID(userId);
		comment.setCommentText(commentText);
		request = new NetworkHandler<Comment>("AddMessageComment", comment, "comment", this, listener);
	}

	public void getMessagesList(String userId, int page, final RequestListiner listener) {
		List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>(1);
		nameValuePairs.add(new BasicNameValuePair("UserID", userId));
		nameValuePairs.add(new BasicNameValuePair("Page", page + ""));
		request = new NetworkHandler<Message>(new Message(), "GetMessages", nameValuePairs, this, listener);

	}

	@Override
	public void responseReady(final Response networkResponse, final RequestListiner listener) {

		if (!networkResponse.getBool_result())
			listener.requestError(networkResponse.getErrorMsg());
		else {
			listener.requestDone(networkResponse.getEntity());
		}
		System.out.println(networkResponse.getBool_result());

	}

	@Override
	public void responseError(final Errors error, final RequestListiner listener) {
		switch (error) {
		case NETWORK_ERROR:
			listener.requestError(R.string.connectionError);
			break;
		case GENERAL_ERROR:
			//listener.requestError(R.string.genralError);
			break;

		}
	}

	public void stop() {
		// if (request != null)
		// request.cancel(true);
	}

}
