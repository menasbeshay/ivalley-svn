package com.egygames.apps.social.views;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.LinearLayout;

public class SquareLinearView extends LinearLayout {

	// Array of max cell heights for each row
	private static int[] mMaxRowHeight;

	// The number of columns in the grid view
	private static int mNumColumns;

	// The position of the view cell
	private int mPosition;

	// Public constructor
	public SquareLinearView(Context context) {
		super(context);
	}

	// Public constructor
	public SquareLinearView(Context context, AttributeSet attrs) {
		super(context, attrs);
	}

	/**
	 * Set the position of the view cell
	 * 
	 * @param position
	 */
	public void setPosition(int position) {
		mPosition = position;
	}

	/**
	 * Set the number of columns and item count in order to accurately store the
	 * max height for each row. This must be called whenever there is a change
	 * to the layout or content data.
	 * 
	 * @param numColumns
	 * @param itemCount
	 */
	public static void initItemLayout(int numColumns, int itemCount) {
		mNumColumns = numColumns;
		mMaxRowHeight = new int[itemCount];
	}

	@Override
	protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
		super.onMeasure(widthMeasureSpec, heightMeasureSpec);
//		// Do not calculate max height if column count is only one
//		if (mNumColumns <= 1 || mMaxRowHeight == null) {
//			return;
//		}
//
//		// Get the current view cell index for the grid row
//		int rowIndex = mPosition / mNumColumns;
//		// Get the measured height for this layout
//		int measuredHeight = getMeasuredHeight();
//		// If the current height is larger than previous measurements, update
//		// the array
//		if (measuredHeight > mMaxRowHeight[rowIndex]) {
//			mMaxRowHeight[rowIndex] = measuredHeight;
//		}
		setMeasuredDimension(getMeasuredWidth(),getMeasuredWidth());// mMaxRowHeight[rowIndex]);
	}

}