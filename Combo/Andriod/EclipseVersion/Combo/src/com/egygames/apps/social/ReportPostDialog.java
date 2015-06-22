package com.egygames.apps.social;
import java.util.List;

import android.app.Dialog;
import android.content.Context;
import android.view.KeyEvent;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import com.combomobile.R;
import com.egygames.apps.social.model.DefaultRequestListiner;
import com.egygames.apps.social.model.Model;
import com.mobsandgeeks.saripaar.ValidationError;
import com.mobsandgeeks.saripaar.Validator;
import com.mobsandgeeks.saripaar.Validator.ValidationListener;
import com.mobsandgeeks.saripaar.annotation.NotEmpty;

public class ReportPostDialog extends Dialog implements ValidationListener, android.view.View.OnClickListener {

	@NotEmpty(messageResId = R.string.fieldsNotFilledError)
	private EditText decription;
	private Validator validator;
	private String idPostOrCommentORUser;
	private String type;
	private String userId;

	public ReportPostDialog(String idPostOrCommentORUser, Context context,String type,String userId) {
		super(context);
		this.idPostOrCommentORUser = idPostOrCommentORUser;
		this.type=type;
		this.userId=userId;
		setContentView(R.layout.report_post);
		setTitle(R.string.rePort);
		findViewById(R.id.report).setOnClickListener(this);
		decription = (EditText) findViewById(R.id.reportDesc);
		validator = new Validator(this);
		validator.setValidationListener(this);
	}
	
	
	@Override
	public void onValidationFailed(List<ValidationError> errors) {
		if (errors.size() > 0) {
			((EditText) errors.get(0).getView()).setError(errors.get(0).getCollatedErrorMessage(this.getContext()));
		}

	}

	@Override
	public void onValidationSucceeded() {
		if(!decription.getText().toString().equals("") && decription.getText().toString().length()<=500)
		{
			Toast.makeText(getContext(), "Your report is empty.", Toast.LENGTH_LONG).show();
		}
		else if(!decription.getText().toString().equals("") && decription.getText().toString().length()<=500)
		{
			if(type.equals("post"))
			{
				Model.instance.reportPost(idPostOrCommentORUser, decription.getText().toString(), new DefaultRequestListiner());
			}
			else if(type.equals("user"))
			{
				Model.instance.reportUser(userId,idPostOrCommentORUser, decription.getText().toString(), new DefaultRequestListiner());
			}
			else if(type.equals("comment"))
			{
				Model.instance.reportComment(idPostOrCommentORUser, decription.getText().toString(), new DefaultRequestListiner());
			}
			
			Toast.makeText(getContext(), "Your report request have been sent", Toast.LENGTH_LONG).show();
		}
		else
		{
			Toast.makeText(getContext(), "Your report must be less  than 500 characters.", Toast.LENGTH_LONG).show();
		}
		dismiss();	
	}

	@Override
	public void onClick(View v) {
		validator.validate();
			
	}

}
