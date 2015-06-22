package com.egygames.apps.social;

import java.util.ArrayList;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.SearchView;
import android.widget.SearchView.OnQueryTextListener;

import com.combomobile.R;
import com.costum.android.widget.LoadMoreListView;
import com.costum.android.widget.LoadMoreListView.OnLoadMoreListener;
import com.egygames.apps.social.adapter.ProfilessAdapter;
import com.egygames.apps.social.entity.User;
import com.egygames.apps.social.model.RequestListiner;

public class AddFreindActivity extends BaseActivity implements OnLoadMoreListener, OnQueryTextListener, OnItemClickListener {

	private ProfilessAdapter adapter;
	private LoadMoreListView listView;
	private String searchText;
	private SearchView searchView;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_add_freind);
		listView = (LoadMoreListView) findViewById(R.id.listView);
		// listView.setOnRefreshListener(this);
		listView.setOnLoadMoreListener(this);
		listView.setOnItemClickListener(this);
		adapter = new ProfilessAdapter();
		listView.setAdapter(adapter);
		searchView = (SearchView) findViewById(R.id.searchView);
		searchView.setOnQueryTextListener(this);

	}

	@Override
	public boolean onQueryTextChange(String arg0) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean onQueryTextSubmit(String query) {
		searchText = query;
		currentPage = 0;
		model.searchForFriends(util.user.getComboUserID(), searchText, currentPage, searchListener);
		return false;
	}

	public void search(View v) {
		searchText = searchView.getQuery().toString();
		currentPage = 0;
		model.searchForFriends(util.user.getComboUserID(), searchText, currentPage, searchListener);
	}

	@Override
	public void onLoadMore() {
		currentPage++;
		model.searchForFriends(util.user.getComboUserID(), searchText, currentPage, searchListener);
	}

	private int currentPage;
	private RequestListiner searchListener = new RequestListiner() {

		@Override
		public void requestDone(Object result) {
			hideProgress();
			ArrayList<User> posts = (ArrayList<User>) result;
			if (posts.size() == 0 && currentPage == 0) {
				showView(findViewById(R.id.noData));
				return;
			}
			if (currentPage == 0)
				adapter.resetProfiles();
			adapter.addProfiles(posts);
			hideView(findViewById(R.id.noData));
			listView.onLoadMoreComplete();
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
	};

	@Override
	public void onItemClick(AdapterView<?> arg0, View arg1, int position, long arg3) {
		User user = (User) adapter.getItem(position);
		Intent intent = new Intent(this, ProfileActivity.class);
		intent.putExtra("ID", user.getComboUserID());
		startActivity(intent);
	}

}
