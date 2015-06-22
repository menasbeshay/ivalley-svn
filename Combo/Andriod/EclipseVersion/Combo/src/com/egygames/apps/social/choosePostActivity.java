package com.egygames.apps.social;

import com.combomobile.R;
import com.egygames.apps.social.adapter.PostGridAdapter;

import android.app.Activity;
import android.content.Intent;
import android.graphics.drawable.ColorDrawable;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.GridView;
import android.widget.ImageView;

public class choosePostActivity extends Activity implements OnItemClickListener {
	GridView choosegrid;
	ImageView closeDialogAndPost;
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		// TODO Auto-generated method stub
		getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN,
	            WindowManager.LayoutParams.FLAG_FULLSCREEN);
		requestWindowFeature(Window.FEATURE_NO_TITLE);
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_choose_post);
	    getWindow().setLayout(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
	    getWindow().setBackgroundDrawable(new ColorDrawable(0xbbffffff));
		choosegrid=(GridView) findViewById(R.id.choosegrid);
		closeDialogAndPost=(ImageView) findViewById(R.id.closeDialogAndPost);
		closeDialogAndPost.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View v) {
				// TODO Auto-generated method stub
				finish();
			}
		});
		choosegrid.setAdapter(new PostGridAdapter(this));
		choosegrid.setOnItemClickListener(this);
	}
	@Override
	public void onItemClick(AdapterView<?> parent, View view, int position,
			long id) {
		// TODO Auto-generated method stub
		Intent i=new Intent(this, NewPost.class);
		i.putExtra("which", position);
		finish();
		startActivity(i);
	}

}
