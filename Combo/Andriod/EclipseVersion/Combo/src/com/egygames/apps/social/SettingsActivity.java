package com.egygames.apps.social;

import android.content.ComponentName;
import android.content.Intent;
import android.content.SharedPreferences;
import android.net.Uri;
import android.os.Bundle;
import android.preference.Preference;
import android.preference.Preference.OnPreferenceChangeListener;
import android.preference.Preference.OnPreferenceClickListener;
import android.preference.PreferenceActivity;
import android.preference.PreferenceManager;
import android.support.v4.content.IntentCompat;
import android.util.Log;
import android.view.View;
import android.widget.ImageButton;
import android.widget.PopupWindow.OnDismissListener;
import android.widget.TextView;

import com.combomobile.R;
import com.egygames.apps.social.entity.User;
import com.egygames.apps.social.model.DefaultRequestListiner;
import com.egygames.apps.social.model.Model;
import com.egygames.apps.social.model.RequestListiner;
import com.egygames.apps.social.views.HomePopupMenu;
import com.egygames.apps.social.views.util.Util;

public class SettingsActivity extends PreferenceActivity implements OnPreferenceClickListener, OnPreferenceChangeListener, RequestListiner {

	private ImageButton more;
	private boolean isMoreOpened = false;
	private HomePopupMenu popup;

	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		addPreferencesFromResource(R.xml.settings);
		setContentView(R.layout.activity_settings);
		setTitle(R.string.settings);
		findViewById(R.id.more).setVisibility(View.GONE);
		Preference button = (Preference) findPreference("addFriend");
		button.setOnPreferenceClickListener(this);
		button = (Preference) findPreference("addFriend");
		button.setOnPreferenceClickListener(this);
		button = (Preference) findPreference("inviteAfriend");
		button.setOnPreferenceClickListener(this);
		button = (Preference) findPreference("reportAproblem");
		button.setOnPreferenceClickListener(this);
		button = (Preference) findPreference("privacyPolicy");
		button.setOnPreferenceClickListener(this);
		button = (Preference) findPreference("termsofService");
		button.setOnPreferenceClickListener(this);
		button = (Preference) findPreference("logout");
		button.setOnPreferenceClickListener(this);

		button = (Preference) findPreference("likedPosts");
		button.setOnPreferenceClickListener(this);
		button = (Preference) findPreference("enablenofifications");
		button.setOnPreferenceClickListener(this);

		findPreference("privateAccount").setOnPreferenceChangeListener(this);
	}

	@Override
	public void setTitle(int titleId) {
		super.setTitle(titleId);
		TextView title = (TextView) findViewById(R.id.screenTitle);
		title.setText(titleId);
	}

	public void more(View v) {

		more = (ImageButton) v;
		if (isMoreOpened) {
			dismissMore();
		} else {
			more.setImageResource(R.drawable.more_icon_expanded);
			if (popup != null)
				popup.show();

			else {
				popup = new HomePopupMenu(this, v,false);
				popup.setOnDismissListener(new OnDismissListener() {
					@Override
					public void onDismiss() {
						isMoreOpened = false;
						more.setImageResource(R.drawable.more_icon);
					}
				});
			}
		}

		isMoreOpened = !isMoreOpened;

	}

	private void dismissMore() {
		if (isMoreOpened) {
			isMoreOpened = false;
			more.setImageResource(R.drawable.more_icon);
			popup.dismiss();
		}
	}

	public void back(View v) {
		finish();
	}

	public void friends(View v) {
		startActivity(new Intent(this, ProfilesListActivity.class));
		dismissMore();
	}

	public void notificationssettings(View v) {
		startActivity(new Intent(this, NotificationsSettingsActivity.class));
		// dismissMore();
	}

	public void help(View v) {
		startActivity(new Intent(this, HelpActivity.class));
		dismissMore();
	}

	public void post(View v) {
		Util.instance.resetAttachments();
		startActivity(new Intent(this, NewPost.class));
	}

	public void chat(View v) {
		startActivity(new Intent(this, MessagesListActivity.class));
	}

	public void notifications(View v) {
		startActivity(new Intent(this, NotificationsActivity.class));
	}

	public void profile(View v) {
		startActivity(new Intent(this, ProfileActivity.class));
	}

	public void explore(View v) {
		Intent intent = new Intent(this, ExploreActivity.class);
		intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP | Intent.FLAG_ACTIVITY_NEW_TASK);
		startActivity(intent);
	}

	@Override
	public boolean onPreferenceClick(Preference preference) {
		if (preference.getKey().equals("enablenofifications")) {
			notificationssettings(null);
			return true;
		}

		if (preference.getKey().equals("addFriend")) {
			friends(null);
			return true;
		}

		if (preference.getKey().equals("inviteAfriend")) {
			sendInvitationEmail();
			return true;
		}
		if (preference.getKey().equals("reportAproblem")) {
			sendProblemEmail();
			return true;
		}
		if (preference.getKey().equals("privacyPolicy")) {
			showPolicy();
			return true;
		}
		if (preference.getKey().equals("termsofService")) {
			termsOfService();
			return true;
		}
		if (preference.getKey().equals("logout")) {

			Util.instance.setLogedin(false);
			Model.getInstance(this).logout(Util.instance.user.getComboUserID(), this);
			
			return true;
		}

		if (preference.getKey().equals("likedPosts")) {

			startActivity(new Intent(this, LikedPostsActivity.class));
			return true;
		}
		if (preference.getKey().equals("addFriend")) {
			friends(null);
			return true;
		}

		return true;
	}

	private void sendProblemEmail() {
		try {
			Intent emailIntent = new Intent(Intent.ACTION_SENDTO, Uri.fromParts("mailto", "feedback@combomobile.com", null));
			emailIntent.putExtra(Intent.EXTRA_SUBJECT, "EXTRA_SUBJECT");
			startActivity(Intent.createChooser(emailIntent, "Send email..."));

		} catch (Exception ex) {
		}
	}

	private void showPolicy() {
		startActivity(new Intent(this, PrivacyPolicyActivity.class));
	}

	private void termsOfService() {
		startActivity(new Intent(this, TermsOfServiceActivity.class));
	}

	private void sendInvitationEmail() {
		try {
			String shareBody = "I’m on Combo as " + Util.instance.user.getUserName() + " .\nInstall the app to follow my photos and videos. http://combomobile.com/download ";
			Intent sharingIntent = new Intent(android.content.Intent.ACTION_SEND);
			sharingIntent.setType("text/plain");
			sharingIntent.putExtra(android.content.Intent.EXTRA_SUBJECT, "Subject Here");
			sharingIntent.putExtra(android.content.Intent.EXTRA_TEXT, shareBody);
			startActivity(Intent.createChooser(sharingIntent, getResources().getString(R.string.inviteFriends)));

		} catch (Exception ex) {

		}
	}

	@Override
	public boolean onPreferenceChange(Preference arg0, Object arg1) {
		SharedPreferences preferences = PreferenceManager.getDefaultSharedPreferences(this);

		User user = new User();
		user.setComboUserID(Util.instance.user.getComboUserID());
		Log.d("pri", " " + preferences.getBoolean("privateAccount", false));
		user.setIsPrivateAccount(!preferences.getBoolean("privateAccount", false));
		Model.instance.updateUser(user, new DefaultRequestListiner());
		return true;
	}

	@Override
	public void requestDone(Object result) {
		// TODO Auto-generated method stub
		Intent intent = new Intent(this, LoginActivity.class);
		intent.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP | Intent.FLAG_ACTIVITY_NEW_TASK);

		ComponentName cn = intent.getComponent();
		Intent mainIntent = IntentCompat.makeRestartActivityTask(cn);

		startActivity(mainIntent);
		finish();
	}

	@Override
	public void requestError(String result) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void requestError(int errorResource) {
		// TODO Auto-generated method stub
		
	}
}