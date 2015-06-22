package com.egygames.apps.social.model.upload;

import java.io.IOException;
import java.net.MalformedURLException;

import org.codehaus.jackson.JsonFactory;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.JsonParser;
import org.codehaus.jackson.map.DeserializationConfig;
import org.codehaus.jackson.map.DeserializationConfig.Feature;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.map.annotate.JsonSerialize.Inclusion;

import android.app.ProgressDialog;
import android.util.Log;

import com.alexbbb.uploadservice.AbstractUploadServiceReceiver;
import com.alexbbb.uploadservice.UploadRequest;
import com.alexbbb.uploadservice.UploadService;
import com.combomobile.R;
import com.egygames.apps.social.BaseActivity;
import com.egygames.apps.social.entity.Attachment;
import com.egygames.apps.social.entity.Response;
import com.egygames.apps.social.entity.Subclass;
import com.egygames.apps.social.model.RequestListiner;

public class UploadReceiver extends AbstractUploadServiceReceiver {

	private static ProgressDialog dialog;

	// private ProgressDialog progressBar;
	private BaseActivity activity;

	private RequestListiner listener;

	private static final String SERVER_URL = "http://combomobile.com/ComboAPI/FileUploader.ashx";

	public static void upload(final BaseActivity context, String uploadId, String fileParameter, String filePath, String fileName, String contentType, String userId, RequestListiner listener) {
		final UploadRequest request = new UploadRequest(context, uploadId, SERVER_URL);
		UploadReceiver.dialog = new ProgressDialog(context);
		dialog.setProgressStyle(ProgressDialog.STYLE_HORIZONTAL);
		dialog.setTitle(R.string.uploading);
		dialog.setCancelable(false);
		dialog.show();
		request.addFileToUpload(filePath, fileParameter, fileName, contentType);
		request.addParameter("UserId", userId);
		request.addParameter("Type", uploadId);
		request.setNotificationConfig(android.R.drawable.ic_menu_upload, context.getString(R.string.app_name), context.getString(R.string.uploading), context.getString(R.string.uploading), context.getString(R.string.uploading), true);
		try {
			UploadService.startUpload(request);
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
			return;
		} catch (MalformedURLException e) {
			e.printStackTrace();
			return;
		}
		// new UploadReceiver(progressBar, context);

		new UploadReceiver(context, listener);
	}

	public static void upload(final BaseActivity context, String uploadId, boolean isProfile, String fileParameter, String filePath, String fileName, String contentType, String userId, RequestListiner listener) {
		final UploadRequest request = new UploadRequest(context, uploadId, SERVER_URL);
		UploadReceiver.dialog = new ProgressDialog(context);
		dialog.setProgressStyle(ProgressDialog.STYLE_HORIZONTAL);
		dialog.setTitle(R.string.uploading);
		dialog.setCancelable(false);
		dialog.show();
		request.addFileToUpload(filePath, fileParameter, fileName, contentType);
		request.addParameter("UserId", userId);
		request.addParameter("Type", uploadId);
		if (isProfile)
			request.addParameter("IsProfile", isProfile + "");
		else
			request.addParameter("IsCover", true + "");
		request.setNotificationConfig(android.R.drawable.ic_menu_upload, context.getString(R.string.app_name), context.getString(R.string.uploading), context.getString(R.string.uploading), context.getString(R.string.uploading), true);
		try {
			UploadService.startUpload(request);
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
			return;
		} catch (MalformedURLException e) {
			e.printStackTrace();
			return;
		}
		// new UploadReceiver(progressBar, context);

		new UploadReceiver(context, listener);
	}

	public UploadReceiver(BaseActivity context, RequestListiner listener) {
		// this.progressBar = progressBar;
		this.activity = context;
		this.listener = listener;
		register(activity);
	}

	public UploadReceiver(BaseActivity context) {
		// this.progressBar = progressBar;
		this.activity = context;
		register(activity);
	}

	private static final String TAG = "AndroidUploadService";

	@Override
	public void onProgress(String uploadId, int progress) {
		dialog.setProgress(progress);
		// progressBar.setProgress(progress);
	}

	@Override
	public void onError(String uploadId, Exception exception) {
		Log.e(TAG, "Error in upload with ID: " + uploadId + ". " + exception.getLocalizedMessage(), exception);
		// activity.showError(exception.getLocalizedMessage());
		listener.requestError(exception.getLocalizedMessage());
		unregister(activity);
	}

	public  ObjectMapper objectMapper = null;
	public  JsonFactory jsonFactory = null;
	public  JsonParser jp = null;

	@Override
	public void onCompleted(String uploadId, int serverResponseCode, String serverResponseMessage) {
		try {
			
			objectMapper = new ObjectMapper();
			objectMapper.configure(Feature.FAIL_ON_UNKNOWN_PROPERTIES, false);
			objectMapper.configure(DeserializationConfig.Feature.FAIL_ON_UNKNOWN_PROPERTIES, false);
			objectMapper.configure(DeserializationConfig.Feature.FAIL_ON_NULL_FOR_PRIMITIVES, false);
			objectMapper.setSerializationInclusion(Inclusion.NON_EMPTY);
			// objectMapper.configure(JsonParser.Feature., true);
			jsonFactory = new JsonFactory();
			jp = jsonFactory.createJsonParser(serverResponseMessage);
			Response<Attachment> networkResponse = objectMapper.readValue(jp, new Subclass<Response<Attachment>>() {
			});
			// networkResponse.setUploadId(uploadId);
			listener.requestDone(networkResponse);
			dialog.dismiss();
		} catch (JsonParseException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		unregister(activity);
	}
}
