package com.egygames.apps.social;

import java.util.List;

import android.os.Bundle;
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
import com.mobsandgeeks.saripaar.annotation.Size;

public class ResetSecurityWord extends BaseActivity implements ValidationListener, RequestListiner {

	@Size(min = 4, max = 11, messageResId = R.string.fieldsNotLessThan4Char2)
	protected EditText m4EditAnswer;

	@Size(min = 4, max = 11, messageResId = R.string.fieldsNotLessThan4Char2)
	protected EditText m5EditNewAnswer;
	private Validator validator;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_reset_security_word);
		m4EditAnswer = (EditText) findViewById(R.id.etSecurityAnswerOld);
		m5EditNewAnswer = (EditText) findViewById(R.id.etSecurityAnswer);
		validator = new Validator(this);
		validator.setValidationListener(this);

	}

	public void save(View v) {
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
		if (m4EditAnswer.getText().toString().equals(util.user.getSecurityWord())) {
			User user=new User();
			user.setComboUserID(util.user.getComboUserID());
			user.setSecurityWord(m5EditNewAnswer.getText().toString());
			showProgress();
			model.updateUser(user, this);
		} else
			m4EditAnswer.setError(getString(R.string.answerMatchError));
	}

	@Override
	public void requestDone(Object result) {

		List<User> list = (List<User>) result;
		util.saveUser(list.get(0));
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

}
