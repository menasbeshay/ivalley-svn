package com.egygames.apps.social;

import java.util.ArrayList;
import java.util.List;

import android.content.Intent;
import android.os.Bundle;
import android.text.Html;
import android.text.method.LinkMovementMethod;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;

import com.combomobile.R;
import com.egygames.apps.social.entity.User;
import com.egygames.apps.social.model.RequestListiner;
import com.mobsandgeeks.saripaar.ValidationError;
import com.mobsandgeeks.saripaar.Validator;
import com.mobsandgeeks.saripaar.Validator.ValidationListener;
import com.mobsandgeeks.saripaar.annotation.NotEmpty;
import com.mobsandgeeks.saripaar.annotation.Size;

public class ForgotPasswordActivity extends BaseActivity implements RequestListiner, ValidationListener {

	@Size(min = 4, max = 100, messageResId = R.string.fieldsNotLessThan4Char)
	private TextView m1userNameEmail;
	@NotEmpty(messageResId = R.string.fieldsNotFilledError)
	@Size(min = 4, max = 11, messageResId = R.string.fieldsNotLessThan4Char2)
	protected EditText m2EditAnswer;
	private Validator validator;
	private String username;
	private String answer;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_forgot_password);
		m1userNameEmail = (TextView) findViewById(R.id.email);
		m2EditAnswer = (EditText) findViewById(R.id.etSecurityAnswer);
		validator = new Validator(this);
		validator.setValidationListener(this);

		if (getIntent().hasExtra("resetPasswordFromEditeProfie")) {
			m1userNameEmail.setText(util.user.getUserName());
			m1userNameEmail.setEnabled(false);
		}
		TextView hint = (TextView) findViewById(R.id.resetHint);

		hint.setMovementMethod(LinkMovementMethod.getInstance());
		hint.setText(Html.fromHtml("If you don&apos;t remember your security word, please visit \n<a href=\"http://www.combomobile.com\">combomobile.com</a> "));
		hint.setMovementMethod(LinkMovementMethod.getInstance());
	}

	public void resetPassword(View v) {
		validator.validate();
	}

	@Override
	public void requestDone(Object result) {
		User user = ((ArrayList<User>) result).get(0);
		Intent intent = new Intent(this, ResetPasswordActivity.class);
		intent.putExtra("id", user.getComboUserID());
		startActivity(intent);
		finish();
		hideProgress();
		return;

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
		if (m1userNameEmail.getText().toString().isEmpty()) {
			showError(R.string.emailError);
			return;
		}
		username = m1userNameEmail.getText().toString();
		answer = m2EditAnswer.getText().toString();

		showProgress();
		model.resetPassword(username, answer, this);
	}

}
