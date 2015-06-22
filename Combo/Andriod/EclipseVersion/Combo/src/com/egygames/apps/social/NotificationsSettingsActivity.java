package com.egygames.apps.social;

import java.util.ArrayList;

import android.content.SharedPreferences;
import android.os.Bundle;
import android.preference.CheckBoxPreference;
import android.preference.Preference;
import android.preference.Preference.OnPreferenceClickListener;
import android.preference.PreferenceActivity;
import android.preference.PreferenceManager;
import android.view.View;
import android.widget.ImageButton;

import com.combomobile.R;
import com.egygames.apps.social.entity.Notification.NotificationTypeEnum;
import com.egygames.apps.social.entity.NotificationUserSetting;
import com.egygames.apps.social.entity.NotificationUserSettingItem;
import com.egygames.apps.social.entity.User;
import com.egygames.apps.social.model.DefaultRequestListiner;
import com.egygames.apps.social.model.Model;
import com.egygames.apps.social.views.HomePopupMenu;
import com.egygames.apps.social.views.util.Util;

public class NotificationsSettingsActivity extends PreferenceActivity implements
		OnPreferenceClickListener {

	private ImageButton more;
	private boolean isMoreOpened = false;
	private HomePopupMenu popup;
//	private NotificationUserArray notificationUserArray;

	ArrayList<CheckBoxPreference> likeList, commentsList, followList,
			acceptFollowRequest, rankList, birthdayList, mentionsList,
			repostList, chatList;

	ArrayList<NotificationUserSettingItem> noArrayList;
	NotificationUserSetting notificationUserSetting;

	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		addPreferencesFromResource(R.xml.settings_notifications);
		setContentView(R.layout.activity_settings);
		setTitle(R.string.settings);
		findViewById(R.id.more).setVisibility(View.GONE);

	//	notificationUserArray = new NotificationUserArray();
		noArrayList=new ArrayList<NotificationUserSettingItem>();
		likeList = new ArrayList<CheckBoxPreference>();
		likeList.add((CheckBoxPreference) getPreferenceManager()
				.findPreference("off_like"));
		likeList.add((CheckBoxPreference) getPreferenceManager()
				.findPreference("foll_like"));
		likeList.add((CheckBoxPreference) getPreferenceManager()
				.findPreference("every_like"));

		for (CheckBoxPreference cbp : likeList) {
			cbp.setOnPreferenceClickListener(this);
		}

		commentsList = new ArrayList<CheckBoxPreference>();
		commentsList.add((CheckBoxPreference) getPreferenceManager()
				.findPreference("off_comments"));
		commentsList.add((CheckBoxPreference) getPreferenceManager()
				.findPreference("foll_comments"));
		commentsList.add((CheckBoxPreference) getPreferenceManager()
				.findPreference("every_comments"));

		for (CheckBoxPreference cbp : commentsList) {
			cbp.setOnPreferenceClickListener(this);
		}

		followList = new ArrayList<CheckBoxPreference>();
		followList.add((CheckBoxPreference) getPreferenceManager()
				.findPreference("off_follow"));
		followList.add((CheckBoxPreference) getPreferenceManager()
				.findPreference("foll_follow"));
		followList.add((CheckBoxPreference) getPreferenceManager()
				.findPreference("every_follow"));

		for (CheckBoxPreference cbp : followList) {
			cbp.setOnPreferenceClickListener(this);
		}

		acceptFollowRequest = new ArrayList<CheckBoxPreference>();
		acceptFollowRequest.add((CheckBoxPreference) getPreferenceManager()
				.findPreference("off_accept_follow"));
		acceptFollowRequest.add((CheckBoxPreference) getPreferenceManager()
				.findPreference("foll_accept_follow"));
		acceptFollowRequest.add((CheckBoxPreference) getPreferenceManager()
				.findPreference("every_accept_follow"));

		for (CheckBoxPreference cbp : acceptFollowRequest) {
			cbp.setOnPreferenceClickListener(this);
		}

		repostList = new ArrayList<CheckBoxPreference>();
		repostList.add((CheckBoxPreference) getPreferenceManager()
				.findPreference("off_repost"));
		repostList.add((CheckBoxPreference) getPreferenceManager()
				.findPreference("foll_repost"));
		repostList.add((CheckBoxPreference) getPreferenceManager()
				.findPreference("every_repost"));

		for (CheckBoxPreference cbp : repostList) {
			cbp.setOnPreferenceClickListener(this);
		}

		birthdayList = new ArrayList<CheckBoxPreference>();
		birthdayList.add((CheckBoxPreference) getPreferenceManager()
				.findPreference("off_birthday"));
		birthdayList.add((CheckBoxPreference) getPreferenceManager()
				.findPreference("foll_birthday"));
		birthdayList.add((CheckBoxPreference) getPreferenceManager()
				.findPreference("every_birthday"));

		for (CheckBoxPreference cbp : birthdayList) {
			cbp.setOnPreferenceClickListener(this);
		}

		mentionsList = new ArrayList<CheckBoxPreference>();
		mentionsList.add((CheckBoxPreference) getPreferenceManager()
				.findPreference("off_mentions"));
		mentionsList.add((CheckBoxPreference) getPreferenceManager()
				.findPreference("foll_mentions"));
		mentionsList.add((CheckBoxPreference) getPreferenceManager()
				.findPreference("every_mentions"));

		for (CheckBoxPreference cbp : mentionsList) {
			cbp.setOnPreferenceClickListener(this);
		}

		chatList = new ArrayList<CheckBoxPreference>();
		chatList.add((CheckBoxPreference) getPreferenceManager()
				.findPreference("off_chat"));
		chatList.add((CheckBoxPreference) getPreferenceManager()
				.findPreference("foll_chat"));
		chatList.add((CheckBoxPreference) getPreferenceManager()
				.findPreference("every_chat"));

		for (CheckBoxPreference cbp : chatList) {
			cbp.setOnPreferenceClickListener(this);
		}

		rankList = new ArrayList<CheckBoxPreference>();
		rankList.add((CheckBoxPreference) getPreferenceManager()
				.findPreference("off_rank"));
		rankList.add((CheckBoxPreference) getPreferenceManager()
				.findPreference("every_rank"));

		for (CheckBoxPreference cbp : rankList) {
			cbp.setOnPreferenceClickListener(this);
		}
	}

	public void back(View v) {
		finish();
	}

	@Override
	public boolean onPreferenceClick(Preference arg0) {
		User user = new User();
		user.setComboUserID(Util.instance.user.getComboUserID());
		NotificationUserSettingItem noItem;
		int selectedID = 0;
		// ///////////////////////////////////////
		if (arg0.getKey().contains("like")) {
			for (CheckBoxPreference cbp : likeList) {
				if (!cbp.getKey().equals(arg0.getKey()) && cbp.isChecked()) {
					cbp.setChecked(false);
				}

			}
			noItem = new NotificationUserSettingItem();
			noItem.setComboUserID(Integer.valueOf(user.getComboUserID()));
			noItem.setNotificationTypeID(1);
			for (CheckBoxPreference cbp : likeList) {
				if (cbp.isChecked()) {
					break;
				}
				selectedID += 1;

			}
			noItem.setStatus(selectedID);
			noArrayList.add(noItem);
			
		} else if (arg0.getKey().contains("comment")) {
			noItem = new NotificationUserSettingItem();
			noItem.setComboUserID(Integer.valueOf(user.getComboUserID()));
			noItem.setNotificationTypeID(2);
			selectedID = 0;
			for (CheckBoxPreference cbp : commentsList) {

				if (!cbp.getKey().equals(arg0.getKey()) && cbp.isChecked()) {
					cbp.setChecked(false);
				}

			}
			for (CheckBoxPreference cbp : commentsList) {
				if (cbp.isChecked()) {
					break;
				}
				selectedID += 1;

			}
			noItem.setStatus(selectedID );
			noArrayList.add(noItem);
		} else if (arg0.getKey().contains("follow")
				&& !arg0.getKey().contains("accept")) {
			noItem = new NotificationUserSettingItem();
			noItem.setComboUserID(Integer.valueOf(user.getComboUserID()));
			noItem.setNotificationTypeID(7);
			selectedID = 0;
			for (CheckBoxPreference cbp : followList) {

				if (!cbp.getKey().equals(arg0.getKey()) && cbp.isChecked()) {
					cbp.setChecked(false);
				}

			}
			for (CheckBoxPreference cbp : followList) {
				if (cbp.isChecked()) {
					break;
				}
				selectedID += 1;

			}
			noItem.setStatus(selectedID );
			noArrayList.add(noItem);
		} else if (arg0.getKey().contains("follow")
				&& arg0.getKey().contains("accept")) {
			noItem = new NotificationUserSettingItem();
			noItem.setComboUserID(Integer.valueOf(user.getComboUserID()));
			noItem.setNotificationTypeID(14);
			selectedID = 0;
			for (CheckBoxPreference cbp : acceptFollowRequest) {

				if (!cbp.getKey().equals(arg0.getKey()) && cbp.isChecked()) {
					cbp.setChecked(false);
				}

			}
			for (CheckBoxPreference cbp : acceptFollowRequest) {
				if (cbp.isChecked()) {
					break;
				}
				selectedID += 1;

			}
			noItem.setStatus(selectedID);
			noArrayList.add(noItem);
		} else if (arg0.getKey().contains("mention")) {
			noItem = new NotificationUserSettingItem();
			noItem.setComboUserID(Integer.valueOf(user.getComboUserID()));
			noItem.setNotificationTypeID(13);
			selectedID = 0;
			for (CheckBoxPreference cbp : mentionsList) {

				if (!cbp.getKey().equals(arg0.getKey()) && cbp.isChecked()) {
					cbp.setChecked(false);
				}

			}
			for (CheckBoxPreference cbp : mentionsList) {
				if (cbp.isChecked()) {
					break;
				}
				selectedID += 1;

			}
			noItem.setStatus(selectedID );
			noArrayList.add(noItem);
		} else if (arg0.getKey().contains("repost")) {
			noItem = new NotificationUserSettingItem();
			noItem.setComboUserID(Integer.valueOf(user.getComboUserID()));
			noItem.setNotificationTypeID( 5);
			selectedID = 0;
			for (CheckBoxPreference cbp : repostList) {

				if (!cbp.getKey().equals(arg0.getKey()) && cbp.isChecked()) {
					cbp.setChecked(false);
				}

			}
			for (CheckBoxPreference cbp : repostList) {
				if (cbp.isChecked()) {
					break;
				}
				selectedID += 1;

			}
			noItem.setStatus(selectedID );
			noArrayList.add(noItem);
		} else if (arg0.getKey().contains("birthday")) {
			noItem = new NotificationUserSettingItem();
			noItem.setComboUserID(Integer.valueOf(user.getComboUserID()));
			noItem.setNotificationTypeID( 16);
			selectedID = 0;
			for (CheckBoxPreference cbp : birthdayList) {

				if (!cbp.getKey().equals(arg0.getKey()) && cbp.isChecked()) {
					cbp.setChecked(false);
				}

			}
			for (CheckBoxPreference cbp : birthdayList) {
				if (cbp.isChecked()) {
					break;
				}
				selectedID += 1;

			}
			noItem.setStatus(selectedID);
			noArrayList.add(noItem);
		}
		// ////////////////////////////////////////////////////////////////////////////
		else if (arg0.getKey().contains("rank")) {
			noItem = new NotificationUserSettingItem();
			noItem.setComboUserID(Integer.valueOf(user.getComboUserID()));
			noItem.setNotificationTypeID(15);
			selectedID = 0;
			for (CheckBoxPreference cbp : rankList) {

				if (!cbp.getKey().equals(arg0.getKey()) && cbp.isChecked()) {
					cbp.setChecked(false);
				}

			}
			for (CheckBoxPreference cbp : rankList) {
				if (cbp.isChecked()) {
					break;
				}
				selectedID += 2;

			}
			noItem.setStatus(selectedID);
			noArrayList.add(noItem);
		}
		// ////////////////////////////////////////////////////////////////////////////
		else if (arg0.getKey().contains("chat")) {
			noItem = new NotificationUserSettingItem();
			noItem.setComboUserID(Integer.valueOf(user.getComboUserID()));
			noItem.setNotificationTypeID(17);
			selectedID = 0;
			for (CheckBoxPreference cbp : chatList) {

				if (!cbp.getKey().equals(arg0.getKey()) && cbp.isChecked()) {
					cbp.setChecked(false);
				}

			}
			for (CheckBoxPreference cbp : chatList) {
				if (cbp.isChecked()) {
					break;
				}
				selectedID += 1;

			}
			noItem.setStatus(selectedID );
			noArrayList.add(noItem);
		}
		// ////////////////////////////////////////////////////////////////////////////
	//	notificationUserArray.setNotificationUserSetting(notificationUserSetting);
		saveChanges();

		return true;
	}

	private void saveChanges() {
		// TODO Auto-generated method stub
		SharedPreferences preferences = PreferenceManager
				.getDefaultSharedPreferences(this);

		User user = new User();
		user.setComboUserID(Util.instance.user.getComboUserID());
		NotificationUserSetting noUserSetting=new NotificationUserSetting();
		noUserSetting.setNotificationUserSetting(noArrayList);
		Model.instance.setNotificationSettings(noUserSetting, new DefaultRequestListiner());
	}

}