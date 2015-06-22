package com.egygames.apps.social;

import java.util.ArrayList;

import android.graphics.Color;
import android.os.Bundle;
import android.view.View;
import android.widget.ImageButton;
import android.widget.SearchView;
import android.widget.SearchView.OnQueryTextListener;
import android.widget.TextView;

import com.combomobile.R;
import com.egygames.apps.social.adapter.CommentsListAdapter;
import com.egygames.apps.social.adapter.PostsTypeGridAdapter;
import com.egygames.apps.social.adapter.PostsTypeListAdapter;
import com.egygames.apps.social.entity.Post;
import com.egygames.apps.social.model.RequestListiner;
import com.egygames.apps.social.views.ExpandableHeightGridView;
import com.handmark.pulltorefresh.library.PullToRefreshBase;
import com.handmark.pulltorefresh.library.PullToRefreshListView;
import com.handmark.pulltorefresh.library.PullToRefreshBase.Mode;
import com.handmark.pulltorefresh.library.PullToRefreshBase.OnRefreshListener2;

public class SearchResultActivity extends BaseActivity implements  OnQueryTextListener{

	//private PullAndLoadListView feedListViewList;
	private PullToRefreshListView mPullRefreshListView;
	private int currentPage=0;
	private PostsTypeListAdapter adapterList;

	private SearchView searchView;
	private String searchText;
	private String userId;
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_search_result);
		disableTab(R.id.explore);
		//setTitle(R.string.app_name);
		
		searchView = (SearchView) findViewById(R.id.searchView);
		searchView.setOnQueryTextListener(this);

		userId=util.user.getComboUserID();
		int id = searchView.getContext().getResources().getIdentifier("android:id/search_src_text", null, null);
		TextView searchTextView = (TextView) searchView.findViewById(id);
		searchTextView.setTextColor(Color.WHITE);
		
		//feedListViewList = (PullAndLoadListView) findViewById(R.id.feedsList);
		//feedListViewList.setOnRefreshListener(this);
		//feedListViewList.setOnLoadMoreListener(this);
		
		mPullRefreshListView = (PullToRefreshListView) findViewById(R.id.feedsList);
		//feedListView = (PullToRefreshListView) findViewById(R.id.feedsList);
		//feedListView.setOnRefreshListener(this);
		  mPullRefreshListView.setMode(Mode.BOTH);
		 // adapter = new CommentsListAdapter(this, mPullRefreshListView);
		 // mPullRefreshListView.setAdapter(adapter);  
		adapterList = new PostsTypeListAdapter(this, mPullRefreshListView,SearchResultActivity.this,-1);
		mPullRefreshListView.setAdapter(adapterList);
		
		//feedListView.setAdapter(adapter);

		
		  mPullRefreshListView.setOnRefreshListener(new OnRefreshListener2() {

				@Override
				public void onPullDownToRefresh(PullToRefreshBase refreshView) {
					currentPage++;
					model.searchPosts(util.user.getComboUserID(), searchText, currentPage, postListiner);
				}

				@Override
				public void onPullUpToRefresh(PullToRefreshBase refreshView) {
					reload();
					model.searchPosts(util.user.getComboUserID(), searchText, currentPage, postListiner);
					currentPage = 0;
				}
			});
		  
		
		
		//showProgress();
		findViewById(R.id.progress2).setVisibility(View.VISIBLE);
		
		adapterList.setFullWidth(true);
		// strip off hashtag from the URI
		searchText=getIntent().getStringExtra("text");
		model.searchPosts(util.user.getComboUserID(), searchText, currentPage, postListiner);

	}
	
	boolean isReload=false;
	public void reload() {
		//showProgress();
		isReload=true;
		findViewById(R.id.progress2).setVisibility(View.VISIBLE);
	}

	private RequestListiner postListiner = new RequestListiner() {

		@Override
		public void requestDone(Object result) {
			//hideProgress();
			if(isReload)
			{
			adapterList.resetPosts();
				isReload=false;
			}
			findViewById(R.id.progress2).setVisibility(View.GONE);
			ArrayList<Post> posts = (ArrayList<Post>) result;
			if (posts.size() == 0 && currentPage == 0) {
				showView(findViewById(R.id.noData));
				return;
			}
			
			if (currentPage == 0)
				adapterList.resetPosts();
		
		    adapterList.addPosts(posts);
		    adapterList.notifyDataSetChanged();
			hideView(findViewById(R.id.noData));
			
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
		reload();
		model.searchPosts(util.user.getComboUserID(), searchText, currentPage, postListiner);
		return false;
	}

	public void search(View v) {
		searchText = searchView.getQuery().toString();
		currentPage = 0;
		reload();
		model.searchPosts(util.user.getComboUserID(), searchText, currentPage, postListiner);
		//model.searchPosts(util.user.getComboUserID(), searchText, currentPage, postListiner);
	}
}
