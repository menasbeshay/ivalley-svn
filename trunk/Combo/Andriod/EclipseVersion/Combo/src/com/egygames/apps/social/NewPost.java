package com.egygames.apps.social;

import github.ankushsachdeva.emojicon.EmojiconGridView.OnEmojiconClickedListener;
import github.ankushsachdeva.emojicon.EmojiconsPopup;
import github.ankushsachdeva.emojicon.EmojiconsPopup.OnEmojiconBackspaceClickedListener;
import github.ankushsachdeva.emojicon.EmojiconsPopup.OnSoftKeyboardOpenCloseListener;
import github.ankushsachdeva.emojicon.emoji.Emojicon;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.text.SpannableString;
import android.view.KeyEvent;
import android.view.View;
import android.view.inputmethod.InputMethodManager;
import android.widget.ImageView;
import android.widget.PopupWindow.OnDismissListener;

import com.combomobile.R;
import com.egygames.apps.social.entity.Attachment;
import com.egygames.apps.social.entity.Friend;
import com.egygames.apps.social.entity.Post;
import com.egygames.apps.social.entity.PostHashTag;
import com.egygames.apps.social.entity.PostUserTag;
import com.egygames.apps.social.entity.Response;
import com.egygames.apps.social.entity.User;
import com.egygames.apps.social.model.DefaultRequestListiner;
import com.egygames.apps.social.model.RequestListiner;
import com.linkedin.android.spyglass.mentions.MentionSpan;
import com.linkedin.android.spyglass.suggestions.SuggestionsResult;
import com.linkedin.android.spyglass.suggestions.interfaces.SuggestionsResultListener;
import com.linkedin.android.spyglass.tokenization.QueryToken;
import com.linkedin.android.spyglass.tokenization.interfaces.QueryTokenReceiver;
import com.linkedin.android.spyglass.ui.RichEditorView;

public class NewPost extends BaseActivity implements
// ValidationListener,
		RequestListiner, QueryTokenReceiver {

	private static final int IMAGE = 0;
	private static final int AUDIO = 1;
	private static final int VIDEO = 2;

	public static final String MIME_TYPE_IMAGE = "image/*";
	public static final String MIME_TYPE_AUDIO = "audio/*";
	public static final String MIME_TYPE_VIDEO = "video/*";

	private RichEditorView postData;
	// private Validator validator;
	private boolean isUploading[];
	private String contentTypes[], contentPath[];
	private ArrayList<Attachment> attachments;
	private boolean postSent;
	private int currentlyUploading;
	private EmojiconsPopup popup;
	private ImageView emojiButton;

	// ProgressDialog dialog;

	//
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_new_post);
		disableTab(R.id.post);
		setTitle(R.string.post);
		postData = (RichEditorView) findViewById(R.id.etPostText);
		postData.setQueryTokenReceiver(this);

		// validator = new Validator(this);
		// validator.setValidationListener(this);
		isUploading = new boolean[3];
		contentTypes = new String[3];
		contentPath = new String[3];
		contentTypes[IMAGE] = MIME_TYPE_IMAGE;
		contentTypes[AUDIO] = MIME_TYPE_AUDIO;
		contentTypes[VIDEO] = MIME_TYPE_VIDEO;
		currentlyUploading = -1;
		postSent = false;
		attachments = new ArrayList<Attachment>();
		emojiButton = (ImageView) findViewById(R.id.attachEmotion);
		
		popup = new EmojiconsPopup(findViewById(R.id.parent), this);
		popup.setSizeForSoftKeyboard();

		// Set on emojicon click listener
		popup.setOnEmojiconClickedListener(new OnEmojiconClickedListener() {
			@Override
			public void onEmojiconClicked(Emojicon emojicon) {
				postData.getText().append(emojicon.getEmoji());
			}
		});

		// Set on backspace click listener
		popup.setOnEmojiconBackspaceClickedListener(new OnEmojiconBackspaceClickedListener() {
			@Override
			public void onEmojiconBackspaceClicked(View v) {
				KeyEvent event = new KeyEvent(0, 0, 0, KeyEvent.KEYCODE_DEL, 0, 0, 0, 0, KeyEvent.KEYCODE_ENDCALL);
				postData.dispatchKeyEvent(event);
			}
		});

		// If the emoji popup is dismissed, change emojiButton to smiley icon
		popup.setOnDismissListener(new OnDismissListener() {
			@Override
			public void onDismiss() {
				changeEmojiKeyboardIcon(emojiButton, R.drawable.emotion);
			}
		});

		// If the text keyboard closes, also dismiss the emoji popup
		popup.setOnSoftKeyboardOpenCloseListener(new OnSoftKeyboardOpenCloseListener() {

			@Override
			public void onKeyboardOpen(int keyBoardHeight) {

			}

			@Override
			public void onKeyboardClose() {
				if (popup.isShowing())
					popup.dismiss();
			}
		});

		// On emoji clicked, add it to edittext
		popup.setOnEmojiconClickedListener(new OnEmojiconClickedListener() {

			@Override
			public void onEmojiconClicked(Emojicon emojicon) {
				postData.getText().append(emojicon.getEmoji());
			}
		});

		// On backspace clicked, emulate the KEYCODE_DEL key event
		popup.setOnEmojiconBackspaceClickedListener(new OnEmojiconBackspaceClickedListener() {

			@Override
			public void onEmojiconBackspaceClicked(View v) {
				KeyEvent event = new KeyEvent(0, 0, 0, KeyEvent.KEYCODE_DEL, 0, 0, 0, 0, KeyEvent.KEYCODE_ENDCALL);
				postData.dispatchKeyEvent(event);
			}
		});
		//
		// dialog = new ProgressDialog(this);
		// dialog.setProgressStyle(ProgressDialog.STYLE_HORIZONTAL);
		// dialog.setTitle(R.string.uploading);
		// dialog.setCancelable(false);
		
		Intent i=getIntent();
		Bundle extras=i.getExtras();
		if(extras!=null&& extras.containsKey("which")){
			int flag=extras.getInt("which");
			switch(flag){
			case 0:
				findViewById(R.id.attachAudio).setVisibility(View.GONE);
				findViewById(R.id.attachVideo).setVisibility(View.GONE);
				findViewById(R.id.attachImage).setVisibility(View.GONE);
			break;
			case 1:
				
				findViewById(R.id.attachVideo).setVisibility(View.GONE);
				findViewById(R.id.attachImage).setVisibility(View.GONE);
				break;
			case 2:
				findViewById(R.id.attachAudio).setVisibility(View.GONE);
				findViewById(R.id.attachVideo).setVisibility(View.GONE);
				
				break;
			case 3:
				findViewById(R.id.attachAudio).setVisibility(View.GONE);
				
				findViewById(R.id.attachImage).setVisibility(View.GONE);
				break;
			}
		}
	}

	public void addPost(View v) {
		findViewById(R.id.btnPost).setEnabled(false);
		isUploading[0] = isUploading[1] = isUploading[2] = false;

		contentPath[IMAGE] = util.getUploadImagePath();
		contentPath[AUDIO] = util.getUploadAudioPath();
		contentPath[VIDEO] = util.getUploadVideoPath();
		isUploading[IMAGE] = !"".equals(contentPath[IMAGE]);
		isUploading[AUDIO] = !"".equals(contentPath[AUDIO]);
		isUploading[VIDEO] = !"".equals(contentPath[VIDEO]);
		// if (postData.getText().toString().equals("") && !isUploading()) {
		// showError("You have to upload something or enter text");
		// return;
		// }

		if (isUploading()) {
			showProgress();
			for (int i = 0; i < 3; i++)
				if (isUploading[i]) {
					currentlyUploading = i;
					model.upload(this, (i + 1) + "", contentPath[i], contentTypes[i], util.user.getComboUserID(), this);
					// dialog.show();
					break;
				}
		} else {
			if(!(postData.getText().toString().equals("") )|| postData.getText().toString().length()>0)
			{
				showProgress();
				postSent = true;
				sendPost();
			}
			
		}
		util.resetAttachments();
		// validator.validate();
	}

	// @Override
	// public void onValidationFailed(List<ValidationError> errors) {
	// if (errors.size() > 0) {
	// showError(errors.get(0).getCollatedErrorMessage(this));
	// ((EditText)
	// errors.get(0).getView()).setError(errors.get(0).getCollatedErrorMessage(this));
	// }
	//
	// }

	// @Override
	// public void onValidationSucceeded() {
	//
	// }

	private boolean isUploading() {
		return isUploading[0] || isUploading[1] || isUploading[2];

	}

	@Override
	public void requestDone(Object result) {
		// dialog.dismiss();
		findViewById(R.id.btnPost).setEnabled(true);
		if (currentlyUploading != -1) {

			attachments.add(((Response<Attachment>) result).getEntity().get(0));
			if (currentlyUploading < 2) {
				for (int i = currentlyUploading + 1; i < 3; i++) {
					if (isUploading[i]) {
						currentlyUploading = i;
						model.upload(this, (i + 1) + "", contentPath[i], contentTypes[i], util.user.getComboUserID(), this);
						// dialog.show();
						return;
					}
				}
				currentlyUploading = -1;
			}
		}

		if (!postSent) {
			postSent = true;
			currentlyUploading = -1;
			sendPost();
			return;
		}
		util.resetAttachments();
		hideProgress();
		finish();
		explore(null);
	}

	private void sendPost() {
		Post post = new Post();

		List<MentionSpan> mentions = postData.getMentionSpans();
		List<PostUserTag> userTags = new ArrayList<PostUserTag>(mentions.size());

		for (MentionSpan mentionSpan : mentions) {
			PostUserTag userTag = new PostUserTag();
			userTag.setComboUserID(mentionSpan.getMention().getId() + "");
			userTag.setOffset(mentionSpan.getOffset());
			userTag.setUserName(mentionSpan.getMention().getPrimaryText());
			userTags.add(userTag);

		}
		if (attachments != null)
			post.setAttachments(attachments);
		post.setUserTagss(userTags);
		post.setComboUserID(util.user.getComboUserID());
		post.setPostText(postData.getText().toString() + " ");

		SpannableString hashtagintitle = new SpannableString(postData.getText().toString());
		Matcher matcher = Pattern.compile("#([A-Za-z0-9_-]+)").matcher(hashtagintitle);

		List<PostHashTag> hashTags = new ArrayList<PostHashTag>();
		String text = postData.getText().toString();
		while (matcher.find()) {
			PostHashTag hashTag = new PostHashTag();
			hashTag.setOffset(matcher.start());
			hashTag.setTagName(text.substring(matcher.start(), matcher.end()));
			hashTags.add(hashTag);
		}
		post.setHashTags(hashTags);
		model.addNewPost(post, this);
	}

	@Override
	public void requestError(String result) {
		hideProgress();
		showError(result);
		findViewById(R.id.btnPost).setEnabled(true);
	}

	@Override
	public void requestError(int errorResource) {
		hideProgress();
		showError(errorResource);
		findViewById(R.id.btnPost).setEnabled(true);
	}

	@Override
	public void attachEmotion(View v) {

		super.attachEmotion(v);

		if (!popup.isShowing()) {

			// If keyboard is visible, simply show the emoji popup
			if (popup.isKeyBoardOpen()) {
				popup.showAtBottom();
				changeEmojiKeyboardIcon(emojiButton, R.drawable.ic_action_keyboard);
			}

			// else, open the text keyboard first and immediately after that
			// show the emoji popup
			else {
				postData.setFocusableInTouchMode(true);
				postData.requestFocus();
				popup.showAtBottomPending();
				final InputMethodManager inputMethodManager = (InputMethodManager) getSystemService(Context.INPUT_METHOD_SERVICE);
				inputMethodManager.showSoftInput(postData, InputMethodManager.SHOW_IMPLICIT);
				changeEmojiKeyboardIcon(emojiButton, R.drawable.ic_action_keyboard);
			}
		}

		else {
			popup.dismiss();
		}
	}

	private void changeEmojiKeyboardIcon(ImageView iconToBeChanged, int drawableResourceId) {
		iconToBeChanged.setImageResource(drawableResourceId);
	}

	private static final String BUCKET = "friends-memory";
	private RequestListiner suggistoinsListiner = new DefaultRequestListiner() {
		@Override
		public void requestDone(Object result) {
			super.requestDone(result);
			final SuggestionsResultListener listener = postData;

			ArrayList<User> users = (ArrayList<User>) result;
			List<Friend> friends = new ArrayList<Friend>();

			for (int i = 0; i < users.size(); i++) {
				friends.add(new Friend(users.get(i).getComboUserID(), users.get(i).getUserName()));
			}

			SuggestionsResult suggestionsResult = new SuggestionsResult(queryToken, friends);
			listener.onReceiveSuggestionsResult(suggestionsResult, BUCKET);
		}
	};
	private QueryToken queryToken;

	@Override
	public List<String> onQueryReceived(QueryToken queryToken) {
		List<String> buckets = Arrays.asList(BUCKET);
		this.queryToken = queryToken;
		model.searchForTagging(util.user.getComboUserID(), queryToken.getKeywords().toLowerCase(),"-1", 0, suggistoinsListiner);
		return buckets;

	}

}
