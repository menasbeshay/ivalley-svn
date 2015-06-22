package com.egygames.apps.social.views.util;

import java.util.ArrayList;
import java.util.List;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.database.Cursor;
import android.net.Uri;
import android.provider.MediaStore;
import android.widget.ImageView;

import com.combomobile.R;
import com.egygames.apps.social.entity.Attachment;
import com.egygames.apps.social.entity.Notification;
import com.egygames.apps.social.entity.PostHashTag;
import com.egygames.apps.social.entity.PostUserTag;
import com.egygames.apps.social.entity.User;
import com.egygames.apps.social.gcm.GCMUtil;
import com.nostra13.universalimageloader.core.DisplayImageOptions;
import com.nostra13.universalimageloader.core.ImageLoader;
import com.nostra13.universalimageloader.core.listener.ImageLoadingListener;

public class Util {
	public static Util instance;
	public Activity context;
	private SharedPreferences preferences;
	public User user;
	private Editor editor;
	public DisplayImageOptions options;
	public User otherUser;

	private static User setCurrentUser;
	private static List<PostUserTag>  currentPostUserTag;
	private static List<PostHashTag> currentHashTags;
	private static ArrayList<Notification> follownotificationsList;
	private static Attachment attachment; 
	
	
	public static Attachment getAttachment() {
		return attachment;
	}

	public static void setAttachment(Attachment attachment) {
		Util.attachment = attachment;
	}

	private Util(Activity context) {
		this.context = context;
		preferences = context.getSharedPreferences(context.getPackageName(), Activity.MODE_PRIVATE);
		instance = this;
		editor = preferences.edit();
		options = new DisplayImageOptions.Builder().cacheOnDisc(true).cacheInMemory(true).build();
		loadUser();
	}

	private void loadUser() {

		user = new User();
		user.setComboUserID(getserID());
		user.setUserName(preferences.getString("UserName", ""));
		user.setDisplayName(preferences.getString("DisplayName", ""));
		user.setEmail(preferences.getString("Email", ""));
		user.setBio(preferences.getString("Bio", ""));
		user.setProfileImgID(preferences.getString("ProfileImgID", ""));
		user.setCoverImgID(preferences.getString("CoverImgID", ""));
		user.setGenderID(preferences.getInt("GenderID", 0));
		user.setIsActivated(preferences.getBoolean("IsActivated", false));
		user.setExternalIDType(preferences.getString("ExternalIDType", ""));
		user.setExternalID(preferences.getString("ExternalID", ""));
		user.setDeviceID(preferences.getString("DeviceID", ""));
		user.setSecurityWord(preferences.getString("SecurityWord",""));
		user.setBirthDate(preferences.getString("BirthDate",""));

	}

	public static Util getInstance(Activity context) {
		if (instance == null)
			new Util(context);
		return instance;
	}


	public boolean isLogedin() {
		return preferences.getBoolean("logedin", false);

	}

	public void setLogedin(boolean b) {
		editor.putBoolean("logedin", b).commit();

	}

	public void setUserId(String userId) {
		editor.putString("userId", userId).commit();
	}

	private String getserID() {
		return preferences.getString("userId", "");
	}

	public String getGCMRegestrationId() {
		return preferences.getString(GCMUtil.PROPERTY_REG_ID, "");
	}

	public void saveUser(User user) {
		this.user = user;
		setUserId(user.getComboUserID());

		editor.putString("UserName", user.getUserName());
		editor.putString("DisplayName", user.getDisplayName());
		editor.putString("Email", user.getEmail());
		editor.putString("Bio", user.getBio());
		editor.putString("ProfileImgID", user.getProfileImgID());
		editor.putString("CoverImgID", user.getCoverImgID());
		editor.putInt("GenderID", user.getGenderID());
		editor.putBoolean("IsActivated", user.getIsActivated());
		editor.putString("ExternalIDType", user.getExternalIDType());
		editor.putString("ExternalID", user.getExternalID());
		editor.putString("DeviceID", user.getDeviceID());
		editor.putString("SecurityWord", user.getSecurityWord());
		editor.putString("BirthDate", user.getSecurityWord());
		editor.commit();

	}

	public void setUploadVideoPath(String filePathOriginal) {
		editor.putString("VideofilePathOriginal", filePathOriginal).commit();
	}

	public String getUploadVideoPath() {
		return preferences.getString("VideofilePathOriginal", "");
	}

	public void setUploadAudioPath(String filePathOriginal) {
		editor.putString("AudiofilePathOriginal", filePathOriginal).commit();
	}

	public String getUploadAudioPath() {
		return preferences.getString("AudiofilePathOriginal", "");
	}

	public void setVideoThumbPath(String string) {
		editor.putString("VideofilePathThumb", string).commit();
	}

	public String getVideoThumbPath() {
		return preferences.getString("VideofilePathThumb", "");
	}

	public void setUploadImagePath(String filePathOriginal) {
		editor.putString("ImagefilePathOriginal", filePathOriginal).commit();
	}

	public void setImageThumbPath(String string) {
		editor.putString("ImagefilePathThumb", string).commit();
	}

	public String getImageThumbPath() {
		return preferences.getString("ImagefilePathThumb", "");
	}

	public String getUploadImagePath() {
		return preferences.getString("ImagefilePathOriginal", "");
	}

	public void resetAttachments() {
		editor.putString("ImagefilePathThumb", "");
		editor.putString("ImagefilePathOriginal", "");
		editor.putString("VideofilePathThumb", "");
		editor.putString("VideofilePathOriginal", "");
		editor.putString("AudiofilePathThumb", "");
		editor.putString("AudiofilePathOriginal", "");
		editor.commit();

	}

	public String getRealPathFromURI(Context context, Uri contentUri) {
		Cursor cursor = null;
		try {
			String[] proj = { MediaStore.Audio.Media.DATA, MediaStore.Images.Media.DATA };
			cursor = context.getContentResolver().query(contentUri, proj, null, null, null);
			int column_index = cursor.getColumnIndexOrThrow(MediaStore.Images.Media.DATA);
			cursor.moveToFirst();
			return cursor.getString(column_index);
		} catch (Exception ex) {
			return "";
		} finally {
			if (cursor != null) {
				cursor.close();
			}
		}
	}

	public void loadImageByPath(String path, ImageView imageView, ImageLoadingListener animateFirstListener) {
		ImageLoader.getInstance().displayImage(path, imageView, options, animateFirstListener);
		// ImageAware image = new ImageViewAware(imageView, false);
		//
		// ImageLoader.getInstance().cancelDisplayTask(image);
		// image.getWrappedView().clearAnimation();
		// image.setImageDrawable(null);
		//
		// // final ImageSize size =
		// ImageSizeUtils.defineTargetSizeForView(image, null);
		// final ImageSize size = new ImageSize(imageView.getWidth(),
		// imageView.getWidth());
		// final String cacheKey = MemoryCacheUtils.generateKey(path, size);
		// final List<Bitmap> cachedBitmaps =
		// MemoryCacheUtils.findCachedBitmapsForImageUri(cacheKey,
		// ImageLoader.getInstance().getMemoryCache());
		//
		// if (cachedBitmaps.size() > 0) {
		// final Bitmap bitmap = cachedBitmaps.get(0);
		//
		// // Yep, sometimes it is null
		// if (bitmap != null) {
		//
		// image.setImageBitmap(bitmap);
		//
		// return;
		// }
		// }

		// ImageLoader.getInstance().displayImage(path, image, options);

	}

	public String getCountryName(Context context,int i) {

		String[] countries = context.getResources().getStringArray(R.array.countries);
		return countries[i-1];
		
	}
	public String[] getCountriesStrings(Context context){
		String[] allStrings = context.getResources().getStringArray(R.array.countries);
		String[]countries=new String[allStrings.length/3];
		countries[0]="Select a country";
		for (int i = 1; i < countries.length; i++) {
			countries[i]=allStrings[((i-1)*3)+2];
		}
		return countries;
	}

	public static User getSetCurrentUser() {
		return setCurrentUser;
	}

	public static void setSetCurrentUser(User setCurrentUser) {
		Util.setCurrentUser = setCurrentUser;
	}

	public static List<PostUserTag> getCurrentPostUserTag() {
		return currentPostUserTag;
	}

	public static void setCurrentPostUserTag(List<PostUserTag> currentPostUserTag) {
		Util.currentPostUserTag = currentPostUserTag;
	}

	public static List<PostHashTag> getCurrentHashTags() {
		return currentHashTags;
	}

	public static void setCurrentHashTags(List<PostHashTag> currentHashTags) {
		Util.currentHashTags = currentHashTags;
	}

	public static ArrayList<Notification> getFollownotificationsList() {
		return follownotificationsList;
	}

	public static void setFollownotificationsList(
			ArrayList<Notification> follownotificationsList) {
		Util.follownotificationsList = follownotificationsList;
	}

}
