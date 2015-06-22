package com.egygames.apps.social;

import github.ankushsachdeva.emojicon.EmojiconEditText;
import github.ankushsachdeva.emojicon.EmojiconGridView.OnEmojiconClickedListener;
import github.ankushsachdeva.emojicon.EmojiconsPopup;
import github.ankushsachdeva.emojicon.EmojiconsPopup.OnEmojiconBackspaceClickedListener;
import github.ankushsachdeva.emojicon.EmojiconsPopup.OnSoftKeyboardOpenCloseListener;
import github.ankushsachdeva.emojicon.emoji.Emojicon;

import java.util.ArrayList;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.View;
import android.view.inputmethod.InputMethodManager;
import android.widget.ImageView;
import android.widget.PopupWindow.OnDismissListener;
import android.widget.TextView;

import com.combomobile.R;
import com.costum.android.widget.PullToRefreshListView;
import com.costum.android.widget.PullToRefreshListView.OnRefreshListener;
import com.egygames.apps.social.adapter.MessageCommentsListAdapter;
import com.egygames.apps.social.entity.Attachment;
import com.egygames.apps.social.entity.Comment;
import com.egygames.apps.social.entity.Message;
import com.egygames.apps.social.entity.Post;
import com.egygames.apps.social.entity.Response;
import com.egygames.apps.social.model.RequestListiner;
import com.nostra13.universalimageloader.core.ImageLoader;

public class ChatActivity extends BaseActivity implements OnRefreshListener {
	private static final int IMAGE = 0;
	private static final int AUDIO = 1;
	private static final int VIDEO = 2;

	public static final String MIME_TYPE_IMAGE = "image/*";
	public static final String MIME_TYPE_AUDIO = "audio/*";
	public static final String MIME_TYPE_VIDEO = "video/*";
	private EmojiconEditText messageData;

	private int currentPage;
	private PullToRefreshListView feedListView;
	private MessageCommentsListAdapter adapter;
//	private Validator validator;
	private boolean isUploading[];
	private String contentTypes[], contentPath[];
	private ArrayList<Attachment> attachments;
	private boolean messageSent;
	private int currentlyUploading;
	private String friendId;
	private String firstMessageID;
	private EmojiconsPopup popup;
	private ImageView emojiButton;

	// ProgressDialog dialog;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_chat);
		setTitle(R.string.chat);
		feedListView = (PullToRefreshListView) findViewById(R.id.feedsList);
		feedListView.setOnRefreshListener(this);

		adapter = new MessageCommentsListAdapter(this, feedListView);
		feedListView.setAdapter(adapter);
		showProgress();

		currentPage = 0;
		friendId = getIntent().getStringExtra("friendId");
		String friendPic = getIntent().getStringExtra("friendPic");
		String displayName = getIntent().getStringExtra("friendName");
		setText(R.id.userDisplayName, displayName);
		displayProfileImage(R.id.profiel, friendPic);
		model.getMessagesBetweenUsers(util.user.getComboUserID(), friendId, currentPage, messagesListner);
		findViewById(R.id.send).setVisibility(View.VISIBLE);
		messageData = (EmojiconEditText) findViewById(R.id.messageText);
		emojiButton = (ImageView) findViewById(R.id.attachEmotion);
//		validator = new Validator(this);
//		validator.setValidationListener(this);
		isUploading = new boolean[3];
		contentTypes = new String[3];
		contentPath = new String[3];
		contentTypes[IMAGE] = MIME_TYPE_IMAGE;
		contentTypes[AUDIO] = MIME_TYPE_AUDIO;
		contentTypes[VIDEO] = MIME_TYPE_VIDEO;
		currentlyUploading = -1;
		messageSent = false;
		attachments = new ArrayList<Attachment>();
		popup = new EmojiconsPopup(findViewById(R.id.parent), this);
		popup.setSizeForSoftKeyboard();

		popup.setOnEmojiconClickedListener(new OnEmojiconClickedListener() {
			@Override
			public void onEmojiconClicked(Emojicon emojicon) {
				messageData.append(emojicon.getEmoji());
			}
		});
		// Set on backspace click listener
		popup.setOnEmojiconBackspaceClickedListener(new OnEmojiconBackspaceClickedListener() {

			@Override
			public void onEmojiconBackspaceClicked(View v) {
				KeyEvent event = new KeyEvent(0, 0, 0, KeyEvent.KEYCODE_DEL, 0, 0, 0, 0, KeyEvent.KEYCODE_ENDCALL);
				messageData.dispatchKeyEvent(event);
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
				messageData.append(emojicon.getEmoji());
			}
		});

		// On backspace clicked, emulate the KEYCODE_DEL key event
		popup.setOnEmojiconBackspaceClickedListener(new OnEmojiconBackspaceClickedListener() {

			@Override
			public void onEmojiconBackspaceClicked(View v) {
				KeyEvent event = new KeyEvent(0, 0, 0, KeyEvent.KEYCODE_DEL, 0, 0, 0, 0, KeyEvent.KEYCODE_ENDCALL);
				messageData.dispatchKeyEvent(event);
			}
		});

		// dialog = new ProgressDialog(this);
		// dialog.setProgressStyle(ProgressDialog.STYLE_HORIZONTAL);
		// dialog.setTitle(R.string.uploading);
		// dialog.setCancelable(false);
		util.resetAttachments();

	}

	public void openProfile(View view) {
		Intent intent = new Intent(this, ProfileActivity.class);
		intent.putExtra("ID", friendId);
		startActivity(intent);
	}
	private void displayProfileImage(int viewId, String path) {
		if ("".equals(path)) {
			((ImageView) findViewById(viewId)).setImageResource(R.drawable.profile);
			return;
		}
		ImageLoader.getInstance().displayImage("http://www.combomobile.com/comboapi/images.aspx?Image=" + path, ((ImageView) findViewById(viewId)));
	}

	

	public void sendComment(View view) {
		isUploading[0] = isUploading[1] = isUploading[2] = false;
		showProgress();
		contentPath[IMAGE] = util.getUploadImagePath();
		contentPath[AUDIO] = util.getUploadAudioPath();
		contentPath[VIDEO] = util.getUploadVideoPath();
		isUploading[IMAGE] = !"".equals(contentPath[IMAGE]);
		isUploading[AUDIO] = !"".equals(contentPath[AUDIO]);
		isUploading[VIDEO] = !"".equals(contentPath[VIDEO]);

		if (isUploading()) {
			for (int i = 0; i < 3; i++)
				if (isUploading[i]) {
					currentlyUploading = i;
					model.upload(this, (i + 1) + "", contentPath[i], contentTypes[i], util.user.getComboUserID(), addMessageListner);
					// dialog.show();
					break;
				}
		} else {
			messageSent = true;
			sendMessage();
		}
		util.resetAttachments();
	
	}
//
//	@Override
//	public void onValidationFailed(List<ValidationError> errors) {
//		if (errors.size() > 0) {
//			showError(errors.get(0).getCollatedErrorMessage(this));
//			((EditText) errors.get(0).getView()).setError(errors.get(0).getCollatedErrorMessage(this));
//		}
//
//	}

//	@Override
//	public void onValidationSucceeded() {
//		showProgress();
//		contentPath[IMAGE] = util.getUploadImagePath();
//		contentPath[AUDIO] = util.getUploadAudioPath();
//		contentPath[VIDEO] = util.getUploadVideoPath();
//		isUploading[IMAGE] = !"".equals(contentPath[IMAGE]);
//		isUploading[AUDIO] = !"".equals(contentPath[AUDIO]);
//		isUploading[VIDEO] = !"".equals(contentPath[VIDEO]);
//
//		if (isUploading()) {
//			for (int i = 0; i < 3; i++)
//				if (isUploading[i]) {
//					currentlyUploading = i;
//					model.upload(this, (i + 1) + "", contentPath[i], contentTypes[i], util.user.getComboUserID(), addMessageListner);
//					// dialog.show();
//					break;
//				}
//		} else {
//			messageSent = true;
//			sendMessage();
//		}
//		util.resetAttachments();
//	}

	private boolean isUploading() {
		return isUploading[0] || isUploading[1] || isUploading[2];

	}

	public void reload() {
		showProgress();
		model.getMessagesBetweenUsers(util.user.getComboUserID(), friendId, currentPage, messagesListner);
	}

	@Override
	public void onRefresh() {
		if (adapter.getComments().size() < 10) {

			return;
		}
		currentPage++;
		model.getMessagesBetweenUsers(util.user.getComboUserID(), friendId, currentPage, messagesListner);
	}

	private RequestListiner messagesListner = new RequestListiner() {

		@Override
		public void requestDone(Object result) {
			hideProgress();
			ArrayList<Message> messagesObject = ((ArrayList<Message>) result);
			if (messagesObject.size() == 0) {
				if (adapter.getComments().size() == 0) {
					firstMessageID = null;
					showView(findViewById(R.id.noData));
				}


				feedListView.onRefreshComplete();

				return;
			}
			feedListView.setVisibility(View.VISIBLE);
			Message message = messagesObject.get(0);
			firstMessageID = message.getComboMsgID();
			ArrayList<Comment> messages = (ArrayList<Comment>) message.getComments();

			if (currentPage == 0) {
				adapter.reset();
				Comment comment = new Comment();
				comment.setCommentDate(message.getMsgDate());
				comment.setComboCommentID(message.getComboMsgID());
				comment.setComboUserID(message.getComboUserID());
				comment.setCommentText(message.getMsgText());
				comment.setAttachments(message.getAttachments());
				comment.setComboUserName(message.getComboUserName());
				comment.setProfilePic(message.getProfilePic());
				comment.setCommentText(message.getMsgText());
				adapter.addComment(comment);

			}
			adapter.addComments(messages);
			if (adapter.getComments().size() == 0)
				showView(findViewById(R.id.noData));
			else
				hideView(findViewById(R.id.noData));
			feedListView.onRefreshComplete();
			adapter.notifyDataSetChanged();
			if (currentPage == 0)
				feedListView.setSelection(adapter.getCount() - 1);
	
			
		}

		@Override
		public void requestError(String result) {
			hideProgress();
			showError(result);
		}

		@Override
		public void requestError(int errorResource) {
			hideProgress();
			showError(errorResource);
		}

	};

	private RequestListiner addMessageListner = new RequestListiner() {

		@Override
		public void requestDone(Object result) {
			// dialog.dismiss();
			if (currentlyUploading != -1) {

				attachments.add(((Response<Attachment>) result).getEntity().get(0));
				if (currentlyUploading < 2) {
					for (int i = currentlyUploading + 1; i < 3; i++) {
						if (isUploading[i]) {
							currentlyUploading = i;
							model.upload(ChatActivity.this, (i + 1) + "", contentPath[i], contentTypes[i], util.user.getComboUserID(), this);
							// dialog.show();
							return;
						}
					}
					currentlyUploading = -1;
				}
			}

			if (!messageSent) {
				messageSent = true;
				currentlyUploading = -1;
				sendMessage();
				return;
			}
			util.resetAttachments();
			hideProgress();
			currentPage = 0;
			reload();
		}

		@Override
		public void requestError(String result) {
			hideProgress();
//			showError(result);
		}

		@Override
		public void requestError(int errorResource) {
			hideProgress();
//			showError(errorResource);
		}

	};

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
				messageData.setFocusableInTouchMode(true);
				messageData.requestFocus();
				popup.showAtBottomPending();
				final InputMethodManager inputMethodManager = (InputMethodManager) getSystemService(Context.INPUT_METHOD_SERVICE);
				inputMethodManager.showSoftInput(messageData, InputMethodManager.SHOW_IMPLICIT);
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

	private void sendMessage() {
		if (firstMessageID == null)
			model.addMessage(util.user.getComboUserID(), friendId, messageData.getText().toString(), attachments, addMessageListner);
		else
			model.addMessageComment(util.user.getComboUserID(), firstMessageID, messageData.getText().toString(), attachments, addMessageListner);
		addMessageToList();
	}

	private void addMessageToList() {
		Comment comment = new Comment();
		comment.setCommentDate(System.currentTimeMillis());
		comment.setCommentText(messageData.getText().toString());
//		comment.setIsLocal(true);
		comment.setComboUserID(util.user.getComboUserID());
		messageData.setText("");
		adapter.addComment(comment);

	}
}
