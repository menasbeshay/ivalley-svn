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
import android.os.Bundle;
import android.text.SpannableString;
import android.util.Log;
import android.view.KeyEvent;
import android.view.View;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.PopupWindow.OnDismissListener;

import com.combomobile.R;
import com.egygames.apps.social.adapter.CommentsListAdapter;
import com.egygames.apps.social.entity.Attachment;
import com.egygames.apps.social.entity.Comment;
import com.egygames.apps.social.entity.Friend;
import com.egygames.apps.social.entity.Post;
import com.egygames.apps.social.entity.PostHashTag;
import com.egygames.apps.social.entity.PostUserTag;
import com.egygames.apps.social.entity.Response;
import com.egygames.apps.social.entity.User;
import com.egygames.apps.social.model.DefaultRequestListiner;
import com.egygames.apps.social.model.RequestListiner;
import com.handmark.pulltorefresh.library.PullToRefreshBase.Mode;
import com.handmark.pulltorefresh.library.PullToRefreshBase.OnRefreshListener2;
import com.handmark.pulltorefresh.library.PullToRefreshBase;
import com.handmark.pulltorefresh.library.PullToRefreshListView;
import com.linkedin.android.spyglass.mentions.MentionSpan;
import com.linkedin.android.spyglass.suggestions.SuggestionsResult;
import com.linkedin.android.spyglass.suggestions.interfaces.SuggestionsResultListener;
import com.linkedin.android.spyglass.tokenization.QueryToken;
import com.linkedin.android.spyglass.tokenization.interfaces.QueryTokenReceiver;
import com.linkedin.android.spyglass.ui.RichEditorView;
import com.mobsandgeeks.saripaar.ValidationError;
import com.mobsandgeeks.saripaar.Validator;
import com.mobsandgeeks.saripaar.Validator.ValidationListener;
import com.mobsandgeeks.saripaar.annotation.NotEmpty;

public class CommentsActivity extends BaseActivity implements ValidationListener, QueryTokenReceiver {
	private static final int IMAGE = 0;
	private static final int AUDIO = 1;
	private static final int VIDEO = 2;

	public static final String MIME_TYPE_IMAGE = "image/*";
	public static final String MIME_TYPE_AUDIO = "audio/*";
	public static final String MIME_TYPE_VIDEO = "video/*";
	@NotEmpty(messageResId = R.string.emptyCommentError)
	// @Size(max = 350, messageResId = R.string.sizePostError)
	private RichEditorView commentData;

	private int currentPage;
	//private PullToRefreshListView feedListView;
	private CommentsListAdapter adapter;
	private Validator validator;
	private boolean isUploading[];
	private String contentTypes[], contentPath[];
	private ArrayList<Attachment> attachments;
	private boolean commentSent;
	private int currentlyUploading;
	private String postId;
	private PullToRefreshListView mPullRefreshListView;

	private EmojiconsPopup popup;
	private ImageView emojiButton;

	// ProgressDialog dialog;

	@SuppressWarnings("unchecked")
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_comments);
		postId = getIntent().getExtras().getString("PostId");
		setTitle(R.string.comments);
		
		
		mPullRefreshListView = (PullToRefreshListView) findViewById(R.id.feedsList);
		//feedListView = (PullToRefreshListView) findViewById(R.id.feedsList);
		//feedListView.setOnRefreshListener(this);
		  mPullRefreshListView.setMode(Mode.BOTH);
		  adapter = new CommentsListAdapter(this, mPullRefreshListView);
		  mPullRefreshListView.setAdapter(adapter);
		
		//feedListView.setAdapter(adapter);

		
		  mPullRefreshListView.setOnRefreshListener(new OnRefreshListener2() {

				@Override
				public void onPullDownToRefresh(PullToRefreshBase refreshView) {
					currentPage=0;
					model.getPostByID(postId, currentPage, commentsListner);
				}

				@Override
				public void onPullUpToRefresh(PullToRefreshBase refreshView) {
					currentPage++;
					model.getPostByID(postId, currentPage, commentsListner);
				}
			});
		findViewById(R.id.attachImage).setVisibility(View.GONE);
		findViewById(R.id.attachVideo).setVisibility(View.GONE);
		
		currentPage = 0;
		showProgress();
		model.getPostByID(postId, currentPage, commentsListner);
		findViewById(R.id.send).setVisibility(View.VISIBLE);

		commentData = (RichEditorView) findViewById(R.id.commentText);
		commentData.setQueryTokenReceiver(this);
		commentData.setEditTextShouldWrapContent(true);
		emojiButton = (ImageView) findViewById(R.id.attachEmotion);
		validator = new Validator(this);
		validator.setValidationListener(this);
		isUploading = new boolean[3];
		contentTypes = new String[3];
		contentPath = new String[3];
		contentTypes[IMAGE] = MIME_TYPE_IMAGE;
		contentTypes[AUDIO] = MIME_TYPE_AUDIO;
		contentTypes[VIDEO] = MIME_TYPE_VIDEO;
		currentlyUploading = -1;
		commentSent = false;
		attachments = new ArrayList<Attachment>();

		popup = new EmojiconsPopup(findViewById(R.id.parent), this);
		popup.setSizeForSoftKeyboard();

		// Set on emojicon click listener
		popup.setOnEmojiconClickedListener(new OnEmojiconClickedListener() {

			@Override
			public void onEmojiconClicked(Emojicon emojicon) {
				commentData.getText().append(emojicon.getEmoji());
			}
		});

		// Set on backspace click listener
		popup.setOnEmojiconBackspaceClickedListener(new OnEmojiconBackspaceClickedListener() {

			@Override
			public void onEmojiconBackspaceClicked(View v) {
				KeyEvent event = new KeyEvent(0, 0, 0, KeyEvent.KEYCODE_DEL, 0, 0, 0, 0, KeyEvent.KEYCODE_ENDCALL);
				commentData.dispatchKeyEvent(event);
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
				commentData.getText().append(emojicon.getEmoji());
			}
		});

		// On backspace clicked, emulate the KEYCODE_DEL key event
		popup.setOnEmojiconBackspaceClickedListener(new OnEmojiconBackspaceClickedListener() {

			@Override
			public void onEmojiconBackspaceClicked(View v) {
				KeyEvent event = new KeyEvent(0, 0, 0, KeyEvent.KEYCODE_DEL, 0, 0, 0, 0, KeyEvent.KEYCODE_ENDCALL);
				commentData.dispatchKeyEvent(event);
			}
		});

		// dialog = new ProgressDialog(this);
		// dialog.setProgressStyle(ProgressDialog.STYLE_HORIZONTAL);
		// dialog.setTitle(R.string.uploading);
		// dialog.setCancelable(false);

	}

	public void sendComment(View view) {
		isUploading[0] = isUploading[1] = isUploading[2] = false;
		// validator.validate();
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
					model.upload(this, (i + 1) + "", contentPath[i], contentTypes[i], util.user.getComboUserID(), addCommentListner);
					// dialog.show();
					break;
				}
		} else {
			commentSent = true;
			sendComment();
		}
		util.resetAttachments();
	}

	private void sendComment() {
		Comment post = new Comment();
		post.setComboPostID(postId);
		List<MentionSpan> mentions = commentData.getMentionSpans();
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
		post.setCommentText(commentData.getText().toString() + " ");

		SpannableString hashtagintitle = new SpannableString(commentData.getText().toString());
		Matcher matcher = Pattern.compile("#([A-Za-z0-9_-]+)").matcher(hashtagintitle);

		List<PostHashTag> hashTags = new ArrayList<PostHashTag>();
		String text = commentData.getText().toString();
		while (matcher.find()) {
			PostHashTag hashTag = new PostHashTag();
			hashTag.setOffset(matcher.start());
			hashTag.setTagName(text.substring(matcher.start(), matcher.end()));
			hashTags.add(hashTag);
		}
		post.setHashTags(hashTags);
		model.addComment(post, addCommentListner);
	}

	@Override
	public void onValidationFailed(List<ValidationError> errors) {
		if (errors.size() > 0) {
			showError(errors.get(0).getCollatedErrorMessage(this));
			((EditText) errors.get(0).getView()).setError(errors.get(0).getCollatedErrorMessage(this));
		}

	}

	@Override
	public void onValidationSucceeded() {
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
					model.upload(this, (i + 1) + "", contentPath[i], contentTypes[i], util.user.getComboUserID(), addCommentListner);
					// dialog.show();
					break;
				}
		} else {
			commentSent = true;
			sendComment();
		}
		util.resetAttachments();
	}

	private boolean isUploading() {
		return isUploading[0] || isUploading[1] || isUploading[2];

	}

	public void reload() {
		showProgress();
		model.getPostByID(postId, currentPage, commentsListner);
	}


	private RequestListiner commentsListner = new RequestListiner() {

		@Override
		public void requestDone(Object result) {

			hideProgress();
			Post post = ((ArrayList<Post>) result).get(0);
			ArrayList<Comment> comments = (ArrayList<Comment>) post.getComments();

			if (currentPage == 0)
				adapter.reset();
			adapter.addComments(comments);
			if (adapter.getComments().size() == 0) {
				showView(findViewById(R.id.noData));
				//hideView(mPullRefreshListView);
			} else {
				hideView(findViewById(R.id.noData));
				showView(mPullRefreshListView);
			}
			mPullRefreshListView.onRefreshComplete();
			adapter.notifyDataSetChanged();
			
				//mPullRefreshListView.setSelection(adapter.getCount() - 1);
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

	private RequestListiner addCommentListner = new RequestListiner() {

		@Override
		public void requestDone(Object result) {
			// dialog.dismiss();
			if (currentlyUploading != -1) {

				attachments.add(((Response<Attachment>) result).getEntity().get(0));
				if (currentlyUploading < 2) {
					for (int i = currentlyUploading + 1; i < 3; i++) {
						if (isUploading[i]) {
							currentlyUploading = i;
							model.upload(CommentsActivity.this, (i + 1) + "", contentPath[i], contentTypes[i], util.user.getComboUserID(), this);
							// dialog.show();
							return;
						}
					}
					currentlyUploading = -1;
				}
			}

			if (!commentSent) {
				commentSent = true;
				currentlyUploading = -1;
				sendComment();
				return;
			}
			util.resetAttachments();
			hideProgress();
			//finish();
			//explore(null);
			reload();
			commentData.setText("");
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
				commentData.setFocusableInTouchMode(true);
				commentData.requestFocus();
				popup.showAtBottomPending();
				final InputMethodManager inputMethodManager = (InputMethodManager) getSystemService(Context.INPUT_METHOD_SERVICE);
				inputMethodManager.showSoftInput(commentData, InputMethodManager.SHOW_IMPLICIT);
				changeEmojiKeyboardIcon(emojiButton, R.drawable.ic_action_keyboard);
			}
		} else {
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
			final SuggestionsResultListener listener = commentData;

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
		// TODO Auto-generated method stub
		List<String> buckets = Arrays.asList(BUCKET);
		this.queryToken = queryToken;
		Log.d("combo", "id=" + util.user.getComboUserID());
		Log.d("combo", "post=" + postId);
		model.searchForTagging(util.user.getComboUserID(), queryToken.getKeywords().toLowerCase(), postId, 0, suggistoinsListiner);
		return buckets;
	}

}
