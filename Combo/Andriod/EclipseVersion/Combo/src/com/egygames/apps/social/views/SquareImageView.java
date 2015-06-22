package com.egygames.apps.social.views;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.ImageView;

public class SquareImageView extends ImageView {

	public SquareImageView(Context context) {
		super(context);
	}

	public SquareImageView(Context context, AttributeSet attrs) {
		super(context, attrs);
	}

	public SquareImageView(Context context, AttributeSet attrs, int defStyle) {
		super(context, attrs, defStyle);
	}

	@Override
	protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
//		if (getDrawable() == null || getDrawable().getIntrinsicWidth() <= 0) {
//			setMeasuredDimension(widthMeasureSpec, heightMeasureSpec);
//			return;
//		}
//		int width = MeasureSpec.getSize(widthMeasureSpec);
//		int height = width * getDrawable().getIntrinsicHeight() / getDrawable().getIntrinsicWidth();
		setMeasuredDimension(widthMeasureSpec, widthMeasureSpec);

	}



}