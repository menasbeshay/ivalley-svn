package com.egygames.apps.social;

import java.util.List;

import android.graphics.Color;
import android.os.Bundle;
import android.text.InputType;
import android.view.View;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemSelectedListener;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.TextView;

import com.combomobile.R;
import com.egygames.apps.social.model.RequestListiner;
import com.mobsandgeeks.saripaar.ValidationError;
import com.mobsandgeeks.saripaar.Validator;
import com.mobsandgeeks.saripaar.Validator.ValidationListener;
import com.mobsandgeeks.saripaar.annotation.Email;
import com.mobsandgeeks.saripaar.annotation.NotEmpty;
import com.mobsandgeeks.saripaar.annotation.Password;
import com.mobsandgeeks.saripaar.annotation.Size;

public class RegestrationActivity extends BaseActivity implements RequestListiner, ValidationListener, OnItemSelectedListener {

	@NotEmpty(messageResId = R.string.fieldsNotFilledError)
	@Size(min = 4, max = 22, messageResId = R.string.fieldsNotLessThan4Char)
	protected EditText m1EditUserName;
	@NotEmpty(messageResId = R.string.fieldsNotFilledError)
	@Size(max = 22, messageResId = R.string.fieldsNotLessThan4Char)
	protected EditText m2EditDisplayName;
	@Email(messageResId = R.string.emailForamtError)
	protected EditText m3EditEmailAddress;

	@NotEmpty(messageResId = R.string.fieldsNotFilledError)
	@Size(min = 4, max = 11, messageResId = R.string.fieldsNotLessThan4Char2)
	protected EditText m4EditAnswer;
	@Size(min = 4, max = 11, messageResId = R.string.fieldsNotLessThan4Char2)
	@Password(min = 6, scheme = Password.Scheme.ALPHA_NUMERIC, messageResId = R.string.passwordForamtError)
	protected EditText m4EditPassword;
	@Password(min = 6, scheme = Password.Scheme.ALPHA_NUMERIC, messageResId = R.string.passwordMatchError)
	protected EditText m5ConfirmEditPassword;

	protected Button mRegisterAccount;
	private Validator validator;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_regestration);
		m1EditUserName = (EditText) findViewById(R.id.etUserName);
		m2EditDisplayName = (EditText) findViewById(R.id.etDisplayName);
		m3EditEmailAddress = (EditText) findViewById(R.id.etEmailAddress);
		m4EditAnswer = (EditText) findViewById(R.id.etSecurityAnswer);
		m4EditPassword = (EditText) findViewById(R.id.etPassword);
		m5ConfirmEditPassword = (EditText) findViewById(R.id.etPasswordConfirm);
		validator = new Validator(this);
		validator.setValidationListener(this);
	}

	public void registerAccount(View view) {
		m1EditUserName.setError(null);
		m2EditDisplayName.setError(null);
		m3EditEmailAddress.setError(null);
		m4EditPassword.setError(null);
		validator.validate();
	}

	public void processSignup(View view) {
		// Toast.makeText(this, "Creating user...", Toast.LENGTH_SHORT).show();
		showProgress();
		model.createUser(m3EditEmailAddress.getText().toString(), m4EditPassword.getText().toString(), m1EditUserName.getText().toString(), m2EditDisplayName.getText().toString(), m4EditAnswer.getText().toString(), this);
	}

	@Override
	public void requestDone(Object result) {
		hideProgress();
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

	@Override
	public void onValidationFailed(List<ValidationError> errors) {
		if (errors.size() > 0) {
			showError(errors.get(0).getCollatedErrorMessage(this));
			((EditText) errors.get(0).getView()).setError(errors.get(0).getCollatedErrorMessage(this));
		}
	}

	@Override
	public void onValidationSucceeded() {
		if (m4EditPassword.getText().toString().equals(m5ConfirmEditPassword.getText().toString()))
			processSignup(null);
		else
			m5ConfirmEditPassword.setError(getString(R.string.passwordMatchError));
	}

	@Override
	public void onItemSelected(AdapterView<?> parent, View view, int pos, long id) {
		((TextView) parent.getChildAt(0)).setTextColor(Color.WHITE);

	}

	@Override
	public void onNothingSelected(AdapterView<?> arg0) {
		// TODO Auto-generated method stub

	}

	public void showSecurityAnswerHelp(View view) {
		showAlert("Security word is used for recovering your account once forgetting your password ");

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
