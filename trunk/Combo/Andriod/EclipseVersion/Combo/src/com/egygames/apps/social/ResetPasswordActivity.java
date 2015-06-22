
package com.egygames.apps.social;

import java.util.List;

import android.os.Bundle;
import android.text.InputType;
import android.view.View;
import android.widget.EditText;

import com.combomobile.R;
import com.combomobile.R.id;
import com.combomobile.R.layout;
import com.combomobile.R.string;
import com.egygames.apps.social.entity.User;
import com.egygames.apps.social.model.RequestListiner;
import com.mobsandgeeks.saripaar.ValidationError;
import com.mobsandgeeks.saripaar.Validator;
import com.mobsandgeeks.saripaar.Validator.ValidationListener;
import com.mobsandgeeks.saripaar.annotation.Password;

public class ResetPasswordActivity extends BaseActivity implements ValidationListener, RequestListiner {

	@Password(min = 6, scheme = Password.Scheme.ALPHA_NUMERIC, messageResId = R.string.passwordForamtError)
	protected EditText m4EditPassword;
	@Password(min = 6, scheme = Password.Scheme.ALPHA_NUMERIC, messageResId = R.string.passwordMatchError)
	protected EditText m5ConfirmEditPassword;

	private Validator validator;
	private String userId;
	private String password;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_reset_password);
		userId = getIntent().getStringExtra("id");
		m4EditPassword = (EditText) findViewById(R.id.etPassword);
		m5ConfirmEditPassword = (EditText) findViewById(R.id.etPasswordConfirm);
	
		validator = new Validator(this);
		validator.setValidationListener(this);
	}

	public void reset(View v) {
		password = m4EditPassword.getText().toString();
		validator.validate();

	}

	@Override
	public void onValidationFailed(List<ValidationError> errors) {
		if (errors.size() > 0) {
			showError(errors.get(0).getCollatedErrorMessage(this));
			((EditText) errors.get(0).getView()).setError(errors.get(0).getCollatedErrorMessage(this));
		}
	}

	@Override
	public void onValidationSucceeded() {
		if (m4EditPassword.getText().toString().equals(m5ConfirmEditPassword.getText().toString())) {
			User user = new User();
			user.setComboUserID(userId);
			user.setPassword(password);
			model.updateUser(user, this);
		} else
			m5ConfirmEditPassword.setError(getString(R.string.passwordMatchError));
	}

	@Override
	public void requestDone(Object result) {
		hideProgress();
		showError(R.string.passwordResetSuccess);
		finish();

	}

	@Override
	public void requestError(String result) {
		hideProgress();
		showError(result);
	}

	@Override
	public void requestError(int errorResource) {
		hideProgress();
		showError(errorResource);
	}

	private boolean passwordConfirmHidden;

	public void switchPasswordConfirm(View v) {

		if (passwordConfirmHidden) {
			m5ConfirmEditPassword.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_VARIATION_PASSWORD);
		} else {
			m5ConfirmEditPassword.setInputType(InputType.TYPE_CLASS_TEXT);
		}
		m5ConfirmEditPassword.setSelection(m5ConfirmEditPassword.getText().length());
		passwordConfirmHidden = !passwordConfirmHidden;

	}

	private boolean passwordHidden;

	public void switchPassword(View v) {

		if (passwordHidden) {
			m4EditPassword.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_VARIATION_PASSWORD);
		} else {
			m4EditPassword.setInputType(InputType.TYPE_CLASS_TEXT);
		}
		m4EditPassword.setSelection(m4EditPassword.getText().length());
		passwordHidden = !passwordHidden;

	}
}