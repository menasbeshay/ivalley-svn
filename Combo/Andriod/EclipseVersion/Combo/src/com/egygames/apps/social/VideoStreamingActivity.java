package com.egygames.apps.social;

import android.content.Intent;
import android.graphics.Color;
import android.os.Bundle;
import android.support.v4.view.ViewPager;
import android.support.v4.view.ViewPager.OnPageChangeListener;
import android.view.View;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.SearchView;
import android.widget.SearchView.OnQueryTextListener;
import android.widget.TextView;

import com.combomobile.R;
import com.egygames.apps.social.adapter.AnimateFirstDisplayListener;
import com.egygames.apps.social.adapter.LevelsPagerAdapter;
import com.egygames.apps.social.adapter.PlayVideoListener;
import com.egygames.apps.social.adapter.PlayVideoStreamListener;
import com.egygames.apps.social.entity.Attachment;
import com.egygames.apps.social.views.util.Util;
import com.nostra13.universalimageloader.core.listener.ImageLoadingListener;
import com.viewpagerindicator.TabPageIndicator;

public class VideoStreamingActivity extends BaseActivity{
	private boolean isGrid=false;
	private SearchView searchView;
	private String userId;
	private ImageLoadingListener animateFirstListener = new AnimateFirstDisplayListener();
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_video_streaming);
		disableTab(R.id.explore);
		
		userId=util.user.getComboUserID();

		PlayVideoStreamListener playVideoListener = new PlayVideoStreamListener(this);
		ImageView videoIcon = (ImageView)findViewById(R.id.videoIcon);
		
		Attachment attachment=Util.getAttachment();
		
		videoIcon.setTag("http://www.combomobile.com"+ attachment.getPath());
		
		ImageView postImage = (ImageView)findViewById(R.id.postImage);
		postImage.setOnClickListener(null);
		
		displayImage(postImage, attachment.getThumbsPath());
		
		videoIcon.setVisibility(View.VISIBLE);
		
		videoIcon.setOnClickListener(playVideoListener);
		
		videoIcon.performClick();
		
	}
	private void displayImage(View view, String path) {
		view.setVisibility(View.VISIBLE);
		if ("".equals(path)) {
			((ImageView) view).setImageResource(R.drawable.default_post_pic);
			return;
		}
		util
				.loadImageByPath(
						"http://www.combomobile.com.stevenm3.arvixevps.com/comboapi/images.aspx?Image="
								+ path, ((ImageView) view),
						animateFirstListener);
	}
	@Override
	public void onBackPressed() {
		// TODO Auto-generated method stub
		finish();
		super.onBackPressed();
	}
	
	
}
