package com.egygames.apps.social.views;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.PopupWindow;
import android.widget.PopupWindow.OnDismissListener;
import android.widget.RadioGroup;
import android.widget.RadioGroup.OnCheckedChangeListener;

import com.combomobile.R;
import com.egygames.apps.social.ProfileActivity;

public class ViewTypePopupMenu implements OnCheckedChangeListener {

	private PopupWindow popup;
	private View anchor;
	private ProfileActivity context;
	private RadioGroup layout;

	public ViewTypePopupMenu(ProfileActivity context, View anchor) {
		this.context = context;
		this.anchor = anchor;
		LayoutInflater layoutInflater = (LayoutInflater) context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
		layout = (RadioGroup) layoutInflater.inflate(R.layout.post_types, null);
		layout.setOnCheckedChangeListener(this);
		popup = new PopupWindow(context);
		popup.setContentView(layout);
		popup.setWidth(LinearLayout.LayoutParams.WRAP_CONTENT);
		popup.setHeight(LinearLayout.LayoutParams.WRAP_CONTENT);
		popup.setFocusable(true);
		popup.setBackgroundDrawable(context.getResources().getDrawable(R.drawable.strok_white_bg));
		popup.showAsDropDown(anchor);
	}

	public void setAnchor(View anchor) {
		this.anchor = anchor;
	}

	public void show() {
		popup.showAsDropDown(anchor);

	}

	public void setOnDismissListener(OnDismissListener onDismissListener) {
		popup.setOnDismissListener(onDismissListener);

	}

	public void dismiss() {
		popup.dismiss();
	}

	@Override
	public void onCheckedChanged(RadioGroup group, int id) {
		switch (id) {
		case R.id.all:
			context.displayAll();
			break;
		case R.id.photos:
			context.displayUserPhotos();
			break;
		case R.id.video:
			context.displayUserVideos();
			break;
		case R.id.audio:
			context.displayUserAudios();
			break;
		case R.id.text:
			context.displayUserText();
			break;

		default:
			break;
		}
	}

}
