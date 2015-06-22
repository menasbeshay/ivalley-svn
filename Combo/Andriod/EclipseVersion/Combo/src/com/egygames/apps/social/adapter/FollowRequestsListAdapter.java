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
import android.widget.Toast;
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
import com.egygames.apps.social.model.RequestListiner;
import com.egygames.apps.social.views.PostPopupMenu;
import com.egygames.apps.social.views.util.TimeFormater;
import com.egygames.apps.social.views.util.Util;
import com.nostra13.universalimageloader.core.DisplayImageOptions;
import com.nostra13.universalimageloader.core.assist.ImageScaleType;
import com.nostra13.universalimageloader.core.listener.ImageLoadingListener;

public class FollowRequestsListAdapter extends BaseAdapter {

	ArrayList<Notification> notifications;
	private OnClickListener playAudioListener, playVideoListener,
			shareListener, commentListener, postMenu, likeListener;
	private BaseActivity activity;
	private LayoutInflater inflater;
	private DisplayImageOptions options;
	private ImageLoadingListener animateFirstListener = new AnimateFirstDisplayListener();
	private Util util;
	private int px;
	private Model model;

	public ArrayList<Notification> getPosts() {
		options = new DisplayImageOptions.Builder().cacheInMemory()
				.imageScaleType(ImageScaleType.EXACTLY).cacheOnDisc()
				.bitmapConfig(Bitmap.Config.RGB_565).build();
		return notifications;
	}

	public FollowRequestsListAdapter(BaseActivity context, ViewGroup parent) {
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
		px = (int) TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, 25,
				r.getDisplayMetrics());
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
		final Notification notification = notifications.get(position);
		final ViewGroup view;
		if (convertView == null) {
			view = (ViewGroup) inflater.inflate(
					R.layout.follow_request_list_item, parent, false);

			JSONObject jsonObject;
			try {

				jsonObject = new JSONArray(notification.getNotificationBody())
						.getJSONObject(0);

				TextView userName = (TextView) view.findViewById(R.id.username);
				userName.setText(jsonObject.getString("ComboUserName"));

				if (!jsonObject.isNull("FriendProfilePic"))
					displayImage(R.id.notificationType,
							jsonObject.getString("FriendProfilePic"), view);
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} else
			view = (ViewGroup) convertView;

		view.findViewById(R.id.acceptFollowRequest).setOnClickListener(
				new OnClickListener() {

					@Override
					public void onClick(View v) {
						// TODO Auto-generated method stub
						JSONObject jsonObject;
						try {
							jsonObject = new JSONArray(notification.getNotificationBody())
							.getJSONObject(0);
							model.respondToFollowRequest(notification.getComboNotificationID(),util.user.getComboUserID(),jsonObject.getString("ComboFriendID"), true, friendRequestListiner);
							view.findViewById(R.id.acceptFollowRequest).setVisibility(View.GONE);
							view.findViewById(R.id.rejectFollowRequest).setVisibility(View.GONE);
							view.findViewById(R.id.linear).setVisibility(View.GONE);
						} catch (JSONException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						
					}
				});

		view.findViewById(R.id.rejectFollowRequest).setOnClickListener(
				new OnClickListener() {

					@Override
					public void onClick(View v) {
						// TODO Auto-generated method stub
						JSONObject jsonObject;
						try {
							jsonObject = new JSONArray(notification.getNotificationBody())
							.getJSONObject(0);
							model.respondToFollowRequest(notification.getComboNotificationID(),util.user.getComboUserID(),jsonObject.getString("ComboFriendID"), false, friendRequestListiner);
							view.findViewById(R.id.acceptFollowRequest).setVisibility(View.GONE);
							view.findViewById(R.id.rejectFollowRequest).setVisibility(View.GONE);
							view.findViewById(R.id.linear).setVisibility(View.GONE);
						} catch (JSONException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
				});
		return view;
	}

	private void displayImage(View view, String path) {
		view.setVisibility(View.VISIBLE);
		if ("".equals(path)) {
			((ImageView) view).setImageResource(R.drawable.default_post_pic);
			return;
		}
		activity.util
				.loadImageByPath(
						"http://www.combomobile.com/comboapi/images.aspx?Image="
								+ path, ((ImageView) view),
						animateFirstListener);
	}
	
	private RequestListiner friendRequestListiner = new RequestListiner() {

		public void requestDone(Object result) {
//			showError(R.string.friendRequestDone);
			
		}

		@Override
		public void requestError(String result) {
			showError(result);
			notifyDataSetChanged();
		}

		@Override
		public void requestError(int errorResource) {
			showError(errorResource);
			notifyDataSetChanged();
		}
	};
	
	public void showError(int stringId) {
		Toast.makeText(activity, activity.getString(stringId), Toast.LENGTH_LONG).show();
	}


	public void showError(String string) {
		Toast.makeText(activity, string, Toast.LENGTH_LONG).show();
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
			activity.model.toggleLikePostByID(
					((Post) v.getTag()).getComboPostID(),
					activity.util.user.getComboUserID(),
					new DefaultRequestListiner() {
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
			share.putExtra(Intent.EXTRA_SUBJECT,
					((Post) v.getTag()).getPostText());
			share.putExtra(
					Intent.EXTRA_TEXT,
					"http://combomobile.com/showPost.html?id="
							+ ((Post) v.getTag()).getComboPostID());
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

	private void displayImage(int viewId, String path, View view) {
		if ("".equals(path)) {
			((ImageView) view.findViewById(viewId))
					.setImageResource(R.drawable.profile);
			return;
		}
		util.loadImageByPath(
				"http://www.combomobile.com/comboapi/images.aspx?Image=" + path,
				((ImageView) view.findViewById(viewId)), null);

	}
}
