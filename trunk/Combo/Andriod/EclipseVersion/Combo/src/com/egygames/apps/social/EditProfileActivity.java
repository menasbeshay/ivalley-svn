package com.egygames.apps.social;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import android.app.DatePickerDialog;
import android.app.DatePickerDialog.OnDateSetListener;
import android.content.Intent;
import android.graphics.Color;
import android.net.Uri;
import android.os.Bundle;
import android.util.Patterns;
import android.view.View;
import android.view.Window;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemSelectedListener;
import android.widget.ArrayAdapter;
import android.widget.DatePicker;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.TextView;

import com.combomobile.R;
import com.egygames.apps.social.entity.User;
import com.egygames.apps.social.model.RequestListiner;
import com.mobsandgeeks.saripaar.ValidationError;
import com.mobsandgeeks.saripaar.Validator;
import com.mobsandgeeks.saripaar.Validator.ValidationListener;
import com.mobsandgeeks.saripaar.annotation.Email;
import com.mobsandgeeks.saripaar.annotation.NotEmpty;
import com.mobsandgeeks.saripaar.annotation.Size;

public class EditProfileActivity extends BaseActivity implements ValidationListener, OnItemSelectedListener, OnDateSetListener {

	private static final int PICK_IMAGE_REQ = 0;
	private boolean isCover;

	@NotEmpty(messageResId = R.string.fieldsNotFilledError)
	@Size( max = 22, messageResId = R.string.fieldsNotLessThan4Char)
	protected EditText m2EditDisplayName;
	@Email(messageResId = R.string.emailForamtError)
	protected EditText m3EditEmailAddress;

	@NotEmpty(messageResId = R.string.fieldsNotFilledError)
	@Size(min = 4, max = 200, messageResId = R.string.fieldsNotLessThan4Char)
	protected EditText m4EditBio;

	protected EditText m4EditWebSite;

	private Validator validator;
	private Spinner gender, countries;
	private TextView birthday;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		requestWindowFeature(Window.FEATURE_NO_TITLE);
		super.onCreate(savedInstanceState);
		if (savedInstanceState != null)
			isCover = savedInstanceState.getBoolean("isCover", true);
		setContentView(R.layout.activity_edit_profile);
		m2EditDisplayName = (EditText) findViewById(R.id.etDisplayName);
		m2EditDisplayName.setText(util.user.getDisplayName());

		m3EditEmailAddress = (EditText) findViewById(R.id.etEmailAddress);
		m3EditEmailAddress.setText(util.user.getEmail());

		m4EditBio = (EditText) findViewById(R.id.etBio);
		m4EditBio.setText(util.user.getBio());

		birthday = (TextView) findViewById(R.id.birthday);
		if (!util.user.getBirthDate().startsWith("0001"))
			birthday.setText(util.user.getBirthDate().substring(0, 10));
		else
			birthday.setText("na");

		countries = (Spinner) findViewById(R.id.country);
		countries.setOnItemSelectedListener(this);
		ArrayAdapter<String> spinnerArrayAdapter = new ArrayAdapter<String>(this, android.R.layout.simple_spinner_item, util.getCountriesStrings(this));
		spinnerArrayAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
		countries.setAdapter(spinnerArrayAdapter);
		try{
		countries.setSelection(Integer.parseInt(util.user.getCountry())-1);
		}catch(Exception e){}
		
		gender = (Spinner) findViewById(R.id.gender);
		gender.setOnItemSelectedListener(this);
		if (!"".equals(util.user.getPhone()))
			gender.setSelection(Integer.parseInt(util.user.getPhone()));

		m4EditWebSite = (EditText) findViewById(R.id.etWebSite);
		if (util.user.getWebsite() != null)
			m4EditWebSite.setText(util.user.getWebsite());
		validator = new Validator(this);
		validator.setValidationListener(this);

	}

	public void editeProfileImage(View v) {
		isCover = false;
		startActivityForResult(new Intent(this, AddImage.class), PICK_IMAGE_REQ);

	}
	
	

	public void requestAccountVerification(View v) {
		String url = "http://www.combomobile.com/virify";
		Intent i = new Intent(Intent.ACTION_VIEW);
		i.setData(Uri.parse(url));
		startActivity(i);
	}
		

	public void editeCoverImage(View v) {
		isCover = true;
		startActivityForResult(new Intent(this, AddImage.class), PICK_IMAGE_REQ);

	}

	public void save(View v) {
		validator.validate();
	}

	public void changeSecurityWord(View v) {
		startActivity(new Intent(this, ResetSecurityWord.class));

	}

	@Override
	public void onValidationFailed(List<ValidationError> errors) {
		if (errors.size() > 0) {
			showError(errors.get(0).getCollatedErrorMessage(this));
			((EditText) errors.get(0).getView()).setError(errors.get(0).getCollatedErrorMessage(this));
		}
	}

	@Override
	protected void onSaveInstanceState(Bundle outState) {
		outState.putBoolean("isCover", isCover);
		super.onSaveInstanceState(outState);
	}

	@Override
	public void onValidationSucceeded() {

		User user = new User();
		user.setComboUserID(util.user.getComboUserID());
		user.setDisplayName(m2EditDisplayName.getText().toString());
		user.setBio(m4EditBio.getText().toString());
		user.setEmail(m3EditEmailAddress.getText().toString());
		if (!((String) birthday.getText()).equals("na")) {
			user.setBirthDate(birthday.getText() + "T00:00:00");
		}
		if (!m4EditWebSite.getText().toString().equals(""))
			if (isValidUrl(m4EditWebSite.getText().toString())) {
				user.setWebsite(m4EditWebSite.getText().toString());
			} else {
				showError("Please enter a vaild web site");
				return;
			}
		if (gender.getSelectedItemPosition() == 0) {
			showError("Please select gender");
			return;
		}
		if (countries.getSelectedItemPosition() == 0) {
			showError("Please select a country");
			return;
		}
		user.setPhone("" + gender.getSelectedItemPosition());
		user.setCountryID(countries.getSelectedItemPosition() + 1);
		user.setCountry(String.valueOf(countries.getSelectedItemPosition() + 1));
		showProgress();
		model.updateUser(user, uploadListiner);
	}

	private boolean isValidUrl(String url) {
		Pattern p = Patterns.WEB_URL;
		Matcher m = p.matcher(url);
		if (m.matches())
			return true;
		else
			return false;
	}

	@Override
	protected void onActivityResult(int requestCode, int resultCode, Intent data) {
		if (resultCode == RESULT_CANCELED)
			return;
		// ImageView attachmentThumbImage = (ImageView)
		// findViewById(R.id.profileImage);
		switch (requestCode) {
		case PICK_IMAGE_REQ:
			if (!"".equals(util.getImageThumbPath())) {
				// attachmentThumbImage.setImageURI(Uri.parse(util.getImageThumbPath()));
				if (isCover)
					model.upload(this, "1", false, util.getImageThumbPath(), "image/*", util.user.getComboUserID(), uploadListiner);
				else
					model.upload(this, "1", true, util.getImageThumbPath(), "image/*", util.user.getComboUserID(), uploadListiner);
			}

			break;
		default:
			break;
		}

	}

	private RequestListiner uploadListiner = new RequestListiner() {

		public void requestDone(Object result) {
			finish();
			hideProgress();

		};

		@Override
		public void requestError(String result) {
			hideProgress();
			finish();
			showError(result);
		}

		@Override
		public void requestError(int errorResource) {
			hideProgress();
			finish();
			showError(errorResource);
		}

	};

	@Override
	public void onItemSelected(AdapterView<?> parent, View view, int pos, long id) {
		((TextView) parent.getChildAt(0)).setTextColor(Color.WHITE);

	}

	@Override
	public void onNothingSelected(AdapterView<?> arg0) {
	}

	public void changePassword(View view) {
		Intent intent = new Intent(this, ForgotPasswordActivity.class);
		intent.putExtra("resetPasswordFromEditeProfie", true);
		// intent.putExtra("id", util.user.getComboUserID());
		startActivity(intent);
	}

	public void changeBirthday(View v) {
		DatePickerDialog datePickerDialog = new DatePickerDialog(this, this, 1990, 1, 1);
		datePickerDialog.show();
	}

	@Override
	public void onDateSet(DatePicker arg0, int year, int monthOfYear, int dayOfMonth) {
		birthday.setText(year + "-" + getTwoDigits(monthOfYear + 1) + "-" + getTwoDigits(dayOfMonth));

	}

	private String getTwoDigits(int number) {
		if (number < 10)
			return "0" + number;
		return "" + number;
	}
}
