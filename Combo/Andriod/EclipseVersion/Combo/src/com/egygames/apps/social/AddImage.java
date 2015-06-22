package com.egygames.apps.social;

import java.io.File;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.os.Environment;
import android.provider.MediaStore;
import android.view.View;
import android.widget.Toast;

import com.combomobile.R;
import com.kbeanie.imagechooser.api.ChosenImage;
import com.kbeanie.imagechooser.api.ImageChooserListener;
import com.kbeanie.imagechooser.api.ImageChooserManager;
import com.soundcloud.android.crop.Crop;

public class AddImage extends BaseActivity implements ImageChooserListener {
	private static final int FROM_GALLERY = 1;

	private static final int FROM_CAMERA = 0;

	private ImageChooserManager imageChooserManager;

	// private ProgressBar pbar;

	private String filePath;

	private int chooserType;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_add_image);
	}

	public void takeImage(View view) {
		// chooserType = ChooserType.REQUEST_CAPTURE_PICTURE;
		// imageChooserManager = new ImageChooserManager(this,
		// ChooserType.REQUEST_CAPTURE_PICTURE, "myfolder", true);
		// imageChooserManager.setImageChooserListener(this);
		// try {
		// filePath = imageChooserManager.choose();
		// } catch (IllegalArgumentException e) {
		// e.printStackTrace();
		// } catch (Exception e) {
		// e.printStackTrace();
		// }
		Intent takePicture = new Intent(MediaStore.ACTION_IMAGE_CAPTURE);
		File file = new File(Environment.getExternalStorageDirectory() + File.separator + "img.jpg");
		/* put uri as extra in intent object */
		takePicture.putExtra(MediaStore.EXTRA_OUTPUT, Uri.fromFile(file));

		startActivityForResult(takePicture, FROM_CAMERA);
	}

	private void reinitializeImageChooser() {
		imageChooserManager = new ImageChooserManager(this, chooserType, "myfolder", true);
		imageChooserManager.setImageChooserListener(this);
		imageChooserManager.reinitialize(filePath);
	}

	public void chooseImage(View view) {
		// chooserType = ChooserType.REQUEST_PICK_PICTURE;
		// imageChooserManager = new ImageChooserManager(this,
		// ChooserType.REQUEST_PICK_PICTURE, "myfolder", true);
		//
		// imageChooserManager.setImageChooserListener(this);
		// try {
		// // pbar.setVisibility(View.VISIBLE);
		// filePath = imageChooserManager.choose();
		// } catch (IllegalArgumentException e) {
		// e.printStackTrace();
		// } catch (Exception e) {
		// e.printStackTrace();
		// }
		//
		Intent pickPhoto = new Intent(Intent.ACTION_PICK, android.provider.MediaStore.Images.Media.EXTERNAL_CONTENT_URI);
		File file = new File(Environment.getExternalStorageDirectory() + File.separator + "img.jpg");
		/* put uri as extra in intent object */
		pickPhoto.putExtra(MediaStore.EXTRA_OUTPUT, Uri.fromFile(file));

		startActivityForResult(pickPhoto, FROM_GALLERY);

	}

	// @Override
	// protected void onActivityResult(int requestCode, int resultCode, Intent
	// data) {
	// if ((requestCode == 291 || requestCode == Crop.REQUEST_CROP) &&
	// resultCode == RESULT_OK) {
	// util.setUploadImagePath(util.getRealPathFromURI(this, data.getData()));
	// util.setImageThumbPath(util.getRealPathFromURI(this, data.getData()));
	// Intent returnIntent = new Intent();
	// setResult(RESULT_OK, returnIntent);
	// finish();
	// }
	// if (resultCode == RESULT_OK) {
	// if (imageChooserManager == null)
	// reinitializeImageChooser();
	// imageChooserManager.submit(requestCode, data);
	// }
	//
	// }

	@Override
	public void onActivityResult(int requestCode, int resultCode, Intent data) {
		if (resultCode != RESULT_OK)
			return;
		switch (requestCode) {
		case FROM_GALLERY: {
			Uri selectedImage = data.getData();
			Uri outputUri = Uri.fromFile(new File(getCacheDir(), "cropped"));
			new Crop(selectedImage).output(outputUri).withMaxSize(800, 800).withAspect(1, 1).start(AddImage.this);
		}
			break;

		case FROM_CAMERA: {
			File file = new File(Environment.getExternalStorageDirectory() + File.separator + "img.jpg");
			Uri uri1 = Uri.fromFile(file);
			Uri outputUri = Uri.fromFile(new File(getCacheDir(), "cropped"));
			new Crop(uri1).output(outputUri).withMaxSize(800, 800).withAspect(1, 1).start(AddImage.this);
			break;
		}
		case Crop.REQUEST_CROP:

			util.setUploadImagePath(new File(getCacheDir(), "cropped").getAbsolutePath());
			util.setImageThumbPath(new File(getCacheDir(), "cropped").getAbsolutePath());
			Intent returnIntent = new Intent();
			setResult(RESULT_OK, returnIntent);
			finish();
			break;
		}
	}

	@Override
	public void onImageChosen(final ChosenImage image) {
		runOnUiThread(new Runnable() {

			@Override
			public void run() {
				// pbar.setVisibility(View.GONE);
				if (image != null) {

					File file = new File(image.getFilePathOriginal());
					Uri uri1 = Uri.fromFile(file);

					new Crop(uri1).withMaxSize(800, 800).withAspect(1, 1).start(AddImage.this);
					// util.setUploadImagePath(image.getFilePathOriginal());
					// util.setImageThumbPath(new
					// File(image.getFileThumbnail()).toString());
					// Intent returnIntent = new Intent();
					// setResult(RESULT_OK, returnIntent);
					// finish();
				}
			}
		});
	}

	@Override
	public void onError(final String reason) {
		runOnUiThread(new Runnable() {

			@Override
			public void run() {
				// pbar.setVisibility(View.GONE);
				Toast.makeText(AddImage.this, reason, Toast.LENGTH_LONG).show();
			}
		});
	}
}
