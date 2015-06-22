package com.egygames.apps.social;

import java.util.List;

import android.content.Intent;
import android.os.Bundle;
import android.text.InputType;
import android.view.KeyEvent;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.TextView.OnEditorActionListener;

import com.combomobile.R;
import com.egygames.apps.social.entity.User;
import com.egygames.apps.social.model.RequestListiner;
import com.egygames.apps.social.views.util.Util;
import com.mobsandgeeks.saripaar.ValidationError;
import com.mobsandgeeks.saripaar.Validator;
import com.mobsandgeeks.saripaar.Validator.ValidationListener;
import com.mobsandgeeks.saripaar.annotation.NotEmpty;

public class LoginActivity extends BaseActivity implements RequestListiner, OnEditorActionListener, ValidationListener {

	@NotEmpty(messageResId = R.string.emailError)
	private TextView m1UserNameEmail;
	@NotEmpty(messageResId = R.string.passwordError)
	private EditText m2Password;
	private View progress;
	private boolean isLoginigIn;
	private Validator validator;

	@Override
	protected void onCreate(Bundle savedInstanceState) {

		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_login);
		m1UserNameEmail = (TextView) findViewById(R.id.email);
		m2Password = (EditText) findViewById(R.id.password);
		m2Password.setOnEditorActionListener(this);
		progress = findViewById(R.id.login_progress);
		validator = new Validator(this);
		validator.setValidationListener(this);

	}

	public void forgtPassowrd(View v) {
		startActivity(new Intent(this, ForgotPasswordActivity.class));
	}

	public void notAmember(View v) {
		startActivity(new Intent(this, RegestrationActivity.class));
	}

	public void login(View v) {
		if (isLoginigIn)
			return;
			validator.validate();
	}

	@Override
	public void requestDone(Object result) {
		isLoginigIn = false;
		List<User> list = (List<User>) result;
		util.saveUser(list.get(0));
		util.setLogedin(true);
		util.setUserId(Util.instance.user.getComboUserID());
		finish();
		startActivity(new Intent(this, ProfileActivity.class));

	}

	@Override
	public void requestError(String result) {
		isLoginigIn = false;
		hideView(progress);
		showError(result);
		m1UserNameEmail.setEnabled(true);
		m2Password.setEnabled(true);
	}

	@Override
	public void requestError(int errorResource) {
		isLoginigIn = false;
		hideView(progress);
		showError(errorResource);
		m1UserNameEmail.setEnabled(true);
		m2Password.setEnabled(true);
	}

	@Override
	public boolean onEditorAction(TextView v, int actionId, KeyEvent arg2) {
		login(v);
		return false;
	}

	@Override
	public void onValidationSucceeded() {
		isLoginigIn = true;
		showView(progress);
		model.login(m1UserNameEmail.getText().toString(), m2Password.getText().toString(), this);
//		model.getUserFullProfile("23", "23", this);
		m1UserNameEmail.setEnabled(false);
		m2Password.setEnabled(false);
	}

	@Override
	public void onValidationFailed(List<ValidationError> errors) {
		if (errors.size() > 0) {
			showError(errors.get(0).getCollatedErrorMessage(this));
			((EditText) errors.get(0).getView()).setError(errors.get(0).getCollatedErrorMessage(this));
		}
	}

	
	

	private boolean passwordHidden;

	public void switchPassword(View v) {

		if (passwordHidden) {
			m2Password.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_VARIATION_PASSWORD);
		} else {
			m2Password.setInputType(InputType.TYPE_CLASS_TEXT);
		}
		m2Password.setSelection(m2Password.getText().length());
		passwordHidden = !passwordHidden;

	}
}
