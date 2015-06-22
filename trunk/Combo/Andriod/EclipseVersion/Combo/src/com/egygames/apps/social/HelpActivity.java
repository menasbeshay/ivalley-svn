package com.egygames.apps.social;

import android.os.Bundle;

import com.combomobile.R;

public class HelpActivity extends BaseActivity {

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_help);
		setTitle(R.string.help);
	}
}