package com.egygames.apps.social.views;

import github.ankushsachdeva.emojicon.EmojiconTextView;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Color;
import android.text.Spannable;
import android.text.SpannableString;
import android.text.SpannableStringBuilder;
import android.text.style.ForegroundColorSpan;
import android.util.AttributeSet;
import android.view.View;

import com.combomobile.R;
/**
 * User: Bazlur Rahman Rokon
 * Date: 9/7/13 - 3:33 AM
 */
public class ExpandableTextView extends EmojiconTextView {
    private static final int DEFAULT_TRIM_LENGTH = 80;
    private static final String ELLIPSIS = "...[+]";

    private CharSequence originalText;
    private CharSequence trimmedText;
    private BufferType bufferType;
    private boolean trim = true;
    private int trimLength;

    public ExpandableTextView(Context context) {
        this(context, null);
    }

    public ExpandableTextView(Context context, AttributeSet attrs) {
        super(context, attrs);

        TypedArray typedArray = context.obtainStyledAttributes(attrs, R.styleable.ExpandableTextView);
        this.trimLength = typedArray.getInt(R.styleable.ExpandableTextView_trimLength, DEFAULT_TRIM_LENGTH);
        typedArray.recycle();

        setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View v) {
                trim = !trim;
                setText();
                invalidate();
//                requestFocusFromTouch();
            }
        });
    }

    private void setText() {
        super.setText(getDisplayableText(), bufferType);
    }

    private CharSequence getDisplayableText() {
        return trim ? trimmedText : originalText;
    }

    @Override
    public void setText(CharSequence text, BufferType type) {
    	originalText = text;
        trimmedText = getTrimmedText(text);    
        bufferType = type;
        setText();
    }

    private CharSequence getTrimmedText(CharSequence text) {
        if (originalText != null && originalText.length() > trimLength) {
        	SpannableStringBuilder hashtagintitle = new SpannableStringBuilder(originalText, 0, trimLength + 1).append(ELLIPSIS);
        	hashtagintitle.setSpan(new ForegroundColorSpan(Color.BLUE), trimLength+1, trimLength+1+6, Spannable.SPAN_EXCLUSIVE_EXCLUSIVE);
            return hashtagintitle;
        } else {
            return originalText;
        }
    }

    public CharSequence getOriginalText() {
        return originalText;
    }

    public void setTrimLength(int trimLength) {
        this.trimLength = trimLength;
        trimmedText = getTrimmedText(originalText);
        setText();
    }

    public int getTrimLength() {
        return trimLength;
    }
}