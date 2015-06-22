package com.egygames.apps.social.adapter;

import java.util.ArrayList;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import com.combomobile.R;
import com.egygames.apps.social.BaseActivity;
import com.egygames.apps.social.entity.User;
import com.nostra13.universalimageloader.core.ImageLoader;

public class ProfilessAdapter extends BaseAdapter {
	private ArrayList<User> profiles;
	public ProfilessAdapter( ) {
		profiles = new ArrayList<User>();
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
		User user = profiles.get(position);
		LayoutInflater inflater = LayoutInflater.from(parent.getContext());
		ViewGroup view;
		if (convertView == null) {
			view = (ViewGroup) inflater.inflate(R.layout.profile_item, parent, false);
		} else
			view = (ViewGroup) convertView;
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
		ImageLoader.getInstance().displayImage("http://www.combomobile.com" + path, ((ImageView) view.findViewById(viewId)));
	}

	private void setText(ViewGroup view, int fieldId, String text) {
		((TextView) view.findViewById(fieldId)).setText(text);

	}
	
	public void addProfiles(ArrayList<User> profiles) {
		this.profiles.addAll(profiles);
		notifyDataSetChanged();

	}
	public void resetProfiles() {
		this.profiles.clear();
		notifyDataSetChanged();

	}
		

}
