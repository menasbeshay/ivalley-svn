package com.egygames.apps.social;

import java.io.File;

import android.app.AlertDialog;
import android.content.Intent;
import android.media.MediaPlayer;
import android.net.Uri;
import android.os.Bundle;
import android.view.View;

import com.combomobile.R;
import com.egygames.apps.social.views.util.IntentUtils;

public class AddAudio extends BaseActivity {
	private static final int AUDIO_REQ = 0;
	private static final int AUDIO_PICK = 1;

	// private ProgressBar pbar;

	private String filePath;

	private int chooserType;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_add_audio);
	}

	public void captureAudio(View view) {
		/*
		 * Intent intent = new
		 * Intent(MediaStore.Audio.Media.RECORD_SOUND_ACTION); Bundle extras =
		 * new Bundle(); extras.putInt("android.intent.extra.durationLimit",
		 * 60); intent.addCategory("android.intent.category.DEFAULT");
		 * 
		 * extras.putInt("android.intent.extras.CAMERA_FACING", 1);
		 * intent.putExtras(extras); startActivityForResult(intent, AUDIO_REQ);
		 */
		startActivityForResult(new Intent(this, AudioRecording.class), AUDIO_REQ);
	//	finish();
		// VoiceController.startRecording(this);

	}

	public void chooseAudio(View view) {
		Intent intent = IntentUtils.pickAudio();
		startActivityForResult(intent, AUDIO_PICK);
	}

	@Override
	public void onBackPressed() {
		Intent returnIntent = new Intent();
		setResult(RESULT_CANCELED, returnIntent);
		finish();

	}

	@Override
	protected void onActivityResult(int requestCode, int resultCode, Intent data) {
		if (resultCode == RESULT_OK) {
			if (data == null || data.getData() == null) {
				return;
			}

			switch (requestCode) {
			case AUDIO_REQ:
				break;
			case AUDIO_PICK:
				String audioFile = util.getRealPathFromURI(this, Uri.parse(data.getData().toString()));
				int msec = MediaPlayer.create(AddAudio.this, Uri.fromFile(new File(audioFile))).getDuration();
				if (msec > 60000) {
					new AlertDialog.Builder(AddAudio.this).setTitle(R.string.app_name).setMessage(R.string.videoLengthError).show();
					return;
				}
				util.setUploadAudioPath(audioFile);
				break;
			}
		}
		Intent returnIntent = new Intent();
		setResult(resultCode, returnIntent);
		finish();
	}
}
