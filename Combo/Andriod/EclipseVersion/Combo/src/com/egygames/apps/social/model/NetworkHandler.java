package com.egygames.apps.social.model;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.List;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.codehaus.jackson.JsonFactory;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.JsonParser;
import org.codehaus.jackson.map.DeserializationConfig;
import org.codehaus.jackson.map.DeserializationConfig.Feature;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.map.annotate.JsonSerialize.Inclusion;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Handler;
import android.util.Log;

import com.egygames.apps.social.entity.Message;
import com.egygames.apps.social.entity.Notification;
import com.egygames.apps.social.entity.NotificationCommentsUnReadCounter;
import com.egygames.apps.social.entity.Post;
import com.egygames.apps.social.entity.Response;
import com.egygames.apps.social.entity.Subclass;
import com.egygames.apps.social.entity.User;
import com.egygames.apps.social.model.NetworkListener.Errors;
import com.egygames.apps.social.views.util.Util;

public class NetworkHandler<T> extends Thread {
	private List<NameValuePair> nameValuePairs;
	private String path;
	private HttpResponse response;
	private NetworkListener listenr;
	public ObjectMapper objectMapper = null;
	public JsonFactory jsonFactory = null;
	public JsonParser jp = null;
	private Response<T> networkResponse = null;
	private RequestListiner listenerToBeNotified;
	private boolean sendingJsonRequest;
	private Object objectTobeSent;
	private String objectName;
	private T t;
	private Handler handler;
//http://combomobile.com/ComboAPI/combo.asmx/
	//"http://combomobile.com.stevenm3.arvixevps.com/comboapi/combo.asmx"
	protected static final String SERVER_URL = "http://combomobile.com.stevenm3.arvixevps.com/comboapi/combo.asmx/";

	public NetworkHandler(T t, String path, List<NameValuePair> nameValuePairs, NetworkListener listenr, RequestListiner listenerToBeNotified) {
		this.t = t;
		if (!isOnline())
			listenr.responseError(Errors.NETWORK_ERROR, listenerToBeNotified);
		this.nameValuePairs = nameValuePairs;
		this.path = path;
		this.listenr = listenr;
		this.listenerToBeNotified = listenerToBeNotified;
		sendingJsonRequest = false;
		handler = new Handler();
		start();
		// AsyncTaskExecutor.executeConcurrently(this);
	}

	public NetworkHandler(String path, Object objectTobeSent, String objectName, NetworkListener listenr, RequestListiner listenerToBeNotified) {
		this.t = (T) objectTobeSent;
		if (!isOnline())
			listenr.responseError(Errors.NETWORK_ERROR, listenerToBeNotified);
		sendingJsonRequest = true;
		this.path = path;
		this.listenr = listenr;
		this.listenerToBeNotified = listenerToBeNotified;
		this.objectTobeSent = objectTobeSent;
		this.objectName = objectName;
		// AsyncTaskExecutor.executeConcurrently(this);
		handler = new Handler();
		start();
	}

	// static {
	// objectMapper = new ObjectMapper();
	// objectMapper.configure(Feature.FAIL_ON_UNKNOWN_PROPERTIES, false);
	// objectMapper.configure(DeserializationConfig.Feature.FAIL_ON_UNKNOWN_PROPERTIES,
	// false);
	// objectMapper.configure(DeserializationConfig.Feature.FAIL_ON_NULL_FOR_PRIMITIVES,
	// false);
	// objectMapper.setSerializationInclusion(Inclusion.NON_EMPTY);
	// // objectMapper.configure(JsonParser.Feature., true);
	// jsonFactory = new JsonFactory();
	// }

	private static boolean isOnline() {
		final ConnectivityManager conMgr = (ConnectivityManager) Util.instance.context.getSystemService(Context.CONNECTIVITY_SERVICE);
		final NetworkInfo activeNetwork = conMgr.getActiveNetworkInfo();
		return (activeNetwork != null && activeNetwork.isConnected());

	}

	@Override
	public void run() {
		objectMapper = new ObjectMapper();
		objectMapper.configure(Feature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		objectMapper.configure(DeserializationConfig.Feature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		objectMapper.configure(DeserializationConfig.Feature.FAIL_ON_NULL_FOR_PRIMITIVES, false);
		objectMapper.setSerializationInclusion(Inclusion.NON_EMPTY);
		// objectMapper.configure(JsonParser.Feature., true);
		jsonFactory = new JsonFactory();
	
		HttpClient httpclient = new DefaultHttpClient();
		HttpPost httppost = new HttpPost(SERVER_URL + path);
		Log.d("url", SERVER_URL + path);

		try {
			if (sendingJsonRequest) {
				httppost.setHeader("Content-Type", "application/json; charset=utf-8");
				String json = convertObjectJson();
				StringEntity entity = new StringEntity(json, "UTF-8");
				httppost.setEntity(entity);
			} else
				httppost.setEntity(new UrlEncodedFormEntity(nameValuePairs));
			
			response = httpclient.execute(httppost);
			InputStream inputStream = response.getEntity().getContent();
			InputStreamReader inputStreamReader = new InputStreamReader(inputStream);
			BufferedReader bufferedReader = new BufferedReader(inputStreamReader);
			StringBuilder stringBuilderResult = new StringBuilder();
			String bufferedStrChunk = null;
			while ((bufferedStrChunk = bufferedReader.readLine()) != null) {
				stringBuilderResult.append(bufferedStrChunk);
			}
			Log.d("net", stringBuilderResult.toString());
			parse(stringBuilderResult.toString());
		} catch (Exception e) {
			System.out.println(e);

		}
		onPostExecute();
	}

	protected void onPostExecute() {
		handler.post(new Runnable() {

			@Override
			public void run() {
				if (networkResponse == null)
					listenr.responseError(Errors.GENERAL_ERROR, listenerToBeNotified);
				else
					listenr.responseReady(networkResponse, listenerToBeNotified);

			}
		});

	}

	public Response<T> parse(String json) throws JsonParseException, IOException {
		jp = jsonFactory.createJsonParser(json);

		if (t instanceof User) {
			Log.d("type", "User");
			networkResponse = (Response<T>) objectMapper.readValue(jp, new Subclass<Response<User>>() {
			});
			if(networkResponse==null){
				Log.d("user", "networkResponse null");
			}
		} else if (t instanceof Post) {
			Log.d("type", "Post");
			networkResponse = (Response<T>) objectMapper.readValue(jp, new Subclass<Response<Post>>() {
			
			
			});
			if(networkResponse==null){
				Log.d("post", "networkResponse null");
			}
		} else if (t instanceof Message) {
			Log.d("type", "Message");
			networkResponse = (Response<T>) objectMapper.readValue(jp, new Subclass<Response<Message>>() {
			});
			if(networkResponse==null){
				Log.d("Message", "networkResponse null");
			}
		} else if (t instanceof Notification) {
			Log.d("type", "notification");
			networkResponse = (Response<T>) objectMapper.readValue(jp, new Subclass<Response<Notification>>() {
			});
		}
		else if (t instanceof NotificationCommentsUnReadCounter) {
			Log.d("type", "NotificationCommentsUnReadCounter");
			String newJson=json.replace("'TotalNotificationsCount'", "\"TotalNotificationsCount\"").
					replace("'TotalMsgCommentsCount'", "\"TotalMsgCommentsCount\"")
					.replace("\"[", "[").replace("]\"", "]");
			Log.d("type", newJson);
			jp = jsonFactory.createJsonParser(newJson);
			networkResponse = (Response<T>) objectMapper.readValue(jp, new Subclass<Response<NotificationCommentsUnReadCounter>>() {
			});
		}
		else
			Log.d("type", "unknown");
		networkResponse = (Response<T>) objectMapper.readValue(jp, new Subclass<Response<T>>() {
		});
		return networkResponse;
	}

	public String convertObjectJson() {
		try {
			return "{\"" + objectName + "\":" + objectMapper.writeValueAsString(objectTobeSent) + "}";
		} catch (JsonGenerationException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "";

	}
	
	public static Response<Notification> parseNotifications(String json) throws JsonParseException, IOException {
		Log.d("Combo", "Combo:"+json);
		String newStr="";//json.replaceFirst("[{", "{\"Entity\":[{");
		newStr="{\"" +"Entity"+ "\":"+json+"}";
		json=newStr;
		Log.d("Combo", "Combo:"+json);
		JsonFactory jsonFactory2 = new JsonFactory();
		ObjectMapper objectMapper2 = new ObjectMapper();
		objectMapper2.configure(Feature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		objectMapper2.configure(DeserializationConfig.Feature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		objectMapper2.configure(DeserializationConfig.Feature.FAIL_ON_NULL_FOR_PRIMITIVES, false);
		objectMapper2.setSerializationInclusion(Inclusion.NON_EMPTY);
		JsonParser jp2 = null;
		jp2 = jsonFactory2.createJsonParser(json);
		Response<Notification> networkResponse = null;
		networkResponse = (Response<Notification>) objectMapper2.readValue(jp2, new Subclass<Response<Notification>>() {});
		return networkResponse;
	}


}
