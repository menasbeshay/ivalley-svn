package com.egygames.apps.social.adapter;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import com.combomobile.R;

public class MessagesListAdapter extends BaseAdapter {

	// ArrayList<E>
	@Override
	public int getCount() {
		// TODO Auto-generated method stub
		return 5;
	}

	@Override
	public Object getItem(int arg0) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public long getItemId(int arg0) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public View getView(int position, View convertView, ViewGroup parent) {
		LayoutInflater inflater = LayoutInflater.from(parent.getContext());
		final ViewGroup view;
		if (convertView == null)
			view = (ViewGroup) inflater.inflate(R.layout.feed_list_item, parent, false);
		else
			view = (ViewGroup) convertView;
		return view;
	}

}
