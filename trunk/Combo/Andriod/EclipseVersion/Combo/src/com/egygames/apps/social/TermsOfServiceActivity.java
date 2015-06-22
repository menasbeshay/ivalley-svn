package com.egygames.apps.social;

import com.combomobile.R;
import com.combomobile.R.layout;
import com.combomobile.R.string;

import android.app.Activity;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;

public class TermsOfServiceActivity extends BaseActivity {

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_help);
		setTitle(R.string.termsofService);
	}

}