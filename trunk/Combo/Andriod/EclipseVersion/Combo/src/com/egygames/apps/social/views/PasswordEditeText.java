package com.egygames.apps.social.views;

import android.content.Context;
import android.text.Editable;
import android.text.InputType;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.EditText;
import android.widget.RelativeLayout;

import com.combomobile.R;

public class PasswordEditeText extends RelativeLayout implements OnClickListener {

	private EditText password;
	private boolean passwordHidden;

	public PasswordEditeText(Context context, AttributeSet attrs, int defStyleAttr) {
		super(context, attrs, defStyleAttr);
		init();
	}

	public PasswordEditeText(Context context, AttributeSet attrs) {
		super(context, attrs);
		init();
	}

	public PasswordEditeText(Context context) {
		super(context);
		init();
	}

	private void init() {

		LayoutInflater layoutInflater = LayoutInflater.from(getContext());
		layoutInflater.inflate(R.layout.password_edittext, this, true);
		password = (EditText) findViewById(R.id.etPassword);
		findViewById(R.id.switchView).setOnClickListener(this);
		passwordHidden = true;
	}

	@Override
	public void onClick(View arg0) {
		if (passwordHidden) {
			password.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_VARIATION_PASSWORD);
		} else {
			password.setInputType(InputType.TYPE_CLASS_TEXT );
		}
		password.setSelection(password.getText().length());
		passwordHidden = !passwordHidden;
	}
	
	public Editable getText()
	{
		return password.getText(); 
	}
}
