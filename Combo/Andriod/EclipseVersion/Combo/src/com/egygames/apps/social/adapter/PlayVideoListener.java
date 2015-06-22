package com.egygames.apps.social.adapter;

import android.content.Context;
import android.media.MediaPlayer;
import android.media.MediaPlayer.OnCompletionListener;
import android.media.MediaPlayer.OnErrorListener;
import android.media.MediaPlayer.OnPreparedListener;
import android.net.Uri;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnTouchListener;
import android.widget.MediaController;

import com.combomobile.R;
import com.egygames.apps.social.views.VideoView;

public class PlayVideoListener implements OnClickListener, OnCompletionListener, OnPreparedListener, OnErrorListener {

	private Uri contentUri;
	private View parent;

	private Context context;
	private MediaController mediaController;

	public PlayVideoListener(Context context) {
		this.context = context;
	}

	@Override
	public void onClick(View view) {
		contentUri = Uri.parse((String) view.getTag());
		parent = (View) view.getParent();
		final VideoView video = (VideoView) parent.findViewById(R.id.videoView);
		video.setOnErrorListener(this);
		parent.findViewById(R.id.progress).setVisibility(View.VISIBLE);
		parent.findViewById(R.id.videoIcon).setVisibility(View.GONE);
		video.setVisibility(View.VISIBLE);
		video.requestFocus();
		video.stopPlayback();
		video.setOnCompletionListener(this);
		video.setOnPreparedListener(this);
		video.setKeepScreenOn(true);

		mediaController = new MediaController(context, false);
		mediaController.requestFocus();
		mediaController.setEnabled(true);
		mediaController.show(0);
		mediaController.setAnchorView(video);
		// mediaController.setn
		mediaController.setMediaPlayer(video);
		video.setMediaController(mediaController);
		video.setVideoURI(contentUri);

		// video.setMediaController(new MediaController(context));

		video.setOnTouchListener(new OnTouchListener() {
			long startTime;

			static final int MAX_DURATION = 100;

			@Override
			public boolean onTouch(View v, MotionEvent event) {
				if (event.getAction() == MotionEvent.ACTION_DOWN) {
					startTime = System.currentTimeMillis();
					Log.d("touch","down "+startTime);
				} else if (event.getAction() == MotionEvent.ACTION_UP) {
					Log.d("touch","up "+startTime);
					if (System.currentTimeMillis() - startTime <= MAX_DURATION) {
						if (mediaController.isShown())
							mediaController.hide();
						else
							mediaController.show();
						
						Log.d("touch","up "+(System.currentTimeMillis() - startTime ));
						return true;
					}
				}

				return true;
			}
		});

		// video.setZOrderOnTop(true);

		video.start();

		// surfaceView.setVisibility(View.VISIBLE);
		// surfaceView.getHolder().addCallback(this);
		// Log.d("combo", surfaceView.getHolder().getSurface().isValid() + "");
		// preparePlayer();
	}

	@Override
	public void onPrepared(MediaPlayer arg0) {
		parent.findViewById(R.id.progress).setVisibility(View.GONE);
		parent.findViewById(R.id.postImage).setVisibility(View.GONE);
		mediaController.show(0);

	}

	@Override
	public void onCompletion(MediaPlayer mp) {
		parent.findViewById(R.id.videoIcon).setVisibility(View.VISIBLE);
		

	}

	@Override
	public boolean onError(MediaPlayer mp, int what, int extra) {
		Log.d("Error", "" + extra);
		return false;
	}

}
