package com.egygames.apps.social.media;

import com.google.android.gms.internal.mp;

import android.annotation.SuppressLint;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.util.AttributeSet;
import android.view.View;

@SuppressLint("NewApi")
public class VisualizerView extends View {
	private byte[] mBytes;
	private float[] mPoints;
	private Rect mRect = new Rect();

	private Paint mForePaint = new Paint();

	public VisualizerView(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
		super(context, attrs, defStyleAttr, defStyleRes);
		init();
	}

	public VisualizerView(Context context, AttributeSet attrs, int defStyleAttr) {
		super(context, attrs, defStyleAttr);
		init();
	}

	public VisualizerView(Context context, AttributeSet attrs) {
		super(context, attrs);
		init();
	}

	private void init() {
		mBytes = null;
		mForePaint.setStrokeWidth(2f);
		mForePaint.setAntiAlias(true);
		mForePaint.setColor(0xff520a76);
	}

	public void updateVisualizer(byte[] bytes) {
		mBytes = bytes;
		invalidate();
	}

	@Override
	protected void onDraw(Canvas canvas) {
		super.onDraw(canvas);

		if (mBytes == null) {
			generateTempData();
			// return;
		}

		if (mPoints == null || mPoints.length < mBytes.length * 4) {
			mPoints = new float[mBytes.length * 4];
		}

		mRect.set(0, 0, getWidth(), getHeight());

		for (int i = 0; i < mBytes.length - 1; i++) {
			mPoints[i * 4] = mRect.width() * i / (mBytes.length - 1);
			mPoints[i * 4 + 1] = mRect.height() / 2 + ((byte) (mBytes[i] + 128)) * (mRect.height() / 2) / 128;
			mPoints[i * 4 + 2] = mRect.width() * (i + 1) / (mBytes.length - 1);
			mPoints[i * 4 + 3] = mRect.height() / 2 + ((byte) (mBytes[i + 1] + 128)) * (mRect.height() / 2) / 128;
		}

		canvas.drawLines(mPoints, mForePaint);
	
	}

	private void generateTempData() {
		mBytes = new byte[(int) (100 + (Math.random() * 100))];
		for (int i = 0; i < mBytes.length; i++) {
			mBytes[i] = (byte) (-128 + Math.random() * 255);
		}

	}

	private void drawDefaultAudio(Canvas canvas) {

	}
}