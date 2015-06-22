package com.egygames.apps.social;

import java.util.ArrayList;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.AdapterView;
import android.widget.ImageView;
import android.widget.AdapterView.OnItemClickListener;

import com.egygames.apps.social.entity.Notification;
import com.egygames.apps.social.entity.Notification.NotificationTypeEnum;
import com.combomobile.R;
import com.costum.android.widget.PullAndLoadListView;
import com.costum.android.widget.PullAndLoadListView.OnLoadMoreListener;
import com.costum.android.widget.PullToRefreshListView.OnRefreshListener;
import com.egygames.apps.social.adapter.FollowRequestsListAdapter;
import com.egygames.apps.social.adapter.NotificationsListAdapter;
import com.egygames.apps.social.entity.Notification;
import com.egygames.apps.social.model.DefaultRequestListiner;
import com.egygames.apps.social.model.RequestListiner;
import com.google.android.gms.drive.internal.ad;

public class FollowRequestsActivity extends BaseActivity {
	private PullAndLoadListView feedListView;
	private int currentPage;
	private FollowRequestsListAdapter adapter;
	ArrayList<Notification> follownotificationsList;
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_follow_requests);
		disableTab(R.id.notifications);
		setTitle(R.string.follow_requests);
		currentPage = 0;
		follownotificationsList=util.getFollownotificationsList();
		feedListView = (PullAndLoadListView) findViewById(R.id.feedsList);
		adapter = new FollowRequestsListAdapter(this, feedListView);
		feedListView.setAdapter(adapter);
		adapter.addNotifications(follownotificationsList);
		adapter.notifyDataSetChanged();
	}
	
}
