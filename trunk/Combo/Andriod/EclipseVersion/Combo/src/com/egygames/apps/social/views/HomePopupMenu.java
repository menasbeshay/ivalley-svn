package com.egygames.apps.social.views;

import android.app.Activity;
import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.PopupWindow;
import android.widget.PopupWindow.OnDismissListener;

import com.combomobile.R;

public class HomePopupMenu {

	private PopupWindow popup;
	private View anchor;

	// private Point p;

	public HomePopupMenu(Activity context, View anchor,boolean isProfile) {
		this.anchor = anchor;
		// this.p = p;
		// Inflate the popup_layout.xml
		LayoutInflater layoutInflater = (LayoutInflater) context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
		View layout = null;
		if(isProfile)
		{
			 layout = layoutInflater.inflate(R.layout.profile_popup_menu, null);
		}
		else
		{
			 layout = layoutInflater.inflate(R.layout.popup_menu, null);
		}
		

		// Creating the PopupWindow
		popup = new PopupWindow(context);
		popup.setContentView(layout);
		popup.setWidth(LinearLayout.LayoutParams.WRAP_CONTENT);
		popup.setHeight(LinearLayout.LayoutParams.WRAP_CONTENT);
		popup.setFocusable(true);

		// Some offset to align the popup a bit to the left, and a bit down,
		// relative to button's position.
		// p.x+= -20;
		// p.y+= 50;

		// // Clear the default translucent background
		popup.setBackgroundDrawable(context.getResources().getDrawable(R.drawable.popup_menubg));

		// Displaying the popup at the specified location, + offsets.
		popup.showAsDropDown(anchor);// AtLocation(layout, Gravity.NO_GRAVITY,
										// p.x , p.y );

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

	
}
