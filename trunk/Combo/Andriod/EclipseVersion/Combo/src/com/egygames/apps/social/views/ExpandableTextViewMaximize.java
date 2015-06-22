package com.egygames.apps.social.views;

import github.ankushsachdeva.emojicon.EmojiconTextView;
import android.content.Context;
import android.content.res.TypedArray;
import android.text.SpannableStringBuilder;
import android.util.AttributeSet;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.TextView.BufferType;

import com.combomobile.R;
/**
 * User: Bazlur Rahman Rokon
 * Date: 9/7/13 - 3:33 AM
 */
public class ExpandableTextViewMaximize extends EmojiconTextView {
	 private static final int DEFAULT_TRIM_LENGTH = 10000;
	    private static final String ELLIPSIS = "...[+]";

	    private CharSequence originalText;
	    private CharSequence trimmedText;
	    private BufferType bufferType;
	    private boolean trim = true;
	    private int trimLength;

	    public ExpandableTextViewMaximize(Context context) {
	        this(context, null);
	    }

	    public ExpandableTextViewMaximize(Context context, AttributeSet attrs) {
	        super(context, attrs);
	    }

	    private void setText() {
	        super.setText(getDisplayableText(), bufferType);
	    }

	    private CharSequence getDisplayableText() {
	        return trimmedText;
	    }

	    @Override
	    public void setText(CharSequence text, BufferType type) {
	    	originalText = text;
	    	originalText = getTrimmedText(text);    
	        bufferType = type;
	        setText();
	    }

	    private CharSequence getTrimmedText(CharSequence text) {
	            return new SpannableStringBuilder(originalText).append(ELLIPSIS);
	    }

	    public CharSequence getOriginalText() {
	        return originalText;
	    }

	    public int getTrimLength() {
	        return trimLength;
	    }
	}