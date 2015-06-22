package com.egygames.apps.social.adapter;

import github.ankushsachdeva.emojicon.EmojiconTextView;

import java.util.ArrayList;
import java.util.regex.Pattern;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.text.Spannable;
import android.text.SpannableString;
import android.text.method.LinkMovementMethod;
import android.text.style.ClickableSpan;
import android.text.style.ForegroundColorSpan;
import android.text.util.Linkify;
import android.util.TypedValue;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.PopupWindow.OnDismissListener;
import android.widget.TextView;

import com.combomobile.R;
import com.egygames.apps.social.BaseActivity;
import com.egygames.apps.social.CommentsActivity;
import com.egygames.apps.social.PostActivity;
import com.egygames.apps.social.ProfileActivity;
import com.egygames.apps.social.UserLevelActivity;
import com.egygames.apps.social.entity.Notification;
import com.egygames.apps.social.entity.Post;
import com.egygames.apps.social.model.DefaultRequestListiner;
import com.egygames.apps.social.model.Model;
import com.egygames.apps.social.views.PostPopupMenu;
import com.egygames.apps.social.views.VideoView;
import com.egygames.apps.social.views.util.TimeFormater;
import com.egygames.apps.social.views.util.Util;
import com.nostra13.universalimageloader.core.DisplayImageOptions;
import com.nostra13.universalimageloader.core.assist.ImageScaleType;
import com.nostra13.universalimageloader.core.listener.ImageLoadingListener;

public class NotificationsListAdapter extends BaseAdapter {

	ArrayList<Notification> notifications;
	private OnClickListener playAudioListener, playVideoListener, shareListener, commentListener, postMenu, likeListener;
	private BaseActivity activity;
	private LayoutInflater inflater;
	private DisplayImageOptions options;
	private ImageLoadingListener animateFirstListener = new AnimateFirstDisplayListener();
	private Util util;
	private int px;
	private Model model;
	
	public ArrayList<Notification> getPosts() {
		options = new DisplayImageOptions.Builder().cacheInMemory().imageScaleType(ImageScaleType.EXACTLY).cacheOnDisc().bitmapConfig(Bitmap.Config.RGB_565).build();
		return notifications;
	}

	public NotificationsListAdapter(BaseActivity context, ViewGroup parent) {
		this.activity = context;
		playAudioListener = new PlayAudioListener();
		playVideoListener = new PlayVideoListener(context);
		shareListener = new SharePostListener();
		commentListener = new CommentsPostListener();
		likeListener = new LikePostListner();
		postMenu = new PostMenuListner();
		notifications = new ArrayList<Notification>();
		inflater = LayoutInflater.from(parent.getContext());
		util = Util.getInstance(context);
		Resources r = activity.getResources();
		px = (int) TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, 25, r.getDisplayMetrics());
		model = Model.getInstance(activity);
	}

	@Override
	public int getCount() {
		return notifications.size();
	}

	@Override
	public Object getItem(int position) {
		return notifications.get(position);
	}

	@Override
	public long getItemId(int position) {
		return position;
	}

	@Override
	public View getView(final int position, View convertView, ViewGroup parent) {
		Notification notification = notifications.get(position);
		PostViewHolder holder;
		ViewGroup view;
		
		if (convertView == null) {
			convertView = (ViewGroup) inflater.inflate(R.layout.notification_list_item, parent, false);
			view = (ViewGroup) convertView;
			holder = new PostViewHolder();
			
			holder.postText = view.findViewById(R.id.notificationText);
			Pattern tagMatcher = Pattern.compile("[#]+[A-Za-z0-9-_]+\\b");
			String newActivityURL = "content://com.combomobile.ExploreActivity/";
			Linkify.addLinks((TextView) holder.postText, tagMatcher, newActivityURL);
			
			((EmojiconTextView) holder.postText).setEmojiconSize(px);
			holder.visualizerView = view.findViewById(R.id.visualizerView);
			holder.postImage = view.findViewById(R.id.notificationPhoto);
			holder.profiel = view.findViewById(R.id.notificationType);
			holder.videoView = (VideoView)view.findViewById(R.id.videoView);
			
			view.setTag(holder);
		} else
		{
			view = (ViewGroup) convertView;
			holder = (PostViewHolder) view.getTag();
		}

		hideUneededViews(holder);
		//showAtachments(holder, post.getAttachments());
		switch (notification.getNotificationTypeEnum()) {
		
		
		case LIKE:	
			//notificationType.setImageResource(R.drawable.like_type);
			//setText(view, R.id.notificationText, getLikeText(notification,view,notificationText));
			getLikeText(notification,view,holder.postText,holder);
			break;
			
		case COMMENT_ON_POST:
			 getCommentText(notification,view,holder.postText,holder);
			//setText(view, R.id.notificationText, getCommentText(notification,view,notificationText));
			//notificationType.setImageResource(R.drawable.comment_type);
			break;
			
		case SHARE_POST:
			//notificationType.setImageResource(R.drawable.share_type);
			getShareText(notification,view,holder.postText,holder);
			//setText(view, R.id.notificationText, getShareText(notification,view,notificationText));
			break;

		case FOLLOW_FRIEND:
			//notificationType.setImageResource(R.drawable.friend_add_typr);
			 getFollowFriendText(notification,view,holder.postText,holder);
			//setText(view, R.id.notificationText, getFollowFriendText(notification,view,notificationText));
			break;
			
		case ACCEPT_FOLLOW_REQUEST:
			//notificationType.setImageResource(R.drawable.friend_add_typr);
			 getAcceptFollowFriendText(notification,view,holder.postText,holder);
			//setText(view, R.id.notificationText, getAcceptFollowFriendText(notification,view,notificationText));
			break;
			
		case BIRTHDAY:
			ImageView notificationPhoto= (ImageView) view.findViewById(R.id.notificationPhoto);
			notificationPhoto.setVisibility(View.VISIBLE);
			//set birthday ballons hear
			notificationPhoto.setImageResource(R.drawable.birthday);
			getBirthdayText(notification,view,holder.postText,holder);
			//setText(view, R.id.notificationText, getBirthdayText(notification,view,notificationText));
			break;
		
		case RANK:
			//notificationType.setImageResource(R.drawable.friend_add_typr);
			getRankText(notification,view,holder.postText,holder);
			//setText(view, R.id.notificationText, getRankText(notification,view,notificationText));
			break;
			
		case MENTION:
			getMentionText(notification,view,holder.postText,holder);
			//setText(view, R.id.notificationText, getMentionText(notification,view,notificationText));
			//notificationType.setImageResource(R.drawable.comment_type);
			break;
			
		case CHAT:
			break;
			
		default:
			//notificationType.setImageResource(R.drawable.profile_icon);
			break;
		}
		setText(view, R.id.time, TimeFormater.getTimeAgo(notification.getNotificationDate()));
		//ImageView notificationType = (ImageView) view.findViewById(R.id.notificationType);
		
		view.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View v) {
				// TODO Auto-generated method stub
				Notification notification = notifications.get(position);
				model.toggleNotificationIsRead(notification.getComboNotificationID(), true, new DefaultRequestListiner(activity));
				notification.setIsRead(true);
				//notifyDataSetChanged();

				switch (notification.getNotificationTypeEnum()) {
				case LIKE:
				case COMMENT_ON_POST:
				case SHARE_POST:
				case MENTION:
				//case COMMENT_ON_MESSAGE:
					Intent postIntent = new Intent(activity, PostActivity.class);
					postIntent.putExtra("postId", notification.getTag());
					activity.startActivity(postIntent);
					break;
				//case ADD_FRIEND:
				case FOLLOW_FRIEND:
				case ACCEPT_FOLLOW_REQUEST:
				case BIRTHDAY:
				//case UNFRIEND:
				//case ACCEPT_FRIEND:
				//case LIKE_PROFILE:
				//case UNLIKE_PROFILE:
				//case UNFOLLOW_FRIEND:
					Intent profileIntent = new Intent(activity, ProfileActivity.class);
					profileIntent.putExtra("ID", notification.getTag());
					activity.startActivity(profileIntent);
					break;
				/*case RECEIVE_MSG:
					String[] ids = notification.getTag().split(",");
					Intent messageIntent = new Intent(this, ChatActivity.class);
					messageIntent.putExtra("friendId", ids[0]);
					messageIntent.putExtra("friendPic", ids[1]);
					messageIntent.putExtra("friendName", ids[2]);
					startActivity(messageIntent);
					break;*/
					
				case RANK:
					Intent intent = new Intent(activity, UserLevelActivity.class);
					intent.putExtra("FollowingCount", util.user.getFollowingCount());
					intent.putExtra("FollowersCount", util.user.getFollowersCount());
					intent.putExtra("PostsCount", util.user.getPostsCount());
					intent.putExtra("ProfileLikerCount", util.user.getProfileLikerCount());
					intent.putExtra("CommentsCount", util.user.getCommentsCount());
					intent.putExtra("TotalActivityDays", util.user.getTotalActivityDays());
					intent.putExtra("id", util.user.getComboUserID());
					activity.startActivity(intent);
				}
			}
		});
		
		
		
		
		
		
		if (notification.getIsRead()) {
			view.setBackgroundColor(0xffffff);
		} else {
			view.setBackgroundColor(0x30520a76);
		}
		return view;
	}

	public String getRankText(Notification notification,View view,View notificationText,PostViewHolder holder) {
		String text = "";
		try {
			JSONObject jsonObject = new JSONArray(notification.getNotificationBody()).getJSONObject(0);
			text ="Your Rank Level has Increased Congratulations!";
			notification.setTag(jsonObject.getString("UserName"));
			setPostText(notification,notificationText,text,jsonObject.getString("ComboUserID"),jsonObject.getString("UserName"));
			if(!jsonObject.isNull("ProfilePic"))
				displayImage(holder.profiel, jsonObject.getString("ProfilePic"),view);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return text;
	}
	
	public String getBirthdayText(Notification notification,View view,View notificationText,PostViewHolder holder) {
		String text = "";
		try {
			JSONObject jsonObject = new JSONArray(notification.getNotificationBody()).getJSONObject(0);
			text ="Today is "+jsonObject.getString("ComboFriendName")+"\'s Birthday";
			notification.setTag(jsonObject.getString("ComboFriendID"));
			setPostText(notification,notificationText,text,jsonObject.getString("ComboUserID"),jsonObject.getString("UserName"));
			 if(!jsonObject.isNull("ProfilePic"))
				displayImage(holder.profiel, jsonObject.getString("ProfilePic"),view);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return text;
	}
	
	public String getAcceptFollowFriendText(Notification notification,View view,View notificationText,PostViewHolder holder) {
		String text = "";
		try {
			JSONObject jsonObject = new JSONArray(notification.getNotificationBody()).getJSONObject(0);
			text =jsonObject.getString("ComboUserName")+" accepted your Follow Request";
			notification.setTag(jsonObject.getString("ComboFriendID"));
			setPostText(notification,notificationText,text,jsonObject.getString("ComboFriendID"),jsonObject.getString("ComboUserName"));
			if(!jsonObject.isNull("FriendProfilePic"))
				displayImage(holder.profiel, jsonObject.getString("FriendProfilePic"),view);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return text;
	}
	
	public String getFollowFriendText(Notification notification,View view,View notificationText,PostViewHolder holder) {
		String text = "";
		try {
			JSONObject jsonObject = new JSONArray(notification.getNotificationBody()).getJSONObject(0);
			text = "Accept or Ignore Follow Request from " + jsonObject.getString("ComboUserName");
			setPostText(notification,notificationText,text,jsonObject.getString("ComboFriendID"),jsonObject.getString("ComboUserName"));
			notification.setTag(jsonObject.getString("ComboFriendID"));
			if(!jsonObject.isNull("FriendProfilePic"))
				displayImage(holder.profiel, jsonObject.getString("FriendProfilePic"),view);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return text;
	}
	
	public  String getShareText(Notification notification, ViewGroup view,View notificationText,PostViewHolder holder) {
		String text="";
		//ImageView notificationPhoto= (ImageView) view.findViewById(R.id.notificationPhoto);
		
		//set birthday ballons hear
		
		try {
			
			JSONObject jsonObject = new JSONArray(notification.getNotificationBody()).getJSONObject(0);
			if(jsonObject.isNull("Attachments"))
			{
				text = jsonObject.getString("ComboFriendDisplayName") + " reposted your post";
				holder.postImage.setVisibility(View.VISIBLE);
						((ImageView) holder.postImage).setImageResource(R.drawable.post_thumb_default);
			}
			else
			{
				if(!jsonObject.getJSONArray("Attachments").isNull(0) && jsonObject.getJSONArray("Attachments").getJSONObject(0).getInt("AttachmentTypeID")==1)
				{
					holder.postImage.setVisibility(View.VISIBLE);
					displayImage(holder.postImage,jsonObject.getJSONArray("Attachments").getJSONObject(0).getString("Path") );
					text = jsonObject.getString("ComboFriendDisplayName") + " reposted your Photo";
				}
				else if(!jsonObject.getJSONArray("Attachments").isNull(0) && jsonObject.getJSONArray("Attachments").getJSONObject(0).getInt("AttachmentTypeID")==2)
				{
					//VisualizerView audioView=(VisualizerView)view.findViewById(R.id.visualizerView);
					//holder.visualizerView.setTag("http://www.combomobile.com/" + jsonObject.getJSONArray("Attachments").getJSONObject(0).getString("Path"));
					text = jsonObject.getString("ComboFriendDisplayName") + " reposted your Audio";
				//	holder.visualizerView.setVisibility(View.VISIBLE);
				//	((ImageView) holder.visualizerView).setImageResource(R.drawable.post_thumb_default);
					//notificationPhoto.setImageResource(R.drawable.audio_thumb);
					holder.postImage.setVisibility(View.VISIBLE);
					((ImageView) holder.postImage).setImageResource(R.drawable.audio_thumb_noti);
				}
				else if(!jsonObject.getJSONArray("Attachments").isNull(0) && jsonObject.getJSONArray("Attachments").getJSONObject(0).getInt("AttachmentTypeID")==3)
				{
					text = jsonObject.getString("ComboFriendDisplayName") + " reposted your Video";
					//VideoView videoView =(VideoView)view.findViewById(R.id.videoIcon);
					holder.videoView.setTag("http://www.combomobile.com/" + jsonObject.getJSONArray("Attachments").getJSONObject(0).getString("Path"));
					//notificationPhoto.setImageResource(R.drawable.video);
					holder.videoView.setVisibility(View.VISIBLE);
				}
				else
				{
					holder.postImage.setVisibility(View.VISIBLE);
					((ImageView) holder.postImage).setImageResource(R.drawable.post_thumb_default);
					//notificationPhoto.setVisibility(View.VISIBLE);
					//notificationPhoto.setImageResource(R.drawable.post_thumb_default);
					text = jsonObject.getString("ComboFriendDisplayName") + " reposted your post";
				}
					
			}
			if(!jsonObject.isNull("ProfilePic"))
				displayImage(holder.profiel, jsonObject.getString("ProfilePic"),view);
			notification.setTag(jsonObject.getString("ComboPostID"));
			setPostText(notification,notificationText,text,jsonObject.getString("ComboUserID"),jsonObject.getString("ComboFriendDisplayName"));
			
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return text;

	}

	
	public String getLikeText(Notification notification, ViewGroup view,View notificationText,PostViewHolder holder ) {
		String text = "";
		try {
			//ImageView notificationPhoto= (ImageView) view.findViewById(R.id.notificationPhoto);
			
			JSONObject jsonObject = new JSONArray(notification.getNotificationBody()).getJSONObject(0);
			if(jsonObject.isNull("Attachments"))
			{
				//notificationPhoto.setVisibility(View.VISIBLE);
				//notificationPhoto.setImageResource(R.drawable.post_thumb_default);
				text = jsonObject.getString("UserName") + " liked your post";
				holder.postImage.setVisibility(View.VISIBLE);
				((ImageView) holder.postImage).setImageResource(R.drawable.post_thumb_default);
			}
			else
			{
				if(!jsonObject.getJSONArray("Attachments").isNull(0) && jsonObject.getJSONArray("Attachments").getJSONObject(0).getInt("AttachmentTypeID")==1)
				{
					
					holder.postImage.setVisibility(View.VISIBLE);
					displayImage(holder.postImage,jsonObject.getJSONArray("Attachments").getJSONObject(0).getString("Path") );
					text = jsonObject.getString("UserName") + " liked your Photo";
				}
				else if(!jsonObject.getJSONArray("Attachments").isNull(0) &&jsonObject.getJSONArray("Attachments").getJSONObject(0).getInt("AttachmentTypeID")==2)
				{
					text = jsonObject.getString("UserName") + " liked your Audio";
					//VisualizerView audioView=(VisualizerView)view.findViewById(R.id.visualizerView);
					holder.postImage.setVisibility(View.VISIBLE);
					((ImageView) holder.postImage).setImageResource(R.drawable.audio_thumb_noti);
					//holder.visualizerView.setTag("http://www.combomobile.com/" + jsonObject.getJSONArray("Attachments").getJSONObject(0).getString("Path"));
					
				}
				else if(!jsonObject.getJSONArray("Attachments").isNull(0) &&jsonObject.getJSONArray("Attachments").getJSONObject(0).getInt("AttachmentTypeID")==3)
				{
					text = jsonObject.getString("UserName") + " liked your Video";
					//VideoView videoView =(VideoView)view.findViewById(R.id.videoIcon);
					holder.videoView.setVisibility(View.VISIBLE);
					holder.videoView.setTag("http://www.combomobile.com/" + jsonObject.getJSONArray("Attachments").getJSONObject(0).getString("Path"));
				}
				else
				{
					holder.postImage.setVisibility(View.VISIBLE);
					((ImageView) holder.postImage).setImageResource(R.drawable.post_thumb_default);
					//notificationPhoto.setVisibility(View.VISIBLE);
					//notificationPhoto.setImageResource(R.drawable.post_thumb_default);
					text = jsonObject.getString("UserName") + " liked your post";
				}
					
			}
			if(!jsonObject.isNull("ProfilePic"))
				displayImage(holder.profiel, jsonObject.getString("ProfilePic"),view);
			notification.setTag(jsonObject.getString("ComboPostID"));
			setPostText(notification,notificationText,text,jsonObject.getString("ComboUserID"),jsonObject.getString("UserName"));
			
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return text;

	}
	
	public String getCommentText(Notification notification, ViewGroup view,View notificationText,PostViewHolder holder) {
		String text = "";
		try {
			//ImageView notificationPhoto= (ImageView) view.findViewById(R.id.notificationPhoto);
			JSONObject jsonObject = new JSONArray(notification.getNotificationBody()).getJSONObject(0);
			if(jsonObject.isNull("PostAttachemnts"))
			{
				holder.postImage.setVisibility(View.VISIBLE);
				((ImageView) holder.postImage).setImageResource(R.drawable.post_thumb_default);
				text = jsonObject.getString("ComboUserName") + " left a comment on your post:"+ manageMsgLength(jsonObject.getString("CommentText"));
				//notificationPhoto.setVisibility(View.VISIBLE);
				//notificationPhoto.setImageResource(R.drawable.post_thumb_default);
			}
			else
			{
				if(!jsonObject.getJSONArray("PostAttachemnts").isNull(0) && jsonObject.getJSONArray("PostAttachemnts").getJSONObject(0).getInt("AttachmentTypeID")==1)
				{
					
					holder.postImage.setVisibility(View.VISIBLE);
					displayImage(holder.postImage,jsonObject.getJSONArray("PostAttachemnts").getJSONObject(0).getString("Path") );
					text = jsonObject.getString("ComboUserName") + " left a comment on your Photo:"+ manageMsgLength(jsonObject.getString("CommentText"));
				}
				else if(!jsonObject.getJSONArray("PostAttachemnts").isNull(0) && jsonObject.getJSONArray("PostAttachemnts").getJSONObject(0).getInt("AttachmentTypeID")==2)
				{
					holder.postImage.setVisibility(View.VISIBLE);
					((ImageView) holder.postImage).setImageResource(R.drawable.audio_thumb_noti);
					//VisualizerView audioView=(VisualizerView)view.findViewById(R.id.visualizerView);
					//holder.visualizerView.setTag("http://www.combomobile.com/" + jsonObject.getJSONArray("PostAttachemnts").getJSONObject(0).getString("Path"));	
					//holder.visualizerView.setVisibility(View.VISIBLE);
					text = jsonObject.getString("ComboUserName") + " left a comment on your Audio:"+ manageMsgLength(jsonObject.getString("CommentText"));
				}
				else if(!jsonObject.getJSONArray("PostAttachemnts").isNull(0) && jsonObject.getJSONArray("PostAttachemnts").getJSONObject(0).getInt("AttachmentTypeID")==3)
				{
					//VideoView videoView =(VideoView)view.findViewById(R.id.videoIcon);
					holder.videoView.setTag("http://www.combomobile.com/" + jsonObject.getJSONArray("PostAttachemnts").getJSONObject(0).getString("Path"));
					holder.videoView.setVisibility(View.VISIBLE);
					text = jsonObject.getString("ComboUserName") + " left a comment on your Video:"+ manageMsgLength(jsonObject.getString("CommentText"));
				}
				else
				{
					holder.postImage.setVisibility(View.VISIBLE);
					((ImageView) holder.postImage).setImageResource(R.drawable.post_thumb_default);
					//notificationPhoto.setVisibility(View.VISIBLE);
					//notificationPhoto.setImageResource(R.drawable.post_thumb_default);
					text = jsonObject.getString("ComboUserName") + " left a comment on your post:"+ manageMsgLength(jsonObject.getString("CommentText"));
				}
					
			}
			if(!jsonObject.isNull("ProfilePic"))
				displayImage(holder.profiel, jsonObject.getString("ProfilePic"),view);
			notification.setTag(jsonObject.getString("ComboPostID"));
			setPostText(notification,notificationText,text,jsonObject.getString("ComboUserID"),jsonObject.getString("ComboUserName"));
			
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return text;
	}
	
	private String manageMsgLength(String msg)
	{
		if(!msg.equals(""))
		{
			String newMsg="";
			String[] messaList=msg.split(" ");
			for(int i=0;i<messaList.length;i++)
			{
				if(i<10)
					newMsg+=messaList[i]+" ";
			}
			if(messaList.length>=10)
				newMsg+="...";
			return newMsg;
		}
		return "";
	}
	
	private void hideUneededViews(PostViewHolder holder) {
		(holder.visualizerView).setVisibility(View.GONE);
		(holder.postImage).setVisibility(View.GONE);
		//(holder.profiel).setVisibility(View.GONE);
		(holder.videoView).setVisibility(View.GONE);
		
		//(holder.progress).setVisibility(View.GONE);
		// view.findViewById(R.id.surface_view).setVisibility(View.GONE);

	}
	
	public String getMentionText(Notification notification, ViewGroup view,View notificationText,PostViewHolder holder) {
		String text = "";
		try {
		//	ImageView notificationPhoto= (ImageView) view.findViewById(R.id.notificationPhoto);
			JSONObject jsonObject = new JSONArray(notification.getNotificationBody()).getJSONObject(0);
			if(jsonObject.isNull("Attachments"))
			{
				holder.postImage.setVisibility(View.VISIBLE);
				((ImageView) holder.postImage).setImageResource(R.drawable.post_thumb_default);
				//notificationPhoto.setVisibility(View.VISIBLE);
				//notificationPhoto.setImageResource(R.drawable.post_thumb_default);
				text = jsonObject.getString("CreatorUserName") + " mentioned you his post:"+ manageMsgLength(jsonObject.getString("PostText"));
				
			}
			else
			{
				if(!jsonObject.getJSONArray("Attachments").isNull(0) && jsonObject.getJSONArray("Attachments").getJSONObject(0).getInt("AttachmentTypeID")==1)
				{
					
					holder.postImage.setVisibility(View.VISIBLE);
					displayImage(holder.postImage,jsonObject.getJSONArray("Attachments").getJSONObject(0).getString("Path") );
					text = jsonObject.getString("CreatorUserName") + " mentioned you his Photo:"+ manageMsgLength(jsonObject.getString("PostText"));
				}
				else if(!jsonObject.getJSONArray("Attachments").isNull(0) && jsonObject.getJSONArray("Attachments").getJSONObject(0).getInt("AttachmentTypeID")==2)
				{
					//VisualizerView audioView=(VisualizerView)view.findViewById(R.id.visualizerView);
				//	holder.visualizerView.setTag("http://www.combomobile.com/" + jsonObject.getJSONArray("Attachments").getJSONObject(0).getString("Path"));
					//holder.visualizerView.setVisibility(View.VISIBLE);
					holder.postImage.setVisibility(View.VISIBLE);
					((ImageView) holder.postImage).setImageResource(R.drawable.audio_thumb_noti);
					text = jsonObject.getString("CreatorUserName") + " mentioned you his Audio:"+ manageMsgLength(jsonObject.getString("PostText"));
				}
				else if(!jsonObject.getJSONArray("Attachments").isNull(0) && jsonObject.getJSONArray("Attachments").getJSONObject(0).getInt("AttachmentTypeID")==3)
				{
					//VideoView videoView =(VideoView)view.findViewById(R.id.videoIcon);
					holder.videoView.setVisibility(View.VISIBLE);
					holder.videoView.setTag("http://www.combomobile.com/" + jsonObject.getJSONArray("Attachments").getJSONObject(0).getString("Path"));
					text = jsonObject.getString("CreatorUserName") + " mentioned you his Video:"+ manageMsgLength(jsonObject.getString("PostText"));
				}
				else
				{
					holder.postImage.setVisibility(View.VISIBLE);
					((ImageView) holder.postImage).setImageResource(R.drawable.post_thumb_default);
					//notificationPhoto.setVisibility(View.VISIBLE);
					//notificationPhoto.setImageResource(R.drawable.post_thumb_default);
					text = jsonObject.getString("CreatorUserName") + " mentioned you his post:"+ manageMsgLength(jsonObject.getString("PostText"));
				}
					
			}
			if(!jsonObject.isNull("CreatorProfilePic"))
				displayImage(holder.profiel, jsonObject.getString("CreatorProfilePic"),view);
			
			notification.setTag(jsonObject.getString("ComboPostID"));
			setPostText(notification,notificationText,text,jsonObject.getString("ComboUserID"),jsonObject.getString("CreatorUserName"));
			
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return text;
	}
	

	private void displayImage(View view, String path) {
		view.setVisibility(View.VISIBLE);
		if ("".equals(path)) {
			((ImageView) view).setImageResource(R.drawable.default_post_pic);
			return;
		}
		activity.util.loadImageByPath("http://www.combomobile.com/comboapi/images.aspx?Image=" + path, ((ImageView) view), animateFirstListener);
	}
	
	private void hideUneededViews(ViewGroup view) {
		view.findViewById(R.id.visualizerView).setVisibility(View.GONE);
		view.findViewById(R.id.postImage).setVisibility(View.GONE);
		view.findViewById(R.id.videoIcon).setVisibility(View.GONE);
		// view.findViewById(R.id.surface_view).setVisibility(View.GONE);

	}

	private void setListenr(View view, Post post, OnClickListener listener) {
		view.setTag(post);
		view.setOnClickListener(listener);
	}

	private void setText(ViewGroup view, int fieldId, String text) {
		((TextView) view.findViewById(fieldId)).setText(text);

	}

	public void addNotifications(ArrayList<Notification> posts) {
		this.notifications.addAll(posts);
		notifyDataSetChanged();

	}

	public class PlayVideoOrAudioListener implements OnClickListener {

		@Override
		public void onClick(View view) {
			activity.playVideoOrAudio((String) view.getTag());
		}

	}

	public class LikePostListner implements OnClickListener {

		@Override
		public void onClick(View v) {
			activity.model.toggleLikePostByID(((Post) v.getTag()).getComboPostID(), activity.util.user.getComboUserID(), new DefaultRequestListiner() {
				@Override
				public void requestDone(Object result) {
					activity.reload();
					super.requestDone(result);
				}

			});
		}

	}

	public class CommentsPostListener implements OnClickListener {

		@Override
		public void onClick(View v) {
			Intent intent = new Intent(activity, CommentsActivity.class);
			intent.putExtra("PostId", ((Post) v.getTag()).getComboPostID());
			activity.util.resetAttachments();
			activity.startActivity(intent);

		}

	}

	public class SharePostListener implements OnClickListener {

		@Override
		public void onClick(View v) {
			Intent share = new Intent(android.content.Intent.ACTION_SEND);
			share.setType("text/plain");
			// share.addFlags(Intent.FLAG_ACTIVITY_CLEAR_WHEN_TASK_RESET);
			share.putExtra(Intent.EXTRA_SUBJECT, ((Post) v.getTag()).getPostText());
			share.putExtra(Intent.EXTRA_TEXT, "http://combomobile.com/showPost.html?id=" + ((Post) v.getTag()).getComboPostID());
			activity.startActivity(Intent.createChooser(share, ""));
		}

	}

	private PostPopupMenu postPopupMenu;

	public class PostMenuListner implements OnClickListener {
		private boolean menuOpened;

		@Override
		public void onClick(View v) {
			if (menuOpened) {
				postPopupMenu.dismiss();
				postPopupMenu.setPost(((Post) v.getTag()));
				postPopupMenu.setAnchor(v);
				postPopupMenu.show();
				menuOpened = true;
			} else {
				if (postPopupMenu == null) {
					postPopupMenu = new PostPopupMenu(activity, v,((Post) v.getTag()));
					postPopupMenu.setOnDismissListener(new OnDismissListener() {
						@Override
						public void onDismiss() {
							menuOpened = false;

						}
					});
				}
				postPopupMenu.setPost(((Post) v.getTag()));
				postPopupMenu.setAnchor(v);
				postPopupMenu.show();
				menuOpened = true;
			}
		}

	}

	public void reset() {
		notifications.clear();

	}
	

	private void displayImage(View vi, String path,View view) {
		if ("".equals(path)) {
			((ImageView) vi).setImageResource(R.drawable.profile);
			return;
		}
		util.loadImageByPath("http://www.combomobile.com/comboapi/images.aspx?Image=" + path, ((ImageView) vi), null);

	}
	

	private void setPostText(Notification notification, View view,String text,final String userid,String username) {
			((TextView) view).setText(text);
			
			text=text.replace(username, "@"+username);
			
			SpannableString hashtagintitle = new SpannableString(text+" "+TimeFormater.getTimeAgo(notification.getNotificationDate()));


				hashtagintitle.setSpan(new ClickableSpan() {

					@Override
					public void onClick(View widget) {
						
							openProfile(widget.getContext(), userid);

					}
				}, 0, username.length()+1, 0);
			hashtagintitle.setSpan(new ForegroundColorSpan(Color.GRAY), hashtagintitle.length()-TimeFormater.getTimeAgo(notification.getNotificationDate()).length(), hashtagintitle.length(), Spannable.SPAN_EXCLUSIVE_EXCLUSIVE);
			
			((TextView) view).setMovementMethod(LinkMovementMethod.getInstance());
			((TextView) view).setText(hashtagintitle);
		
		
	}
	
	public void openProfile(Context context, String id) {
		Intent intent = new Intent(context, ProfileActivity.class);
		intent.putExtra("ID", id);
		context.startActivity(intent);
	}

}
