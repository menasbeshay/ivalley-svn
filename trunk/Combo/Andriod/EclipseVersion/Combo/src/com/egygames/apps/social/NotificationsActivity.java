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
import android.widget.ListView;
import android.widget.TextView;
import android.widget.AdapterView.OnItemClickListener;

import com.egygames.apps.social.entity.Notification;
import com.egygames.apps.social.entity.Notification.NotificationTypeEnum;
import com.combomobile.R;
import com.costum.android.widget.PullAndLoadListView;
import com.costum.android.widget.PullAndLoadListView.OnLoadMoreListener;
import com.costum.android.widget.PullToRefreshListView.OnRefreshListener;
import com.egygames.apps.social.adapter.NotificationsListAdapter;
import com.egygames.apps.social.entity.Notification;
import com.egygames.apps.social.model.DefaultRequestListiner;
import com.egygames.apps.social.model.RequestListiner;
import com.handmark.pulltorefresh.library.PullToRefreshBase;

public class NotificationsActivity extends BaseActivity implements RequestListiner, OnLoadMoreListener, OnRefreshListener, OnItemClickListener, com.handmark.pulltorefresh.library.PullToRefreshBase.OnRefreshListener2<ListView> {
	private com.handmark.pulltorefresh.library.PullToRefreshListView feedListView;
	private int currentPage;
	private NotificationsListAdapter adapter;
	ArrayList<Notification> follownotificationsList;
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_notifications);
		disableTab(R.id.notifications);
		setTitle(R.string.notifications);
		findViewById(R.id.tv_recent).setVisibility(View.VISIBLE);
		findViewById(R.id.linear_follow_request).setVisibility(View.VISIBLE);
		TextView notifcationTV=(TextView)findViewById(R.id.tv_requests_counts);
		findViewById(R.id.back).setVisibility(View.GONE);
		currentPage = 0;
		follownotificationsList=new ArrayList<Notification>();
		notifcationTV.setText(follownotificationsList.size()+"");
		feedListView = (com.handmark.pulltorefresh.library.PullToRefreshListView) findViewById(R.id.feedsList);
		feedListView.setOnItemClickListener(this);
		feedListView.setOnRefreshListener(this);
//		feedListView.setOnLoadMoreListener(this);
		adapter = new NotificationsListAdapter(this, feedListView);
		feedListView.setAdapter(adapter);
		model.getNotifications(util.user.getComboUserID(), currentPage, this);
		
		findViewById(R.id.linear_follow_request).setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View v) {
				// TODO Auto-generated method stub
				//open list of requests
				util.setFollownotificationsList(follownotificationsList);
				startActivity(new Intent(NotificationsActivity.this,FollowRequestsActivity.class));
			}
		});
	}

	@Override
	public void requestDone(Object result) {
		hideProgress();
		ArrayList<Notification> notifications = (ArrayList<Notification>) result;
		if (notifications.size() == 0 && currentPage == 0) {
			showView(findViewById(R.id.noData));
			
			return;
		}
		if (currentPage == 0)
			adapter.reset();
		hideView(findViewById(R.id.noData));
		filterNotifications(notifications);
//		feedListView.onLoadMoreComplete();
		feedListView.onRefreshComplete();
		//adapter.addNotifications(notifications);
		adapter.notifyDataSetChanged();
	}

	private void filterNotifications(ArrayList<Notification> notifications) {
		// TODO Auto-generated method stub
		//adapter.addNotifications(notifications);
		ArrayList<Notification> notificationsFiltered=new ArrayList<Notification>();
		follownotificationsList.clear();
		for(int i=0;i<notifications.size();i++)
		{
			if(notifications.get(i).getNotificationTypeEnum()==NotificationTypeEnum.FOLLOW_FRIEND)
			{
				follownotificationsList.add(notifications.get(i));
				//notifications.remove(i);
			}
			else if(notifications.get(i).getNotificationTypeEnum()!=NotificationTypeEnum.OLD)
				notificationsFiltered.add(notifications.get(i));
		}
		
		adapter.addNotifications(notificationsFiltered);
		
		if(follownotificationsList.size()>0)
		{
			///show 
			findViewById(R.id.tv_recent).setVisibility(View.VISIBLE);
			findViewById(R.id.linear_follow_request).setVisibility(View.VISIBLE);
			TextView notifcationTV=(TextView)findViewById(R.id.tv_requests_counts);
			notifcationTV.setText(follownotificationsList.size()+"");
			JSONObject jsonObject;
			try {
				jsonObject = new JSONArray(follownotificationsList.get(0).getNotificationBody()).getJSONObject(0);

				if(!jsonObject.isNull("FriendProfilePic"))
					displayImage(R.id.notificationfollow, jsonObject.getString("FriendProfilePic"));
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
	}

	private void displayImage(int viewId, String path) {
		if ("".equals(path)) {
			((ImageView)findViewById(viewId)).setImageResource(R.drawable.profile);
			return;
		}
		util.loadImageByPath("http://www.combomobile.com/comboapi/images.aspx?Image=" + path, ((ImageView)findViewById(viewId)), null);

	}
	

	@Override
	public void requestError(String result) {
		hideProgress();
		showError(result);
	}

	@Override
	public void requestError(int errorResource) {
		hideProgress();
		showError(errorResource);
	}

	@Override
	public void onLoadMore() {
		currentPage++;
		model.getNotifications(util.user.getComboUserID(), currentPage, this);
	}

	@Override
	public void reload() {
		showProgress();
		model.getNotifications(util.user.getComboUserID(), currentPage, this);
	}

	@Override
	public void onRefresh() {
		model.getNotifications(util.user.getComboUserID(), 0, this);
		currentPage = 0;

	}

	@Override
	public void onItemClick(AdapterView<?> arg0, View arg1, int position, long arg3) {
		/*Notification notification = (Notification) adapter.getItem(position - 1);
		model.toggleNotificationIsRead(notification.getComboNotificationID(), true, new DefaultRequestListiner());
		notification.setIsRead(true);
		adapter.notifyDataSetChanged();

		switch (notification.getNotificationTypeEnum()) {
		case LIKE:
		case COMMENT_ON_POST:
		case SHARE_POST:
		case MENTION:
		//case COMMENT_ON_MESSAGE:
			Intent postIntent = new Intent(this, PostActivity.class);
			postIntent.putExtra("postId", notification.getTag());
			startActivity(postIntent);
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
			Intent profileIntent = new Intent(this, ProfileActivity.class);
			profileIntent.putExtra("ID", notification.getTag());
			startActivity(profileIntent);
			break;
		/*case RECEIVE_MSG:
			String[] ids = notification.getTag().split(",");
			Intent messageIntent = new Intent(this, ChatActivity.class);
			messageIntent.putExtra("friendId", ids[0]);
			messageIntent.putExtra("friendPic", ids[1]);
			messageIntent.putExtra("friendName", ids[2]);
			startActivity(messageIntent);
			break;*/
			
		/*case RANK:
			Intent intent = new Intent(this, UserLevelActivity.class);
			intent.putExtra("FollowingCount", util.user.getFollowingCount());
			intent.putExtra("FollowersCount", util.user.getFollowersCount());
			intent.putExtra("PostsCount", util.user.getPostsCount());
			intent.putExtra("ProfileLikerCount", util.user.getProfileLikerCount());
			intent.putExtra("CommentsCount", util.user.getCommentsCount());
			intent.putExtra("TotalActivityDays", util.user.getTotalActivityDays());
			intent.putExtra("id", util.user.getComboUserID());
			startActivity(intent);

		}*/

	}

	

	@Override
	public void onPullDownToRefresh(PullToRefreshBase<ListView> refreshView) {
		// TODO Auto-generated method stub
		model.getNotifications(util.user.getComboUserID(), 0, this);
		currentPage = 0;
	}

	@Override
	public void onPullUpToRefresh(PullToRefreshBase<ListView> refreshView) {
		// TODO Auto-generated method stub
		currentPage++;
		model.getNotifications(util.user.getComboUserID(), currentPage, this);
	}

}
