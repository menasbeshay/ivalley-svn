package com.egygames.apps.social;

import android.content.Intent;
import android.os.Bundle;

import com.combomobile.R;
import com.egygames.apps.social.gcm.GCMUtil;
import com.nostra13.universalimageloader.core.ImageLoader;
import com.nostra13.universalimageloader.core.ImageLoaderConfiguration;

public class SplashActivity extends BaseActivity {

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_splash);
		ImageLoaderConfiguration config = new ImageLoaderConfiguration.Builder(getApplicationContext()).build();
		ImageLoader.getInstance().init(config);
		GCMUtil gcmUtil = new GCMUtil(this);
		gcmUtil.initGCM();

	}

	public void startNextActivity() {
		Intent intent;
		if (util.isLogedin())
			intent = new Intent(SplashActivity.this, ProfileActivity.class);
		else
			intent = new Intent(SplashActivity.this, LoginActivity.class);
		startActivity(intent);
		finish();
	}
}
