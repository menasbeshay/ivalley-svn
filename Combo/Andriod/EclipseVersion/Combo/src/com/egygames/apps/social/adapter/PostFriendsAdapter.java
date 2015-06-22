package com.egygames.apps.social.adapter;

import java.util.ArrayList;

import android.app.Activity;
import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;

import com.combomobile.R;
import com.costum.android.widget.LoadMoreListView;
import com.costum.android.widget.LoadMoreListView.OnLoadMoreListener;
import com.egygames.apps.social.BaseActivity;
import com.egygames.apps.social.entity.User;
import com.egygames.apps.social.model.Model;
import com.egygames.apps.social.model.RequestListiner;
import com.egygames.apps.social.views.util.Util;
import com.nostra13.universalimageloader.core.ImageLoader;

public class PostFriendsAdapter extends BaseAdapter {

	// private LoadMoreListView listView;
	private Context activity;
	private ArrayList<User> profiles;
	private Util util;
	private String userId;

	public PostFriendsAdapter(Context activity, ArrayList<User> profiles,
			String userId) {
		this.activity = activity;
		this.profiles = profiles;
		this.userId = userId;
	}

	@Override
	public int getCount() {
		return profiles.size();
	}

	@Override
	public Object getItem(int arg0) {

		return profiles.get(arg0);
	}

	@Override
	public long getItemId(int arg0) {

		return arg0;
	}

	@Override
	public View getView(int position, View convertView, ViewGroup parent) {

		LayoutInflater inflater = LayoutInflater.from(parent.getContext());
		final ViewGroup view;
		if (convertView == null) {
			view = (ViewGroup) inflater.inflate(R.layout.post_friend_item,
					parent, false);
		} else
			view = (ViewGroup) convertView;
		final User user;
		try {
			user = profiles.get(position);
		} catch (Exception ex) {
			return view;
		}

		if (user.getIsFollowing() || user.getComboUserID() == userId) {
			((Button) (view.findViewById(R.id.follow)))
					.setText(R.string.unfollow);
			
			
			((Button) (view.findViewById(R.id.follow))).setBackgroundResource(R.drawable.rounded_following);
			((Button) (view.findViewById(R.id.follow))).setTextColor(0xffffffff);
		
		}

		view.findViewById(R.id.follow).setOnClickListener(
				new OnClickListener() {

					@Override
					public void onClick(View v) {
						// TODO Auto-generated method stub
						if (!(user.getIsFollowing() || user.getComboUserID() == userId)) {
							if (user.getIsPrivateAccount()) {
								Model.instance.requestFollowFriend(
										user.getComboUserID(), userId,
										friendRequestListiner);
							} else {
								Model.instance.toggleFollowFriend(
										user.getComboUserID(), userId,
										friendRequestListiner);
							}

							((Button) (view.findViewById(R.id.follow)))
									.setText(R.string.unfollow);
							((Button) (view.findViewById(R.id.follow))).setBackgroundResource(R.drawable.rounded_following);
							((Button) (view.findViewById(R.id.follow))).setTextColor(0xffffffff);
						}else{
							Model.instance.toggleFollowFriend(
									user.getComboUserID(), userId,
									friendRequestListiner);
							((Button) (view.findViewById(R.id.follow)))
							.setText(R.string.follow);
							((Button) (view.findViewById(R.id.follow))).setBackgroundResource(R.drawable.rounded_unfollowing);
							((Button) (view.findViewById(R.id.follow))).setTextColor(0xff520a76);
						}
					}
				});
		// setText(view, R.id.userDisplayName, user.getDisplayName());
		if (user.getUserName() == null)
			setText(view, R.id.userName, user.getComboUserName());
		else
			setText(view, R.id.userName, user.getUserName());
		// displayProfileImage(view, R.id.profiel, user.getProfilePic());
		return view;
	}

	private void setText(ViewGroup view, int fieldId, String text) {
		((TextView) view.findViewById(fieldId)).setText(text);

	}

	private RequestListiner friendRequestListiner = new RequestListiner() {

		public void requestDone(Object result) {

		}

		@Override
		public void requestError(String result) {
		}

		@Override
		public void requestError(int errorResource) {
		}
	};
}
