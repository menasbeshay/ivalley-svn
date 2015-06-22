package com.egygames.apps.social;

import android.os.Bundle;
import android.view.View;
import android.widget.ImageView;

import com.combomobile.R;
import com.egygames.apps.social.entity.User;
import com.egygames.apps.social.model.RequestListiner;
import com.egygames.apps.social.views.util.Util;

public class UnFollowDialogActivity extends BaseActivity{

	private User user=null;
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_unfollow);

		user=Util.getSetCurrentUser();
		
		setText(R.id.tv_username, "Unfollow @" + user.getDisplayName()+"?");
		displayImage(R.id.profileImage, user.getProfilePic());
	}

	public void unFollow(View view) {
		 model.toggleFollowFriend(getIntent().getStringExtra("followerid"),getIntent().getStringExtra("userid"),
		 friendRequestListiner);
		 showProgress();
	}

	private void displayImage(int viewId, String path) {
		if ("".equals(path)) {
			((ImageView) findViewById(viewId)).setImageResource(R.drawable.profile);
			return;
		}
		util.loadImageByPath("http://www.combomobile.com/comboapi/images.aspx?Image=" + path, ((ImageView) findViewById(viewId)), null);

	}
	
	private RequestListiner friendRequestListiner = new RequestListiner() {

		public void requestDone(Object result) {
//			showError(R.string.friendRequestDone);
			finish();
			
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
	public void cancel(View view) {
		finish();
	}

	@Override
	public void onBackPressed() {
		finish();

	}
}
