package com.egygames.apps.social;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;

import nl.changer.audiowife.AudioWife;
import android.content.Context;
import android.content.Intent;
import android.media.MediaPlayer;
import android.media.MediaRecorder;
import android.net.Uri;
import android.os.Bundle;
import android.os.Environment;
import android.os.SystemClock;
import android.view.View;
import android.widget.Button;
import android.widget.Chronometer;
import android.widget.LinearLayout;
import android.widget.SeekBar;
import android.widget.TextView;
import android.widget.Toast;

import com.combomobile.R;

public class AudioRecording extends BaseActivity {
	protected Uri mUri;
	private String filePath;
	private Button recordingButton;
	private MediaPlayer mediaPlayer;
	private   MediaRecorder  audioRecorder;
	   
	private boolean isRecording = false;
	private Context mContext;

	private View mPlayMedia;
	private View mPauseMedia;
	private SeekBar mMediaSeekBar;
	private TextView mRunTime;
	private TextView mTotalTime;
	private LinearLayout playLinear;
	private Button doneButton;
//	private String filePath2;
	private String basePath;
	private Chronometer myChronometer;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_audio_record);
		basePath = Environment.getExternalStorageDirectory().getPath();
		playLinear = (LinearLayout) findViewById(R.id.linear_play);
		mediaPlayer = new MediaPlayer();
		recordingButton = (Button) findViewById(R.id.startRecording);
		doneButton = (Button) findViewById(R.id.done);
		mContext = this;
		// initialize the player controls
		mPlayMedia = findViewById(R.id.play);
		mPauseMedia = findViewById(R.id.pause);
		mMediaSeekBar = (SeekBar) findViewById(R.id.media_seekbar);
		mRunTime = (TextView) findViewById(R.id.run_time);
		mTotalTime = (TextView) findViewById(R.id.total_time);
		myChronometer = (Chronometer) findViewById(R.id.chronometer);
		mPlayMedia.setOnClickListener(new View.OnClickListener() {

			@Override
			public void onClick(View v) {

				if (mUri == null)
					Toast.makeText(mContext, "Record your audio before playing", Toast.LENGTH_LONG).show();
			}
		});
		playLinear.setEnabled(false);

	}

	public void doneAction(View view) {
		if (mediaPlayer != null && mediaPlayer.isPlaying())
			mediaPlayer.stop();
		Intent returnIntent = new Intent();
		returnIntent.setData(Uri.parse(basePath + "/Combo/" + filePath));
		setResult(RESULT_OK, returnIntent);
		finish();
	}

	public void startRecording(View view) throws Exception {

		if (isRecording) {
			mPauseMedia.setEnabled(true);
			mPlayMedia.setEnabled(true);
			mMediaSeekBar.setEnabled(true);
			recordingButton.setText(getResources().getString(R.string.startAudio));
			isRecording = false;
			audioRecorder.stop();
			myChronometer.stop();
			//myChronometer.setBase(SystemClock.elapsedRealtime());
			try {
				MediaPlayer med = new MediaPlayer();
				med.setDataSource(basePath + "/Combo/" + filePath);
				med.prepare();
				int seconds = (Integer) med.getDuration() / 1000;
				if (seconds > 60) {
					doneButton.setEnabled(false);
					Toast.makeText(getApplicationContext(), "Track must be less than one minute", Toast.LENGTH_LONG).show();
				} else {
					doneButton.setEnabled(true);
//					File fileTmp = this.getCacheDir();
//					FfmpegController controller = new FfmpegController(this, fileTmp);
//					Clip mediaIn = new Clip(basePath + "/Combo/" + filePath);
////					Clip mediaOut = new Clip(basePath + "/Combo/" + filePath2);
//
//					controller.convert(mediaIn, basePath + "/Combo/" + filePath2, new ShellCallback() {
//
//						@Override
//						public void shellOut(String shellLine) {
//							Log.d("shell", shellLine);
//						}
//
//						@Override
//						public void processComplete(int exitValue) {
//						}
//					});

					util.setUploadAudioPath(basePath + "/Combo/" + filePath);
					mUri = Uri.parse(basePath + "/Combo/" + filePath);

					// AudioWife takes care of click
					// handler for play/pause button
					AudioWife.getInstance().init(mContext, basePath + "/Combo/" + filePath).setPlayView(mPlayMedia).setPauseView(mPauseMedia).setSeekBar(mMediaSeekBar).setRuntimeView(mRunTime).setTotalTimeView(mTotalTime);

					AudioWife.getInstance().addOnCompletionListener(new MediaPlayer.OnCompletionListener() {

						@Override
						public void onCompletion(MediaPlayer mp) {
							// Toast.makeText(getBaseContext(), "Completed",
							// Toast.LENGTH_SHORT).show();
							// do you stuff.
							recordingButton.setEnabled(true);
						}
					});

					AudioWife.getInstance().addOnPlayClickListener(new View.OnClickListener() {

						@Override
						public void onClick(View v) {
							recordingButton.setEnabled(false);
							// Toast.makeText(getBaseContext(), "Play",
							// Toast.LENGTH_SHORT).show();
							// get-set-go. Lets dance.
						}
					});

					AudioWife.getInstance().addOnPauseClickListener(new View.OnClickListener() {

						@Override
						public void onClick(View v) {
							// Toast.makeText(getBaseContext(), "Pause",
							// Toast.LENGTH_SHORT).show();
							// Your on audio pause stuff.
							recordingButton.setEnabled(true);
						}
					});
				}
			} catch (IOException e) {
				e.printStackTrace();
			}

		} else {
			// playPauseButton.setEnabled(false);
			isRecording = true;
			// isRecordedBefore=true;
			recordingButton.setText(getResources().getString(R.string.pauseAudio));
			File folder = new File(basePath + "/Combo/");
			if (!folder.exists()) {
				folder.mkdir();
			}
			audioRecorder = new MediaRecorder();
			Calendar nowCalendar = Calendar.getInstance();
			filePath = nowCalendar.getTimeInMillis() + ".wav";
//			filePath2 = nowCalendar.getTimeInMillis() + ".3gp";
			
			audioRecorder.setAudioSource(MediaRecorder.AudioSource.MIC);
			audioRecorder.setOutputFormat(MediaRecorder.OutputFormat.MPEG_4);
			audioRecorder.setAudioEncoder(MediaRecorder.AudioEncoder.DEFAULT);
			audioRecorder.setOutputFile(basePath + "/Combo/"+filePath);
			 

			audioRecorder.prepare();
			audioRecorder.start();
			myChronometer.setBase(SystemClock.elapsedRealtime());
			myChronometer.start();
			myChronometer.setVisibility(View.VISIBLE);
			mPauseMedia.setEnabled(false);
			mPlayMedia.setEnabled(false);
			mMediaSeekBar.setEnabled(false);
		}

	}

	@Override
	protected void onPause() {
		// TODO Auto-generated method stub
		if (mediaPlayer != null && mediaPlayer.isPlaying())
			mediaPlayer.stop();

		if (isRecording)
			audioRecorder.stop();

		// when done playing, release the resources
		AudioWife.getInstance().release();
		mUri = null;

		finish();
		super.onPause();
	}

	@Override
	public void onBackPressed() {
		// Intent returnIntent = new Intent();
		// setResult(RESULT_CANCELED, returnIntent);
		if (mediaPlayer != null && mediaPlayer.isPlaying())
			mediaPlayer.stop();

		if (isRecording)
			audioRecorder.stop();
		finish();

	}
}
