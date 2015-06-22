package com.egygames.apps.social;

import android.os.Bundle;

import com.combomobile.R;
import com.combomobile.R.layout;
import com.combomobile.R.string;

public class PrivacyPolicyActivity extends BaseActivity {

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_help);
		setTitle(R.string.privacyPolicy);
	}

}