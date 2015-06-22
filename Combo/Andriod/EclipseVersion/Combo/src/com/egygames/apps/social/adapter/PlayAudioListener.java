package com.egygames.apps.social.adapter;

import java.io.IOException;

import android.media.AudioManager;
import android.media.MediaPlayer;
import android.media.MediaPlayer.OnPreparedListener;
import android.media.audiofx.Visualizer;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.MediaController;
import android.widget.MediaController.MediaPlayerControl;

import com.combomobile.R;
import com.egygames.apps.social.media.VisualizerView;

public class PlayAudioListener implements OnClickListener {

	private MediaPlayer mp;
	private Visualizer mVisualizer;
	private String oldUrl;
	private View parent;
	private View progress;
	private MediaController mediaController;

	public PlayAudioListener() {
		mp = new MediaPlayer();
		mp.setAudioStreamType(AudioManager.STREAM_MUSIC);
		mVisualizer = new Visualizer(mp.getAudioSessionId());
		mVisualizer.setCaptureSize(Visualizer.getCaptureSizeRange()[1]);
		oldUrl = "";

	}

	@Override
	public void onClick(View view) {
		if (mp.isPlaying()) {
			mp.stop();
			if (oldUrl.equalsIgnoreCase((String) view.getTag()))
				return;
		}
		parent = (View) view.getParent();
		mediaController = new MediaController(view.getContext(),false);
		mediaController.requestFocus();
		mediaController.setEnabled(true);
		
		mediaController.setAnchorView(view);
		mediaController.setMediaPlayer(new MediaPlayerControl() {
			
			@Override
			public void start() {
				mp.start();
				
			}
			
			@Override
			public void seekTo(int pos) {
				mp.seekTo(pos);
				
			}
			
			@Override
			public void pause() {
				mp.pause();
				
			}
			
			@Override
			public boolean isPlaying() {
				// TODO Auto-generated method stub
				return mp.isPlaying();
			}
			
			@Override
			public int getDuration() {
				// TODO Auto-generated method stub
				return mp.getDuration();
			}
			
			@Override
			public int getCurrentPosition() {
				// TODO Auto-generated method stub
				return mp.getCurrentPosition();
			}
			
			@Override
			public int getBufferPercentage() {
				// TODO Auto-generated method stub
				return 0;
			}
			
			@Override
			public int getAudioSessionId() {
				// TODO Auto-generated method stub
				return mp.getAudioSessionId();
			}
			
			@Override
			public boolean canSeekForward() {
				// TODO Auto-generated method stub
				return false;
			}
			
			@Override
			public boolean canSeekBackward() {
				// TODO Auto-generated method stub
				return false;
			}
			
			@Override
			public boolean canPause() {
				// TODO Auto-generated method stub
				return true;
			}
		});
		
		progress = parent.findViewById(R.id.progress);
		//progress.setVisibility(View.VISIBLE);

		try {
			
			mp.reset();
			mp.setDataSource((String) view.getTag());
			mp.prepareAsync();
			mp.setOnPreparedListener(new OnPreparedListener() {
				@Override
				public void onPrepared(MediaPlayer mp) {
					//progress.setVisibility(View.GONE);
					mediaController.show(0);
					mp.start();
				}
			});
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		final VisualizerView mVisualizerView = (VisualizerView) view;
		mVisualizer.setDataCaptureListener(new Visualizer.OnDataCaptureListener() {
			public void onWaveFormDataCapture(Visualizer visualizer, byte[] bytes, int samplingRate) {
				mVisualizerView.updateVisualizer(bytes);
			}

			public void onFftDataCapture(Visualizer visualizer, byte[] bytes, int samplingRate) {
			}
		}, Visualizer.getMaxCaptureRate() / 2, true, false);
		mVisualizer.setEnabled(true);
		oldUrl = (String) view.getTag();
	}

}
