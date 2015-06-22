package com.egygames.apps.social;

import java.util.ArrayList;

import android.os.Bundle;
import android.view.View;
import android.widget.ListView;

import com.combomobile.R;
import com.egygames.apps.social.adapter.PostsTypeListAdapter;
import com.egygames.apps.social.entity.Post;
import com.egygames.apps.social.model.RequestListiner;

public class PostActivity extends BaseActivity implements RequestListiner {

	private String postId;
	private int currentPage;
	private ListView feedListView;
	private PostsTypeListAdapter adapter;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_post);
		if (!getIntent().hasExtra("postId")) {
			finish();
			return;
		}
		findViewById(R.id.back).setVisibility(View.GONE);

		setTitle(R.string.post);
		currentPage = 0;
		feedListView = (ListView) findViewById(R.id.feedsList);
		adapter = new PostsTypeListAdapter(this, feedListView,this,-1);
		adapter.setFullWidth(true);
		feedListView.setAdapter(adapter);
		showProgress();
		postId = getIntent().getStringExtra("postId");
		model.getPostByID(postId, 0, this);

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

}