package com.egygames.apps.social;

import android.os.Bundle;

import com.combomobile.R;

public class MainActivity extends BaseActivity {
//implements RequestListiner, OnLoadMoreListener, OnRefreshListener {
	//private PullAndLoadListView feedListView;
	//private int currentPage;
	//private PostsListAdapter adapter;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
	}
		//currentPage = 0;
	//	feedListView = (PullAndLoadListView) findViewById(R.id.feedsList);
	//	feedListView.setOnRefreshListener(this);
	//	feedListView.setOnLoadMoreListener(this);
		//adapter = new PostsListAdapter(this, feedListView);
		//feedListView.setAdapter(adapter);
		//model.getPostsList(util.user.getComboUserID(), currentPage, this);

	/*	User user=new User();
		user.setComboUserID(util.user.getComboUserID());
		user.setLocation(getGPS());
		
		model.updateUser(user,new DefaultRequestListiner() );
		
		//setSetNotificationsDone(true);
		setNotificationsAndMessagesCount();

	}

	@Override
	public void requestDone(Object result) {
		hideProgress();
		ArrayList<Post> posts = (ArrayList<Post>) result;
		if (posts.size() == 0 && currentPage == 0) {
			showView(findViewById(R.id.noData));
			return;
		}
		if (currentPage == 0)
			adapter.resetPosts();
		adapter.addPosts(posts);
		hideView(findViewById(R.id.noData));
		feedListView.onLoadMoreComplete();
		feedListView.onRefreshComplete();
		adapter.notifyDataSetChanged();
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
		model.getPostsList(util.user.getComboUserID(), currentPage, this);
	}

	@Override
	public void reload() {
		showProgress();
		model.getPostsList(util.user.getComboUserID(), currentPage, this);
	}

	@Override
	public void onRefresh() {
		model.getPostsList(util.user.getComboUserID(), 0, this);
		currentPage = 0;

	}

	private String getGPS() {
		LocationManager lm = (LocationManager) getSystemService(Context.LOCATION_SERVICE);
		List<String> providers = lm.getProviders(true);

		/*
		 * Loop over the array backwards, and if you get an accurate location,
		 * then break out the loop
		 */
		/*Location l = null;

		for (int i = providers.size() - 1; i >= 0; i--) {
			l = lm.getLastKnownLocation(providers.get(i));
			if (l != null)
				break;
		}

		double[] gps = new double[2];
		if (l != null) {
			gps[0] = l.getLatitude();
			gps[1] = l.getLongitude();
		}
		return gps[0] + "," + gps[1];
	}*/
}
