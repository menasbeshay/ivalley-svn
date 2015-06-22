package com.egygames.apps.social;

import java.util.ArrayList;

import android.graphics.Color;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.view.View.OnFocusChangeListener;
import android.view.WindowManager;
import android.view.inputmethod.InputMethodManager;
import android.widget.ImageButton;
import android.widget.SearchView;
import android.widget.SearchView.OnQueryTextListener;
import android.widget.TextView;

import com.combomobile.R;
import com.costum.android.widget.PullAndLoadListView;
import com.costum.android.widget.PullAndLoadListView.OnLoadMoreListener;
import com.costum.android.widget.PullToRefreshListView.OnRefreshListener;
import com.egygames.apps.social.adapter.PostsTypeGridAdapter;
import com.egygames.apps.social.adapter.PostsTypeListAdapter;
import com.egygames.apps.social.entity.Post;
import com.egygames.apps.social.model.RequestListiner;
import com.egygames.apps.social.views.ExpandableHeightGridView;

public class ExploreActivity extends BaseActivity implements OnQueryTextListener , OnLoadMoreListener, OnRefreshListener {

	private String userId;
	private String searchText;

	private ExpandableHeightGridView feedListViewGrid;
	private PullAndLoadListView feedListViewList;
	private int currentPage;
	private PostsTypeListAdapter adapterList;
	private PostsTypeGridAdapter adapterGrid;
	private String method = "GetPosts";

	private SearchView searchView;

	private boolean isGrid=false;
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_explore);
		
		disableTab(R.id.explore);
		//setTitle(R.string.app_name);
		feedListViewGrid = (ExpandableHeightGridView) findViewById(R.id.feedsGrid);
		feedListViewGrid.setExpanded(true);
		adapterGrid = new PostsTypeGridAdapter(this, feedListViewGrid);
		feedListViewGrid.setAdapter(adapterGrid);
		//feedListViewGrid.setVerticalScrollBarEnabled(false);
		
		feedListViewList = (PullAndLoadListView) findViewById(R.id.feedsList);
		feedListViewList.setOnRefreshListener(this);
		feedListViewList.setOnLoadMoreListener(this);
		adapterList = new PostsTypeListAdapter(this, feedListViewList,ExploreActivity.this,-1);
		feedListViewList.setAdapter(adapterList);
		isReload=false;
		
		//showProgress();
		findViewById(R.id.progress2).setVisibility(View.VISIBLE);
		searchView = (SearchView) findViewById(R.id.searchView);
		searchView.setOnQueryTextListener(this);
	
		
	    userId=util.user.getComboUserID();
		int id = searchView.getContext().getResources().getIdentifier("android:id/search_src_text", null, null);
		TextView searchTextView = (TextView) searchView.findViewById(id);
	  
		searchTextView.setTextColor(Color.WHITE);
		feedListViewGrid.setNumColumns(3);
		adapterGrid.setFullWidth(false);
		
		adapterList.setFullWidth(true);
		// strip off hashtag from the URI
		if (getIntent().hasExtra("tagName")) {

			searchText = getIntent().getStringExtra("tagName");
			searchTextView.setText(searchText);
			model.searchPosts(util.user.getComboUserID(), searchText, currentPage, postListiner);

		} else {
			model.getPostsByType(userId, 0, method, postListiner);

		}

	}

	public void list(View v) {
		ImageButton listGridView=(ImageButton)findViewById(R.id.iv_grid_list);
		if(!isGrid)
		{
			isGrid=true;
			currentPage = 0;
			listGridView.setImageResource(R.drawable.list_icon_explore);
			feedListViewGrid.setNumColumns(3);
			adapterGrid.setFullWidth(false);
			findViewById(R.id.scrollView1_grid).setVisibility(View.VISIBLE);
			findViewById(R.id.feedsList).setVisibility(View.GONE);
			reload();
			
		}
		else
		{
			isGrid=false;
			currentPage = 0;
			listGridView.setImageResource(R.drawable.grid_icon_explore);
			adapterList = new PostsTypeListAdapter(this, feedListViewList,ExploreActivity.this,-1);
			adapterList.setFullWidth(true);
			feedListViewList.setAdapter(adapterList);
			findViewById(R.id.scrollView1_grid).setVisibility(View.GONE);
			findViewById(R.id.feedsList).setVisibility(View.VISIBLE);
			reload();
		}
	}

	public void grid(View v) {
		
	}

	//old was explore
	public void favourite(View v) {
		findViewById(R.id.linear1).setVisibility(View.INVISIBLE);
		findViewById(R.id.linear2).setVisibility(View.INVISIBLE);
		findViewById(R.id.linear3).setVisibility(View.VISIBLE);
		method = "GetFavouritePosts";
		reload();

	}

	//old was friends now explore
	public void explore(View v) {
		findViewById(R.id.linear1).setVisibility(View.INVISIBLE);
		findViewById(R.id.linear2).setVisibility(View.VISIBLE);
		findViewById(R.id.linear3).setVisibility(View.INVISIBLE);
		method = "ExplorePosts";
		reload();
	}

	public void followers(View v) {
		findViewById(R.id.linear1).setVisibility(View.VISIBLE);
		findViewById(R.id.linear2).setVisibility(View.INVISIBLE);
		findViewById(R.id.linear3).setVisibility(View.INVISIBLE);
		method = "GetPosts";
		reload();
	}

	boolean isReload=false;
	public void reload() {
		//showProgress();
		isReload=true;
		model.getPostsByType(userId, 0, method, postListiner);
		findViewById(R.id.progress2).setVisibility(View.VISIBLE);
	}

	private RequestListiner postListiner = new RequestListiner() {

		@Override
		public void requestDone(Object result) {
//			//hideProgress();
			if(isReload)
			{
				if(isGrid)
					adapterGrid.resetPosts();
				else 
					adapterList.resetPosts();
				isReload=false;
			}
			findViewById(R.id.progress2).setVisibility(View.GONE);
			ArrayList<Post> posts = (ArrayList<Post>) result;
			
			if (posts.size() == 0 && currentPage == 0) {
				showView(findViewById(R.id.noData));
				return;
			}
			if(posts.size() == 0&& currentPage != 0)
				return;
			if (currentPage == 0 && isGrid)
			{
				Log.d("here grid", "");
				adapterGrid.resetPosts();
			}
			else
				if (currentPage == 0 && !isGrid){
					Log.d("here", "");
					adapterList.resetPosts();
					
				}
			if(isGrid)
			{
				Log.d("here grid add", "");
				adapterGrid.addPosts(posts);
				adapterGrid.notifyDataSetChanged();
			}else
			{
				Log.d("here  add", "");
				adapterList.addPosts(posts);
				adapterList.notifyDataSetChanged();
			}
			hideView(findViewById(R.id.noData));
//			
//		
		}

		@Override
		public void requestError(String result) {
			//hideProgress();
			findViewById(R.id.progress2).setVisibility(View.GONE);
			showError(result);
		}

		@Override
		public void requestError(int errorResource) {
			//hideProgress();
			findViewById(R.id.progress2).setVisibility(View.GONE);
			showError(errorResource);
		}
	};

	@Override
	public boolean onQueryTextChange(String arg0) {
		return false;
	}

	@Override
	public boolean onQueryTextSubmit(String query) {
		searchText = query;
		currentPage = 0;
		model.searchPosts(util.user.getComboUserID(), searchText, currentPage, postListiner);
		
		return false;
	}

	public void search(View v) {
		searchText = searchView.getQuery().toString();
		currentPage = 0;
		model.searchPosts(util.user.getComboUserID(), searchText, currentPage, postListiner);
	}

	@Override
	public void onRefresh() {
		// TODO Auto-generated method stub
		model.getPostsByType(userId, 0, method, postListiner);
		currentPage = 0;

	}

	@Override
	public void onLoadMore() {
		// TODO Auto-generated method stub
		Log.d("load", "");
		currentPage++;
		model.getPostsByType(userId, currentPage, method, postListiner);
	}
	
	
	
}
