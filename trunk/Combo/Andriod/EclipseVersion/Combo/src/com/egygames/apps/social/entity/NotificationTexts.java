package com.egygames.apps.social.entity;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;

import com.combomobile.R;

public class NotificationTexts {

	public static String getCommentText(Notification notification) {
		String text = "";
		try {
			
			JSONObject jsonObject = new JSONArray(notification.getNotificationBody()).getJSONObject(0);
			if(jsonObject.isNull("PostAttachemnts"))
			{
				text = jsonObject.getString("ComboUserName") + " left a comment on your post:"+ jsonObject.getString("CommentText");
				
			}
			else
			{
				if(!jsonObject.getJSONArray("PostAttachemnts").isNull(0) && jsonObject.getJSONArray("PostAttachemnts").getJSONObject(0).getInt("AttachmentTypeID")==1)
				{
					text = jsonObject.getString("ComboUserName") + " left a comment on your Photo:"+ jsonObject.getString("CommentText");
				}
				else if(!jsonObject.getJSONArray("PostAttachemnts").isNull(0) && jsonObject.getJSONArray("PostAttachemnts").getJSONObject(0).getInt("AttachmentTypeID")==2)
				{
					text = jsonObject.getString("ComboUserName") + " left a comment on your Audio:"+ jsonObject.getString("CommentText");
				}
				else if(!jsonObject.getJSONArray("PostAttachemnts").isNull(0) && jsonObject.getJSONArray("PostAttachemnts").getJSONObject(0).getInt("AttachmentTypeID")==3)
				{
					text = jsonObject.getString("ComboUserName") + " left a comment on your Video:"+ jsonObject.getString("CommentText");
				}
				else
					text = jsonObject.getString("ComboUserName") + " left a comment on your post:"+ jsonObject.getString("CommentText");
					
					
			}
			notification.setTag(jsonObject.getString("ComboPostID"));
			
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return text;
	}

	public static String getLikeText(Notification notification) {
		String text = "";
		try {
			
			JSONObject jsonObject = new JSONArray(notification.getNotificationBody()).getJSONObject(0);
			if(jsonObject.isNull("Attachments"))
			{
				text = jsonObject.getString("UserName") + " liked your post";
				
			}
			else
			{
				if(!jsonObject.getJSONArray("Attachments").isNull(0) && jsonObject.getJSONArray("Attachments").getJSONObject(0).getInt("AttachmentTypeID")==1)
				{
					text = jsonObject.getString("UserName") + " liked your Photo";
				}
				else if(!jsonObject.getJSONArray("Attachments").isNull(0) && jsonObject.getJSONArray("Attachments").getJSONObject(0).getInt("AttachmentTypeID")==2)
				{
					text = jsonObject.getString("UserName") + " liked your Audio";
				}
				else if(!jsonObject.getJSONArray("Attachments").isNull(0) && jsonObject.getJSONArray("Attachments").getJSONObject(0).getInt("AttachmentTypeID")==3)
				{
					text = jsonObject.getString("UserName") + " liked your Video";
				}
				else
					text = jsonObject.getString("UserName") + " liked your post";
					
					
			}
			notification.setTag(jsonObject.getString("ComboPostID"));
			
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return text;

	}
	
	public static String getMentionText(Notification notification) {
		String text = "";
		try {
			
			JSONObject jsonObject = new JSONArray(notification.getNotificationBody()).getJSONObject(0);
			if(jsonObject.isNull("Attachments"))
			{
				text = jsonObject.getString("CreatorUserName") + " mentioned you his post:"+ jsonObject.getString("PostText");
				
			}
			else
			{
				if(!jsonObject.getJSONArray("Attachments").isNull(0) && jsonObject.getJSONArray("Attachments").getJSONObject(0).getInt("AttachmentTypeID")==1)
				{
					text = jsonObject.getString("CreatorUserName") + " mentioned you his Photo:"+ jsonObject.getString("PostText");
				}
				else if(!jsonObject.getJSONArray("Attachments").isNull(0) && jsonObject.getJSONArray("Attachments").getJSONObject(0).getInt("AttachmentTypeID")==2)
				{
					text = jsonObject.getString("CreatorUserName") + " mentioned you his Audio:"+ jsonObject.getString("PostText");
				}
				else if(!jsonObject.getJSONArray("Attachments").isNull(0) && jsonObject.getJSONArray("Attachments").getJSONObject(0).getInt("AttachmentTypeID")==3)
				{
					text = jsonObject.getString("CreatorUserName") + " mentioned you his Video:"+ jsonObject.getString("PostText");
				}
				else
					text = jsonObject.getString("CreatorUserName") + " mentioned you his post:"+ jsonObject.getString("PostText");
					
			}
			notification.setTag(jsonObject.getString("ComboPostID"));
			
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return text;
	}
	

	public static String getShareText(Notification notification) {
		String text="";
		try {
			
			JSONObject jsonObject = new JSONArray(notification.getNotificationBody()).getJSONObject(0);
			if(jsonObject.isNull("Attachments"))
			{
				text = jsonObject.getString("ComboFriendDisplayName") + " reposted your post";
				
			}
			else
			{
				if(!jsonObject.getJSONArray("Attachments").isNull(0) && jsonObject.getJSONArray("Attachments").getJSONObject(0).getInt("AttachmentTypeID")==1)
				{
					text = jsonObject.getString("ComboFriendDisplayName") + " reposted your Photo";
				}
				else if(!jsonObject.getJSONArray("Attachments").isNull(0) && jsonObject.getJSONArray("Attachments").getJSONObject(0).getInt("AttachmentTypeID")==2)
				{
					text = jsonObject.getString("ComboFriendDisplayName") + " reposted your Audio";
				}
				else if(!jsonObject.getJSONArray("Attachments").isNull(0) && jsonObject.getJSONArray("Attachments").getJSONObject(0).getInt("AttachmentTypeID")==3)
				{
					text = jsonObject.getString("ComboFriendDisplayName") + " reposted your Video";
				}
				else
					text = jsonObject.getString("ComboFriendDisplayName") + " reposted your post";
					
			}
			notification.setTag(jsonObject.getString("ComboPostID"));
			
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return text;

	}

	public static String getAddFriendText(Notification notification) {
		String text = "";
		try {
			JSONObject jsonObject = new JSONArray(notification.getNotificationBody()).getJSONObject(0);
			text = "You and " + jsonObject.getString("ComboFriendName") + " are now friends";
			notification.setTag(jsonObject.getString("ComboFriendID"));

		} catch (JSONException e) {
			e.printStackTrace();
		}
		return text;
	}

	public static String getUnFriendText(Notification notification) {
		String text = "";
		try {
			JSONObject jsonObject = new JSONArray(notification.getNotificationBody()).getJSONObject(0);
			text = "You and " + jsonObject.getString("ComboFriendName") + " aren\'t friends Now";
			notification.setTag(jsonObject.getString("ComboFriendID"));

		} catch (JSONException e) {
			e.printStackTrace();
		}
		return text;
	}

	
	public static String getMessageText(Notification notification) {
		String text = "";
		try {
			JSONObject jsonObject = new JSONArray(notification.getNotificationBody()).getJSONObject(0);
			text = "You have a message from " + jsonObject.getString("ComboUserName") + "";
			notification.setTag(jsonObject.getString("ComboUserID") + "," + jsonObject.getString("ProfilePic") + "," + jsonObject.getString("ComboUserName")

			);

		} catch (JSONException e) {
			e.printStackTrace();
		}
		return text;
	}
	
	public static String getRankText(Notification notification) {
		String text = "";
		try {
			JSONObject jsonObject = new JSONArray(notification.getNotificationBody()).getJSONObject(0);
			text ="Your Rank Level has Increased Congratulations!";
			//notification.setTag(jsonObject.getString("ComboFriendID"));
			
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return text;
	}
	
	public static String getBirthdayText(Notification notification) {
		String text = "";
		try {
			JSONObject jsonObject = new JSONArray(notification.getNotificationBody()).getJSONObject(0);
			text ="Today is "+jsonObject.getString("ComboFriendName")+"\'s Birthday";
			notification.setTag(jsonObject.getString("ComboFriendID"));
			
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return text;
	}
	
	public static String getAcceptFollowFriendText(Notification notification) {
		String text = "";
		try {
			JSONObject jsonObject = new JSONArray(notification.getNotificationBody()).getJSONObject(0);
			text =jsonObject.getString("ComboUserName")+" accepted your Follow Request";
			notification.setTag(jsonObject.getString("ComboFriendID"));

		} catch (JSONException e) {
			e.printStackTrace();
		}
		return text;
	}

	public static String getFollowFriendText(Notification notification) {
		String text = "";
		try {
			JSONObject jsonObject = new JSONArray(notification.getNotificationBody()).getJSONObject(0);
			text = "Accept or Ignore Follow Request from " + jsonObject.getString("ComboUserName");
			notification.setTag(jsonObject.getString("ComboFriendID"));

		} catch (JSONException e) {
			e.printStackTrace();
		}
		return text;
	}
	
	public static String getUnFollowFriendText(Notification notification) {
		String text = "";
		try {
			JSONObject jsonObject  = new JSONArray(notification.getNotificationBody()).getJSONObject(0);
			text = "Now, You don\'t follow " + jsonObject.getString("ComboFriendName");
			notification.setTag(jsonObject.getString("ComboFriendID"));


		} catch (JSONException e) {
			e.printStackTrace();
		}
		return text;
	}
	
	public static String getLikeProfileText(Notification notification) {
		String text = "";
		try {
			JSONObject jsonObject = new JSONArray(notification.getNotificationBody()).getJSONObject(0);
			text = jsonObject.getString("ComboFriendName") + " likes your profile";
			notification.setTag(jsonObject.getString("ComboFriendID"));
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return text;

	}
	
	public static String getUnLikeProfileText(Notification notification) {
		String text = "";
		try {
			JSONObject jsonObject = new JSONArray(notification.getNotificationBody()).getJSONObject(0);
			text = jsonObject.getString("ComboFriendName") + " dislikes your profile";
			notification.setTag(jsonObject.getString("ComboFriendID"));
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return text;

	}
	
	public static String getCommentOnMessageText(Notification notification) {
		String text = "";
		try {
			JSONObject jsonObject = new JSONArray(notification.getNotificationBody()).getJSONObject(0);
			text = jsonObject.getString("ComboUserName") + " commented on your message";
			notification.setTag(jsonObject.getString("ComboPostID"));
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return text;

	}
}
