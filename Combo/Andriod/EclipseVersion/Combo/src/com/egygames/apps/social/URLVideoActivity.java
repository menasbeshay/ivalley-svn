package com.egygames.apps.social;

import android.app.Activity;
import android.content.Intent;
import android.media.MediaPlayer;
import android.media.MediaPlayer.OnCompletionListener;
import android.media.MediaPlayer.OnPreparedListener;
import android.net.Uri;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.Window;
import android.widget.VideoView;

import com.combomobile.R;

/**
 * Play Video from URL
 * 
 * @see ITCuties
 */
public class URLVideoActivity extends BaseActivity implements OnCompletionListener, OnPreparedListener, OnClickListener {

	private VideoView video;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);

		requestWindowFeature(Window.FEATURE_NO_TITLE);
		setContentView(R.layout.url_activity_video);

		video = (VideoView) findViewById(R.id.videoView);
		Intent intent = getIntent();
		Uri contentUri = intent.getData();
		video.requestFocus();
		video.setVideoPath(contentUri.toString());
		video.setOnCompletionListener(this);
		video.setOnPreparedListener(this);
		video.setOnClickListener(this);

		showProgress();
		video.start();

	}

	@Override
	public void onPrepared(MediaPlayer arg0) {
		hideProgress();
	}

	@Override
	public void onCompletion(MediaPlayer arg0) {
		finish();
	}

	@Override
	protected void onPause() {
		video.pause();
		super.onPause();
	}

	@Override
	protected void onResume() {
		try {
			video.start();
		} catch (Exception ex) {
		}
		super.onResume();
	}

	@Override
	public void onClick(View arg0) {
		if (video.isPlaying())
			video.stopPlayback();
		else {
			video.start();
		}
	}
}
