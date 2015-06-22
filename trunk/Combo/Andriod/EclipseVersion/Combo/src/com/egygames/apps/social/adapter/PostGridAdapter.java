package com.egygames.apps.social.adapter;

import com.combomobile.R;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;

public class PostGridAdapter extends BaseAdapter {
int[] images={R.drawable.buttontext,R.drawable.buttonaudio,R.drawable.buttonphoto,R.drawable.buttonvideo};
String[] texts={"Text","Audio","Photo","Video"};
Context context;
public PostGridAdapter(Context context){
	this.context=context;
}
	@Override
	public int getCount() {
		// TODO Auto-generated method stub
		return images.length;
	}

	@Override
	public Object getItem(int position) {
		// TODO Auto-generated method stub
		return images[position];
	}

	@Override
	public long getItemId(int position) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public View getView(int position, View convertView, ViewGroup parent) {
		// TODO Auto-generated method stub
		LayoutInflater li=(LayoutInflater) context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
		View v=li.inflate(R.layout.post_grid_item, parent, false);
		ImageView image=(ImageView) v.findViewById(R.id.postimage);
		TextView text=(TextView) v.findViewById(R.id.posttext);
		image.setImageResource(images[position]);
		text.setText(texts[position]);
		return v;
	}

}
