package com.egygames.apps.social;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.ListView;

import com.combomobile.R;
import com.egygames.apps.social.adapter.FriendsAdapter;
import com.egygames.apps.social.entity.User;

public class ProfilesListActivity extends BaseActivity implements OnItemClickListener {

	private FriendsAdapter adapter;
	private String method;
	private String userId;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_profiles_list);
		setTitle(R.string.profiles);
		if (getIntent().hasExtra("method")) {
			method = getIntent().getStringExtra("method");
			findViewById(R.id.addfriend).setVisibility(View.GONE);
			 userId=getIntent().getStringExtra("id");
		} else {
			method = "GetFriends";
			userId=util.user.getComboUserID();
		}
		adapter = new FriendsAdapter((ViewGroup) findViewById(R.id.parent),method,userId, this);
		ListView list = (ListView) findViewById(R.id.listView);
		list.setOnItemClickListener(this);
		list.setAdapter(adapter);

	}

	public void addFriend(View v) {
		startActivity(new Intent(this, AddFreindActivity.class));

	}

	@Override
	public void onItemClick(AdapterView<?> arg0, View arg1, int position, long arg3) {
		User user = (User) adapter.getItem(position);
		Intent intent = new Intent(this, ProfileActivity.class);
		intent.putExtra("ID", user.getComboUserID());
		startActivity(intent);
	}
}