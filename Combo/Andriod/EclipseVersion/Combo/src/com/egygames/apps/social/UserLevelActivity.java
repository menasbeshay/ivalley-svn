package com.egygames.apps.social;

import android.content.Intent;
import android.os.Bundle;
import android.widget.ImageView;
import android.widget.ListView;

import com.combomobile.R;
import com.egygames.apps.social.adapter.LevelsAdapter;
import com.egygames.apps.social.entity.User;
import com.nostra13.universalimageloader.core.ImageLoader;

public class UserLevelActivity extends BaseActivity {

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_user_level);
		User user = util.otherUser;
		setTitle(user.getUserName());
		
		displayProfileImage(R.id.profileImage, user.getProfilePic());
		setText(R.id.userUserName, user.getDisplayName());
		setText(R.id.rankingCount, "" + user.getUserRankID());
		int[] values = new int[7];
		Intent intent = getIntent();
		values[0] = intent.getIntExtra("FollowingCount", 0);
		values[01] = intent.getIntExtra("FollowersCount", 0);
		values[02] = intent.getIntExtra("PostsCount", 0);
		values[03] = intent.getIntExtra("ProfileLikerCount", 0);
		values[04] = intent.getIntExtra("CommentsCount", 0);
		values[05] = intent.getIntExtra("TotalActivityDays", 0);
		values[06] = 0;//  intent.getIntExtra("IsVierified", 0);

		int[] titles = new int[] { R.string.following, R.string.followers, R.string.postsCount, R.string.likesCount, R.string.commentsCount, R.string.dailyActivities,R.string.verifyAccount };

		ListView listView = (ListView) findViewById(R.id.levels);
		LevelsAdapter adapter = new LevelsAdapter(titles, values);
		listView.setAdapter(adapter);

	}

	private void displayProfileImage(int viewId, String path) {
		if ("".equals(path)) {
			((ImageView) findViewById(viewId)).setImageResource(R.drawable.profile);
			return;
		}
		ImageLoader.getInstance().displayImage("http://www.combomobile.com/comboapi/images.aspx?Image=" + path, ((ImageView) findViewById(viewId)));
	}
}