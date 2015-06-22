package com.egygames.apps.social.media;

import java.io.IOException;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Rect;
import android.media.AudioManager;
import android.media.MediaPlayer;
import android.media.audiofx.Visualizer;
import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.combomobile.R;
import com.egygames.apps.social.BaseActivity;

public class AudioFxDemoActivity extends BaseActivity {

	// Here is your URL defined
	String url = "http://vprbbc.streamguys.net/vprbbc24.mp3";

	// Constants for vizualizator - HEIGHT 50dip
	private static final float VISUALIZER_HEIGHT_DIP = 150f;

	// Your MediaPlayer
	MediaPlayer mp;

	private LinearLayout mLinearLayout;
	// Vizualization
	private Visualizer mVisualizer;

	private VisualizerView mVisualizerView;

	/** Called when the activity is first created. */
	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_audio);
		hideProgress();

		setTitle(R.string.audio);
		mLinearLayout = (LinearLayout) findViewById(R.id.audioView);
		mp = new MediaPlayer();
		mp.setAudioStreamType(AudioManager.STREAM_MUSIC);

		try {
			mp.setDataSource(url); // set data source our URL defined
		} catch (IllegalArgumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		try { // tell your player to go to prepare state
			mp.prepare();
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// Start your stream / player
		mp.start();

		// setup your Vizualizer - call method
		setupVisualizerFxAndUI();

		// enable vizualizer
		mVisualizer.setEnabled(true);
	}

	// Our method that sets Vizualizer
	private void setupVisualizerFxAndUI() {
		// Create a VisualizerView (defined below), which will render the
		// simplified audio
		// wave form to a Canvas.

		// You need to have something where to show Audio WAVE - in this case
		// Canvas
		mVisualizerView = (VisualizerView) findViewById(R.id.visualizerView);// new
																				// VisualizerView(this);

		// Create the Visualizer object and attach it to our media player.
		// YOU NEED android.permission.RECORD_AUDIO for that in
		// AndroidManifest.xml
		mVisualizer = new Visualizer(mp.getAudioSessionId());
		mVisualizer.setCaptureSize(Visualizer.getCaptureSizeRange()[1]);
		mVisualizer.setDataCaptureListener(new Visualizer.OnDataCaptureListener() {
			public void onWaveFormDataCapture(Visualizer visualizer, byte[] bytes, int samplingRate) {
				mVisualizerView.updateVisualizer(bytes);
			}

			public void onFftDataCapture(Visualizer visualizer, byte[] bytes, int samplingRate) {
			}
		}, Visualizer.getMaxCaptureRate() / 2, true, false);
	}

	@Override
	protected void onPause() {
		super.onPause();

		if (isFinishing() && mp != null) {
			mVisualizer.release();
			// mEqualizer.release();
			mp.release();
			mp = null;
		}
	}

	/**
	 * A simple class that draws waveform data received from a
	 * {@link Visualizer.OnDataCaptureListener#onWaveFormDataCapture }
	 */

}