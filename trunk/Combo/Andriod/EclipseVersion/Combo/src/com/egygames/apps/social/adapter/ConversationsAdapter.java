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
import com.egygames.apps.social.entity.Message;
import com.egygames.apps.social.model.RequestListiner;
import com.egygames.apps.social.views.util.TimeFormater;
import com.nostra13.universalimageloader.core.ImageLoader;

public class ConversationsAdapter extends BaseAdapter implements RequestListiner, OnLoadMoreListener {

	private int currentPage;
	private View progress;
	private LoadMoreListView listView;
	private BaseActivity activity;
	private ViewGroup container;
	private ArrayList<Message> profiles;

	public ConversationsAdapter(ViewGroup view, BaseActivity activity) {
		this.activity = activity;
		currentPage = 0;
		progress = view.findViewById(R.id.progress);
		listView = (LoadMoreListView) view.findViewById(R.id.listView);
		// listView.setOnRefreshListener(this);
		listView.setOnLoadMoreListener(this);
		container = view;
		profiles = new ArrayList<Message>();
		activity.model.getMessagesList(activity.util.user.getComboUserID(), currentPage, this);
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
			view = (ViewGroup) inflater.inflate(R.layout.conversation_item, parent, false);
		} else
			view = (ViewGroup) convertView;

		try {
			Message message = profiles.get(position);
			setText(view, R.id.userDisplayName, message.getComboUserName());
			setText(view, R.id.messageText, message.getMsgText());
			displayProfileImage(view, R.id.profiel, message.getProfilePic());
			setText(view, R.id.time, TimeFormater.getTimeAgo(message.getMsgDate()));
			
		} catch (Exception ex) {
		}
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
		ArrayList<Message> posts = (ArrayList<Message>) result;
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

	private void addFriends(ArrayList<Message> profiles) {
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
		activity.model.getFriends(activity.util.user.getComboUserID(), currentPage,"GetFriends", this);
	}

	public void reload() {
		activity.showView(progress);
		activity.model.getFriends(activity.util.user.getComboUserID(), currentPage,"GetFriends", this);
	}

	// @Override
	// public void onRefresh() {
	// currentPage = 0;
	// activity.model.getFriends(activity.util.user.getComboUserID(), currentPage, this);
	//
	// }

}
