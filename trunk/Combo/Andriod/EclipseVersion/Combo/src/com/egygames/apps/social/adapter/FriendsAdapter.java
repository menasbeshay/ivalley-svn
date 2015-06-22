package com.egygames.apps.social.adapter;

import java.util.ArrayList;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import com.combomobile.R;
import com.costum.android.widget.LoadMoreListView;
import com.costum.android.widget.LoadMoreListView.OnLoadMoreListener;
import com.egygames.apps.social.BaseActivity;
import com.egygames.apps.social.entity.User;
import com.egygames.apps.social.model.RequestListiner;
import com.nostra13.universalimageloader.core.ImageLoader;

public class FriendsAdapter extends BaseAdapter implements RequestListiner, OnLoadMoreListener {

	private int currentPage;
	private View progress;
	private LoadMoreListView listView;
	private BaseActivity activity;
	private ViewGroup container;
	private ArrayList<User> profiles;
	private String method;
	private String userId;

	public FriendsAdapter(ViewGroup view, String method, BaseActivity activity) {
		this.activity = activity;
		this.method = method;
		currentPage = 0;
		progress = view.findViewById(R.id.progress);
		listView = (LoadMoreListView) view.findViewById(R.id.listView);
		// listView.setOnRefreshListener(this);
		listView.setOnLoadMoreListener(this);
		container = view;
		profiles = new ArrayList<User>();
		this.userId = activity.util.user.getComboUserID();
		activity.model.getFriends(userId, currentPage, method, this);
	}

	public FriendsAdapter(ViewGroup view, String method, String userId, BaseActivity activity) {
		this.userId = userId;
		this.activity = activity;
		this.method = method;
		currentPage = 0;
		progress = view.findViewById(R.id.progress);
		listView = (LoadMoreListView) view.findViewById(R.id.listView);
		// listView.setOnRefreshListener(this);
		listView.setOnLoadMoreListener(this);
		container = view;
		profiles = new ArrayList<User>();
		activity.model.getFriends(userId, currentPage, method, this);

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
		ViewGroup view;
		if (convertView == null) {
			view = (ViewGroup) inflater.inflate(R.layout.profile_item, parent, false);
		} else
			view = (ViewGroup) convertView;
		User user;
		try {
			user = profiles.get(position);
		} catch (Exception ex) {
			return view;
		}
		setText(view, R.id.userDisplayName, user.getDisplayName());
		setText(view, R.id.userName, user.getUserName());
		displayProfileImage(view, R.id.profiel, user.getProfilePic());
		return view;
	}

	private void displayProfileImage(ViewGroup view, int viewId, String path) {
		if ("".equals(path)) {
			((ImageView) view.findViewById(viewId)).setImageResource(R.drawable.profile);
			return;
		}
		ImageLoader.getInstance().displayImage("http://www.combomobile.com/comboapi/images.aspx?Image=" + path, ((ImageView) view.findViewById(viewId)));
	}

	private void setText(ViewGroup view, int fieldId, String text) {
		((TextView) view.findViewById(fieldId)).setText(text);

	}

	@Override
	public void requestDone(Object result) {
		activity.hideView(progress);
		ArrayList<User> posts = (ArrayList<User>) result;
		if (posts.size() == 0 && currentPage == 0) {
			activity.showView(container.findViewById(R.id.noData));
			return;
		}

		addFriends(posts);
		activity.hideView(container.findViewById(R.id.noData));
		listView.onLoadMoreComplete();
		// listView.onRefreshComplete();
		notifyDataSetChanged();
	}

	private void addFriends(ArrayList<User> profiles) {
		this.profiles.addAll(profiles);
		notifyDataSetChanged();

	}

	@Override
	public void requestError(String result) {
		activity.hideView(progress);
		activity.showError(result);
	}

	@Override
	public void requestError(int errorResource) {
		activity.hideView(progress);
		activity.showError(errorResource);
	}

	@Override
	public void onLoadMore() {
		currentPage++;
		activity.model.getFriends(userId, currentPage, method, this);
	}

	public void reload() {
		activity.showView(progress);
		activity.model.getFriends(userId, currentPage, method, this);
	}

	// @Override
	// public void onRefresh() {
	// currentPage = 0;
	// activity.model.getFriends(activity.util.user.getComboUserID(),
	// currentPage, this);
	//
	// }

}
