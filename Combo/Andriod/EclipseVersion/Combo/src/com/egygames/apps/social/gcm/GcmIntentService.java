package com.egygames.apps.social.gcm;

import java.io.IOException;

import org.codehaus.jackson.JsonParseException;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import android.app.IntentService;
import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.SystemClock;
import android.support.v4.app.NotificationCompat;
import android.util.Log;
import android.view.View;
import android.widget.ImageView;

import com.combomobile.R;
import com.egygames.apps.social.ChatActivity;
import com.egygames.apps.social.MainActivity;
import com.egygames.apps.social.PostActivity;
import com.egygames.apps.social.ProfileActivity;
import com.egygames.apps.social.UserLevelActivity;
import com.egygames.apps.social.entity.NotificationTexts;
import com.egygames.apps.social.entity.Response;
import com.egygames.apps.social.model.NetworkHandler;
import com.egygames.apps.social.views.util.Util;
import com.google.android.gms.gcm.GoogleCloudMessaging;

public class GcmIntentService extends IntentService {
	public static final int NOTIFICATION_ID = 1;
	private static final String TAG = "GCM";
	private NotificationManager mNotificationManager;
	NotificationCompat.Builder builder;

	public GcmIntentService() {
		super("GcmIntentService");
	}

	@Override
	protected void onHandleIntent(Intent intent) {
		Bundle extras = intent.getExtras();
		GoogleCloudMessaging gcm = GoogleCloudMessaging.getInstance(this);
		// The getMessageType() intent parameter must be the intent you received
		// in your BroadcastReceiver.
		String messageType = gcm.getMessageType(intent);

		if (!extras.isEmpty()) { // has effect of unparcelling Bundle
			/*
			 * Filter messages based on message type. Since it is likely that
			 * GCM will be extended in the future with new message types, just
			 * ignore any message types you're not interested in, or that you
			 * don't recognize.
			 */
			if (GoogleCloudMessaging.MESSAGE_TYPE_SEND_ERROR.equals(messageType)) {
				//sendNotification("Send error: " + extras.toString());
			} else if (GoogleCloudMessaging.MESSAGE_TYPE_DELETED.equals(messageType)) {
				//sendNotification("Deleted messages on server: " + extras.toString());
				// If it's a regular GCM message, do some work.
			} else if (GoogleCloudMessaging.MESSAGE_TYPE_MESSAGE.equals(messageType)) {
				// This loop represents the service doing some work.
				for (int i = 0; i < 5; i++) {
					Log.i(TAG, "Working... " + (i + 1) + "/5 @ " + SystemClock.elapsedRealtime());
					try {
						Thread.sleep(5000);
					} catch (InterruptedException e) {
					}
				}
				Log.i(TAG, "Completed work @ " + SystemClock.elapsedRealtime());
				// Post notification of received message.
				sendNotification("Received: " + extras.toString(),extras);
				Log.i(TAG, "Received: " + extras.toString());
			}
		}
		// Release the wake lock provided by the WakefulBroadcastReceiver.
		GcmBroadcastReceiver.completeWakefulIntent(intent);
	}

	// Put the message into a notification and post it.
	// This is just one simple example of what you might choose to do with
	// a GCM message.
	private void sendNotification(String msg,Bundle extras) {
		String message="";
		boolean notFound=false;
		int icon = R.drawable.ic_launcher;
		try {
			Response<com.egygames.apps.social.entity.Notification> net = NetworkHandler.parseNotifications(extras.getString("message"));
			
			switch (net.getEntity().get(0).getNotificationTypeEnum()) {
			case LIKE:
				icon=R.drawable.liked_icon;
				message=NotificationTexts.getLikeText(net.getEntity().get(0));
				break;
			case COMMENT_ON_POST:
				icon=R.drawable.comment_type;
				message=NotificationTexts.getCommentText(net.getEntity().get(0));
				break;

			/*case ADD_FRIEND:
				message=NotificationTexts.getAddFriendText(net.getEntity().get(0));
				break;

			case RECEIVE_MSG:
				message=NotificationTexts.getMessageText(net.getEntity().get(0));
				break;*/

			case SHARE_POST:
				icon=R.drawable.share_type;
				message=NotificationTexts.getShareText(net.getEntity().get(0));
				break;
			case FOLLOW_FRIEND:
				icon=R.drawable.friend_add_typr;
				message=NotificationTexts.getFollowFriendText(net.getEntity().get(0));
				break;
			case ACCEPT_FOLLOW_REQUEST:
				icon=R.drawable.friend_add_typr;
				message=NotificationTexts.getAcceptFollowFriendText(net.getEntity().get(0));
				break;
			case BIRTHDAY:
				message=NotificationTexts.getBirthdayText(net.getEntity().get(0));
				break;
			case RANK:
				icon=R.drawable.level_type;
				message=NotificationTexts.getRankText(net.getEntity().get(0));
				break;
			case MENTION:
				icon=R.drawable.comment_type;
				message=NotificationTexts.getMentionText(net.getEntity().get(0));
				break;
			default:
				notFound=true;break;
					
			/*case UNFOLLOW_FRIEND:
				message=NotificationTexts.getUnFollowFriendText(net.getEntity().get(0));
				break;
			case LIKE_PROFILE:
				message=NotificationTexts.getLikeProfileText(net.getEntity().get(0));
				break;
			case UNLIKE_PROFILE:
				message=NotificationTexts.getUnLikeProfileText(net.getEntity().get(0));
				break;
			case COMMENT_ON_MESSAGE:
				message=NotificationTexts.getCommentOnMessageText(net.getEntity().get(0));
				//notificationType.setImageResource(R.drawable.message_type);
				break;*/
			}
			
			if(!notFound)
			{
				long when = System.currentTimeMillis();
		        NotificationManager notificationManager = (NotificationManager)
		                this.getSystemService(Context.NOTIFICATION_SERVICE);
		        Notification notification = new Notification(icon, message, when);
		        String title = this.getString(R.string.app_name);
		        Intent notificationIntent=null;
		        switch (net.getEntity().get(0).getNotificationTypeEnum()) {
		        case LIKE:
				case COMMENT_ON_POST:
				case SHARE_POST:
				case MENTION:
				//case COMMENT_ON_MESSAGE:
					notificationIntent = new Intent(this, PostActivity.class);
					notificationIntent.putExtra("postId", net.getEntity().get(0).getTag());
					break;
				//case ADD_FRIEND:
				case FOLLOW_FRIEND:
				case ACCEPT_FOLLOW_REQUEST:
				case BIRTHDAY:
				//case UNFRIEND:
				//case ACCEPT_FRIEND:
				//case LIKE_PROFILE:
				//case UNLIKE_PROFILE:
				//case UNFOLLOW_FRIEND:
					notificationIntent = new Intent(this, ProfileActivity.class);
					notificationIntent.putExtra("ID", net.getEntity().get(0).getTag());
					break;
				case RANK:
					Intent intent = new Intent(this, ProfileActivity.class);
					startActivity(intent);
				/*case RECEIVE_MSG:
					String[] ids = net.getEntity().get(0).getTag().split(",");
					notificationIntent = new Intent(this, ChatActivity.class);
					notificationIntent.putExtra("friendId", ids[0]);
					notificationIntent.putExtra("friendPic", ids[1]);
					notificationIntent.putExtra("friendName", ids[2]);
					break;*/
					default:
						notificationIntent = new Intent(this, MainActivity.class);
						break;

				}
		        
		        // set intent so it does not start a new activity
		        notificationIntent.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP |
		                Intent.FLAG_ACTIVITY_SINGLE_TOP);
		        PendingIntent intent =
		                PendingIntent.getActivity(this, 0, notificationIntent, PendingIntent.FLAG_UPDATE_CURRENT);
		        notification.setLatestEventInfo(this, title, message, intent);
		        notification.flags |= Notification.FLAG_AUTO_CANCEL;
		        
		        // Play default notification sound
		        notification.defaults |= Notification.DEFAULT_SOUND;
		        
		        // Vibrate if vibrate is enabled
		        notification.defaults |= Notification.DEFAULT_VIBRATE;
		        
		        notificationManager.notify(0, notification);
			}
		        
		} catch (JsonParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
//		mNotificationManager = (NotificationManager) this.getSystemService(Context.NOTIFICATION_SERVICE);
//		PendingIntent contentIntent = PendingIntent.getActivity(this, 0, new Intent(this, MainActivity.class), 0);
//		NotificationCompat.Builder mBuilder = new NotificationCompat.Builder(this).setSmallIcon(R.drawable.ic_launcher).setContentTitle("GCM Notification").setStyle(new NotificationCompat.BigTextStyle().bigText(msg)).setContentText(msg);
//		mBuilder.setContentIntent(contentIntent);
//		mNotificationManager.notify(NOTIFICATION_ID, mBuilder.build());
	}
	
}