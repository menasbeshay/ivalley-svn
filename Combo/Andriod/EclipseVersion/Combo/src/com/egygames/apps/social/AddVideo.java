package com.egygames.apps.social;

import java.io.File;

import org.ffmpeg.android.Clip;
import org.ffmpeg.android.FfmpegController;
import org.ffmpeg.android.ShellUtils.ShellCallback;

import android.app.AlertDialog;
import android.app.ProgressDialog;
import android.content.Intent;
import android.media.MediaPlayer;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.util.Log;
import android.view.View;
import android.widget.Toast;

import com.combomobile.R;
import com.kbeanie.imagechooser.api.ChooserType;
import com.kbeanie.imagechooser.api.ChosenVideo;
import com.kbeanie.imagechooser.api.VideoChooserListener;
import com.kbeanie.imagechooser.api.VideoChooserManager;

public class AddVideo extends BaseActivity implements VideoChooserListener {
	private VideoChooserManager videoChooserManager;
	private String filePath;
	private int chooserType;
	ProgressDialog dialog;
	private Handler handler;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_add_video);
		dialog = new ProgressDialog(this);
		dialog.setCancelable(false);
		dialog.setTitle(R.string.resizingVideo);
		 handler=new Handler();

	}

	public void captureVideo(View view) {
		chooserType = ChooserType.REQUEST_CAPTURE_VIDEO;
		videoChooserManager = new VideoChooserManager(this, ChooserType.REQUEST_CAPTURE_VIDEO, "myfolder", true);
		Bundle extras = new Bundle();
		// extras.putInt(MediaStore.EXTRA_VIDEO_QUALITY, 0);

		extras.putInt("android.intent.extra.durationLimit", 60);
		extras.putInt("android.intent.extras.CAMERA_FACING", 1);
		videoChooserManager.setExtras(extras);
		videoChooserManager.setVideoChooserListener(this);
		try {
			filePath = videoChooserManager.choose();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void reinitializeVideoChooser() {
		videoChooserManager = new VideoChooserManager(this, chooserType, "myfolder", true);
		Bundle extras = new Bundle();
		extras.putInt("android.intent.extra.durationLimit", 10);
		extras.putInt("android.intent.extra.sizeLimit", 5000000);
		extras.putInt("android.intent.extras.CAMERA_FACING", 1);
		videoChooserManager.setExtras(extras);
		videoChooserManager.setVideoChooserListener(this);
		videoChooserManager.reinitialize(filePath);
	}

	public void chooseVideo(View view) {
		chooserType = ChooserType.REQUEST_PICK_VIDEO;
		videoChooserManager = new VideoChooserManager(this, ChooserType.REQUEST_PICK_VIDEO, "myfolder", true);
		Bundle extras = new Bundle();
		extras.putInt("android.intent.extra.durationLimit", 10);
		extras.putInt("android.intent.extra.sizeLimit", 5000000);
		extras.putInt("android.intent.extras.CAMERA_FACING", 1);
		videoChooserManager.setExtras(extras);
		videoChooserManager.setVideoChooserListener(this);
		try {
			// pbar.setVisibility(View.VISIBLE);
			filePath = videoChooserManager.choose();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	protected void onActivityResult(int requestCode, int resultCode, Intent data) {
		if (resultCode == RESULT_OK) {
			if (videoChooserManager == null)
				reinitializeVideoChooser();

			videoChooserManager.submit(requestCode, data);
		}
	}

	@Override
	public void onVideoChosen(final ChosenVideo video) {
		if (video != null) {
			final MediaPlayer mediaplayer = MediaPlayer.create(AddVideo.this, Uri.fromFile(new File(video.getVideoFilePath())));
			int msec = mediaplayer.getDuration();
			if (msec > 60000) {
				new AlertDialog.Builder(AddVideo.this).setTitle(R.string.app_name).setMessage(R.string.videoLengthError).show();
				return;
			}
			handler.post(new Runnable() {
				
				@Override
				public void run() {
					dialog.show();
				}
			});
			new Thread(new Runnable() {

				@Override
				public void run() {
					try {
						final Clip clip_in = new Clip(video.getVideoFilePath());
						final String videoOut = File.createTempFile("record", ".mp4").getAbsolutePath();
						final Clip clip_out = new Clip(videoOut);
						clip_out.videoFps = "30";
						clip_out.width = 320;
						clip_out.height = mediaplayer.getVideoHeight() * clip_out.width / mediaplayer.getVideoWidth();
						clip_out.videoCodec = "libx264";
						clip_out.audioCodec = "copy";
						File fileTmp = AddVideo.this.getCacheDir();
						FfmpegController fc = new FfmpegController(AddVideo.this, fileTmp);

						fc.processVideo(clip_in, clip_out, false, new ShellCallback() {
							@Override
							public void shellOut(String shellLine) {
							Log.d("FFMPEG", "ffmpeg out: " + shellLine);
							}

							@Override
							public void processComplete(final int exitValue) {
								Log.d("FFMPEG", "ffmpeg out: " + exitValue);
								handler.post(new Runnable() {
									public void run() {
										dialog.dismiss();
										if (exitValue == 0) {
											util.setUploadVideoPath(videoOut);
											util.setVideoThumbPath(new File(video.getVideoPreviewImage()).toString());
											Intent returnIntent = new Intent();
											setResult(RESULT_OK, returnIntent);
											finish();
										}

									}
								});
							}
						});
					} catch (Exception e) {

					}

				}
			}).start();

		}

	}

	@Override
	public void onError(final String reason) {
		runOnUiThread(new Runnable() {

			@Override
			public void run() {

				Toast.makeText(AddVideo.this, reason, Toast.LENGTH_LONG).show();
			}
		});
	}
}
