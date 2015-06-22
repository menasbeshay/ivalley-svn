package com.egygames.apps.social;

import uk.co.senab.photoview.PhotoView;
import android.app.Activity;
import android.os.Bundle;
import android.widget.Toast;

import com.combomobile.R;
import com.combomobile.R.id;
import com.combomobile.R.layout;
import com.nostra13.universalimageloader.core.ImageLoader;
import com.nostra13.universalimageloader.core.ImageLoaderConfiguration;

public class ImageActivity extends Activity {

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_image);
		
        PhotoView photoView = (PhotoView) findViewById(R.id.photo);

        if (!ImageLoader.getInstance().isInited()) {
            ImageLoaderConfiguration config = new ImageLoaderConfiguration.Builder(getApplicationContext()).build();
            ImageLoader.getInstance().init(config);
        }
        ImageLoader.getInstance().displayImage(getIntent().getStringExtra("path"), photoView);

	}



}
