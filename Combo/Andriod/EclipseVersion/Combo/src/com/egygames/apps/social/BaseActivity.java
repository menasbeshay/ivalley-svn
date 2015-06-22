package com.egygames.apps.social;

import java.util.ArrayList;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.AlertDialog.Builder;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.net.Uri;
import android.os.Bundle;
import android.view.View;
import android.view.WindowManager;
import android.view.inputmethod.InputMethodManager;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.PopupWindow.OnDismissListener;
import android.widget.TextView;
import android.widget.Toast;

import com.combomobile.R;
import com.egygames.apps.social.entity.NotificationCommentsUnReadCounter;
import com.egygames.apps.social.model.Model;
import com.egygames.apps.social.model.RequestListiner;
import com.egygames.apps.social.views.HomePopupMenu;
import com.egygames.apps.social.views.util.Util;

public class BaseActivity extends Activity {
	private static final int PICK_IMAGE_REQ = 0;
	protected static final int PICK_AUDIO_REQ = 1;
	private static final int PICK_VIDEO_REQ = 2;
	public Util util;
	public Model model;
	private ImageButton more;
	private boolean isMoreOpened = false;
	private HomePopupMenu popup;
	private boolean setNotificationsDone;

	// private Bus bus;
	// private NetworkEvents networkEvents;
	// public ConnectivityChanged connectionStatus;

	public boolean isSetNotificationsDone() {
		return setNotificationsDone;
	}

	public void setSetNotificationsDone(boolean setNotificationsDone) {
		this.setNotificationsDone = setNotificationsDone;
	}

	@Override
	protected void onCreate(Bundle savedInstanceState) {

		setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_PORTRAIT);
		util = Util.getInstance(this);
		model = Model.getInstance(this);
		super.onCreate(savedInstanceState);
		overridePendingTransition(R.anim.slide_in, R.anim.slide_out);
		setNotificationsDone = false;
		getWindow().setSoftInputMode(
				WindowManager.LayoutParams.SOFT_INPUT_STATE_ALWAYS_HIDDEN);

	}

	@Override
	protected void onResume() {
		if (!setNotificationsDone)
			setNotificationsAndMessagesCount();

		getWindow().setSoftInputMode(
				WindowManager.LayoutParams.SOFT_INPUT_STATE_ALWAYS_HIDDEN);

		super.onResume();
	}

	@Override
	public void setTitle(int titleId) {
		super.setTitle(titleId);
		TextView title = (TextView) findViewById(R.id.screenTitle);
		title.setText(titleId);
	}

	public void setTitle(String titleId) {
		TextView title = (TextView) findViewById(R.id.screenTitle);
		title.setText(titleId);
	}

	protected void setText(int fieldId, String text) {
		((TextView) findViewById(fieldId)).setText(text);

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
				popup = new HomePopupMenu(this, v, false);
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
		isMoreOpened = false;
		more.setImageResource(R.drawable.more_icon);
		popup.dismiss();
	}

	public void back(View v) {
		finish();
	}

	public void friends(View v) {
		// dismissMore();
		isMoreOpened = false;
		startActivity(new Intent(this, ProfilesListActivity.class));

	}

	public void settings(View v) {
		startActivity(new Intent(this, SettingsActivity.class));

		isMoreOpened = false;
		// dismissMore();
		// Intent mpdIntent = new Intent(this,
		// AudioFxDemoActivity.class).setData(Uri.parse("http://www.youtube.com/api/manifest/dash/id/bf5bb2419360daf1/source/youtube?"
		// +
		// "as=fmp4_audio_clear,fmp4_sd_hd_clear&sparams=ip,ipbits,expire,as&ip=0.0.0.0&"
		// +
		// "ipbits=0&expire=19000000000&signature=255F6B3C07C753C88708C07EA31B7A1A10703C8D."
		// + "2D6A28B21F921D0B245CDCF36F7EB54A2B5ABFC2&key=ik0"));
		// startActivity(mpdIntent);
	}

	public void help(View v) {
		isMoreOpened = false;

		startActivity(new Intent(this, HelpActivity.class));

		// dismissMore();

	}

	public void showError(int stringId) {
		Toast.makeText(this, getString(stringId), Toast.LENGTH_LONG).show();
	}

	public void showError(String string) {
		Toast.makeText(this, string, Toast.LENGTH_LONG).show();
	}

	public void showView(View view) {
		view.setVisibility(View.VISIBLE);

	}

	public void showView(int view) {
		findViewById(view).setVisibility(View.VISIBLE);

	}

	public void hideView(View view) {
		view.setVisibility(View.GONE);

	}

	public void hideView(int view) {
		findViewById(view).setVisibility(View.GONE);

	}

	protected void hideProgress() {
		findViewById(R.id.progress).setVisibility(View.GONE);
	}

	protected void showProgress() {
		findViewById(R.id.progress).setVisibility(View.VISIBLE);
	}

	public void post(View v) {
//		util.resetAttachments();
//		finish();
//		startActivity(new Intent(this, NewPost.class));
		AlertDialog.Builder soon=new AlertDialog.Builder(this);
		soon.setMessage("Chating room coming soon..");
		soon.setPositiveButton("OK", new DialogInterface.OnClickListener() {
			
			@Override
			public void onClick(DialogInterface dialog, int which) {
				// TODO Auto-generated method stub
				dialog.dismiss();
			}
		});
		soon.show();
	}

	public void chat(View v) {
		//finish();
		//startActivity(new Intent(this, MessagesListActivity.class));
		AlertDialog.Builder soon=new AlertDialog.Builder(this);
		soon.setMessage(v==null?"Chating room coming soon..":"Combo Messenger is coming Soon");
		soon.setPositiveButton("OK", new DialogInterface.OnClickListener() {
			
			@Override
			public void onClick(DialogInterface dialog, int which) {
				// TODO Auto-generated method stub
				dialog.dismiss();
			}
		});
		soon.show();
		

	}

	public void notifications(View v) {
		finish();
		startActivity(new Intent(this, NotificationsActivity.class));

	}

	public void profile(View v) {
		finish();
		Intent intent=new Intent(this, ProfileActivity.class);
		startActivity(intent);

	}

	public void explore(View v) {
		finish();
		Intent intent = new Intent(this, NewExploreActivity.class);
		if (v == null) {
			intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP
					| Intent.FLAG_ACTIVITY_NEW_TASK);
		}
		startActivity(intent);

	}

	@Override
	protected void onStop() {

		model.stop();
		super.onStop();
	}

	public void disableTab(int viewId) {
		findViewById(viewId).setEnabled(false);
		findViewById(viewId).setBackgroundColor(0xb0370170);
	}

	public void attachEmotion(View v) {

	}

	public void attachVideo(View v) {
		startActivityForResult(new Intent(this, AddVideo.class), PICK_VIDEO_REQ);
	}

	public void attachAudio(View v) {
		startActivityForResult(new Intent(this, AddAudio.class), PICK_AUDIO_REQ);
	}

	public void attachImage(View v) {
		startActivityForResult(new Intent(this, AddImage.class), PICK_IMAGE_REQ);
	}

	public void resetAttachments(View v) {
		util.resetAttachments();
		hideView(R.id.attachments);
		hideView(v);
		showView(R.id.attachImage);
		showView(R.id.attachAudio);
		showView(R.id.attachVideo);
	}

	@Override
	protected void onActivityResult(int requestCode, int resultCode, Intent data) {
		if (resultCode == RESULT_CANCELED)
			return;
		hideView(R.id.attachImage);
		hideView(R.id.attachAudio);
		hideView(R.id.attachVideo);
		showView(R.id.reset);
		super.onActivityResult(requestCode, resultCode, data);
		ImageView attachmentThumbImage = (ImageView) findViewById(R.id.attachmentThumbImage);
		showView(findViewById(R.id.attachments));
		switch (requestCode) {
		case PICK_IMAGE_REQ:
			if (!"".equals(util.getImageThumbPath()))
				attachmentThumbImage.setImageURI(Uri.parse(util
						.getImageThumbPath()));

			break;
		case PICK_VIDEO_REQ:
			if (!"".equals(util.getVideoThumbPath()))
				attachmentThumbImage.setImageURI(Uri.parse(util
						.getVideoThumbPath()));
			break;
		case PICK_AUDIO_REQ:
			attachmentThumbImage.setImageResource(R.drawable.audio_thumb);

			break;
		default:
			break;
		}

	}

	private void disableView(int resId) {
		findViewById(resId).setEnabled(false);
	}

	public void playVideoOrAudio(String url) {
		Intent playAudioIntent = new Intent(Intent.ACTION_VIEW);
		playAudioIntent.setDataAndType(Uri.parse(url), "video/*");

		startActivity(playAudioIntent);
	}

	public void reload() {

	}

	public void hideSoftKeyboard() {
		if (getCurrentFocus() != null) {
			InputMethodManager inputMethodManager = (InputMethodManager) getSystemService(INPUT_METHOD_SERVICE);
			inputMethodManager.hideSoftInputFromWindow(getCurrentFocus()
					.getWindowToken(), 0);
		}
	}

	@Override
	public void onWindowFocusChanged(boolean hasFocus) {
		super.onWindowFocusChanged(hasFocus);
		if (hasFocus)
			hideSoftKeyboard();
	}

	public void setNotificationsAndMessagesCount() {
		if (util.user.getComboUserID() != null
				&& !util.user.getComboUserID().equals(""))
			model.getNotificationsCommentsUnReadCounts(
					util.user.getComboUserID() + "",
					getNotificationsCommentsUnReadCountsListiner);

		// setNotificationsDone = true;
		// try {
		// BadgeView view = (BadgeView) findViewById(R.id.messagesCount);
		// if (model.newMessagesCount > 0) {
		// view.setText("" + model.newMessagesCount);
		// view.show();
		// } else
		// view.hide();
		// view = (BadgeView) findViewById(R.id.notificationsCount);
		// if (model.newNotifacationsCount > 0) {
		// view.setText("" + model.newNotifacationsCount);
		// view.show();
		// } else
		// view.hide();
		// } catch (Exception e) {
		// }
	}

	private RequestListiner getNotificationsCommentsUnReadCountsListiner = new RequestListiner() {

		public void requestDone(Object result) {

			NotificationCommentsUnReadCounter noCommentsUnReadCounter = ((ArrayList<NotificationCommentsUnReadCounter>) result)
					.get(0);
			TextView notifcationTV = (TextView) findViewById(R.id.tv_notifications_counts);

			if (noCommentsUnReadCounter.getTotalNotificationsCount() > 0
					&& notifcationTV != null) {
				notifcationTV.setVisibility(View.VISIBLE);
				notifcationTV.setText(noCommentsUnReadCounter
						.getTotalNotificationsCount() + "");
			} else if (notifcationTV != null)
				notifcationTV.setVisibility(View.GONE);

			setNotificationsAndMessagesCount();
		}

		@Override
		public void requestError(String result) {
			// setNotificationsAndMessagesCount();
		}

		@Override
		public void requestError(int errorResource) {
			// setNotificationsAndMessagesCount();
		}
	};
	private long back_pressed;

	public void showAlert(String message) {
		Builder builder = new Builder(this);
		builder.setMessage(message).show();

	}
@Override
public void onBackPressed() {
	// TODO Auto-generated method stub
	
	 if (back_pressed + 2000 > System.currentTimeMillis()) super.onBackPressed();
     else Toast.makeText(getBaseContext(), "Press once again to exit!", Toast.LENGTH_SHORT).show();
     back_pressed = System.currentTimeMillis();
	
}
}
