package com.egygames.apps.social;

import java.util.ArrayList;

import android.os.Bundle;

import com.combomobile.R;
import com.combomobile.R.id;
import com.combomobile.R.layout;
import com.combomobile.R.string;
import com.egygames.apps.social.adapter.PostsTypeListAdapter;
import com.egygames.apps.social.entity.Post;
import com.egygames.apps.social.model.RequestListiner;
import com.egygames.apps.social.views.ExpandableHeightGridView;

public class LikedPostsActivity extends BaseActivity {

	private PostsTypeListAdapter adapter;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_liked_posts);
		setTitle(R.string.likes);
		String userId = util.user.getComboUserID();
		
		ExpandableHeightGridView feedListView = (ExpandableHeightGridView) findViewById(R.id.feedsList);
		feedListView.setExpanded(true);
		adapter = new PostsTypeListAdapter(this, feedListView,this,-1);
		feedListView.setAdapter(adapter);
		feedListView.setVerticalScrollBarEnabled(false);
		
		model.getPostsByType(userId, 0, "GetLikedPosts", userPostsListiner);
	
	}
	private RequestListiner userPostsListiner = new RequestListiner() {

		@Override
		public void requestDone(Object result) {
			hideProgress();
			ArrayList<Post> posts = (ArrayList<Post>) result;
			if (posts.size() == 0) {
				// showView(findViewById(R.id.noData));
				return;
			}

			adapter.addPosts(posts);
			// hideView(findViewById(R.id.noData));
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


}
