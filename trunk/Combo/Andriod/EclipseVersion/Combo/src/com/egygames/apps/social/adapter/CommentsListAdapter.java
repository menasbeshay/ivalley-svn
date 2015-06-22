package com.egygames.apps.social.adapter;

import github.ankushsachdeva.emojicon.EmojiconTextView;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

import nl.changer.audiowife.AudioWifeSpecial;

import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.media.MediaPlayer;
import android.media.MediaPlayer.OnCompletionListener;
import android.text.SpannableString;
import android.text.method.LinkMovementMethod;
import android.text.style.ClickableSpan;
import android.text.util.Linkify;
import android.util.TypedValue;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.SeekBar;
import android.widget.TextView;
import android.widget.PopupWindow.OnDismissListener;

import com.combomobile.R;
import com.egygames.apps.social.BaseActivity;
import com.egygames.apps.social.CommentsActivity;
import com.egygames.apps.social.ExploreActivity;
import com.egygames.apps.social.ProfileActivity;
import com.egygames.apps.social.adapter.PostsTypeListAdapter.PostMenuListner;
import com.egygames.apps.social.entity.Attachment;
import com.egygames.apps.social.entity.Comment;
import com.egygames.apps.social.entity.Post;
import com.egygames.apps.social.entity.PostHashTag;
import com.egygames.apps.social.entity.PostUserTag;
import com.egygames.apps.social.views.CommentPopupMenu;
import com.egygames.apps.social.views.PostPopupMenu;
import com.egygames.apps.social.views.util.TimeFormater;
import com.nostra13.universalimageloader.core.DisplayImageOptions;
import com.nostra13.universalimageloader.core.listener.ImageLoadingListener;

public class CommentsListAdapter extends BaseAdapter {

	ArrayList<Comment> comments;
	private OnClickListener playAudioListener, playVideoListener,postMenu
	// , shareListener, commentListener, commentMenu , likeListener
			;
	private BaseActivity activity;
	private LayoutInflater inflater;
	private ImageLoadingListener animateFirstListener = new AnimateFirstDisplayListener();
	private DisplayImageOptions options;
	private int px;
	private ImageView postMenuImageView;
	private PostViewHolder holder;

	public ArrayList<Comment> getComments() {

		return comments;
	}

	public CommentsListAdapter(BaseActivity context, ViewGroup parent) {
		this.activity = context;
		holder = new PostViewHolder();
		playAudioListener = new PlayAudioListener();
		playVideoListener = new PlayVideoListener(context);
		// shareListener = new ShareCommentListener();
		// commentListener = new CommentsCommentListener();
		// likeListener = new LikeCommentListner();
		comments = new ArrayList<Comment>();
		inflater = LayoutInflater.from(parent.getContext());
		postMenu = new CommentMenu();
		Resources r = activity.getResources();
		px = (int) TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, 25, r.getDisplayMetrics());
	}

	@Override
	public int getCount() {
		return comments.size();
	}

	@Override
	public Object getItem(int position) {
		return comments.get(position);
	}

	@Override
	public long getItemId(int position) {
		return position;
	}

	@Override
	public View getView( int position, View convertView, ViewGroup parent) {

		 final Comment comment = comments.get(position);

		ViewGroup view;
		if (convertView == null) {
			view = (ViewGroup) inflater.inflate(R.layout.comments_list_item, parent, false);
		} else
			view = (ViewGroup) convertView;
		
		
		hideUneededViews(view);
		
		holder.mPlayMedia = view.findViewById(R.id.play);
		holder.mPauseMedia = view.findViewById(R.id.pause);
		holder.mMediaSeekBar = (SeekBar) view
				.findViewById(R.id.media_seekbar);
		holder.mRunTime = (TextView) view.findViewById(R.id.run_time);
		holder.mTotalTime = (TextView) view
				.findViewById(R.id.total_time);
		showAtachments(view, comment.getAttachments());
		View postText = view.findViewById(R.id.postText);
		
		postMenuImageView = (ImageView)view.findViewById(R.id.postMenu);
	
		setText(view, R.id.userDisplayName, comment.getComboUserName());
		
		Pattern tagMatcher = Pattern.compile("[#]+[A-Za-z0-9-_]+\\b");
		String newActivityURL = "content://com.combomobile.ExploreActivity/";
		Linkify.addLinks((TextView) postText, tagMatcher, newActivityURL);
		
		((EmojiconTextView) postText).setEmojiconSize(px);
		
		setPostText(comment, postText,  comment.getCommentText());
		//setText(view, R.id.postText, comment.getCommentText());
		setText(view, R.id.time, TimeFormater.getTimeAgo(comment.getCommentDate()));
		// setText(view, R.id.likesCount, comment.getLikes().size() + "");
		displayProfileImage(view, R.id.profiel, comment.getProfilePic());
		// setListenr(view.findViewById(R.id.share), comment, shareListener);
		// setListenr(view.findViewById(R.id.like), comment, likeListener);
		// setListenr(view.findViewById(R.id.comment), comment,
		// commentListener);
		// setListenr(view.findViewById(R.id.commentMenu), comment,
		// commentMenu);
		
(view.findViewById(R.id.profiel)).setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View v) {
				// TODO Auto-generated method stub
				openProfile(activity, comment.getComboUserID());
			}
		});
		setListenr(postMenuImageView, comment, postMenu);
		
		return view;
	}

	private void setPostText(Comment post, View view, String text) {
		((TextView) view).setText(text);
		
		for (final PostUserTag userTag : post.getUserTagss()) {

			text=text.replace(userTag.getUserName(), "@"+userTag.getUserName());
		}
		
		SpannableString hashtagintitle = new SpannableString(text);

		int counter=1;
		for (final PostUserTag userTag : post.getUserTagss()) {

			hashtagintitle.setSpan(new ClickableSpan() {

				@Override
				public void onClick(View widget) {
					openProfile(widget.getContext(), userTag.getComboUserID());
				}
			}, userTag.getOffset(), userTag.getUserName().length() + userTag.getOffset()+counter, 0);
			counter++;
		}

		for (final PostHashTag hashTag : post.getHashTags()) {
			hashtagintitle.setSpan(new ClickableSpan() {

				@Override
				public void onClick(View widget) {
					openHashTag(widget.getContext(), hashTag.getTagName());
				}

			}

			, hashTag.getOffset(), hashTag.getTagName().length() + hashTag.getOffset(), 0);
		}
		((TextView) view).setMovementMethod(LinkMovementMethod.getInstance());
		((TextView) view).setText(hashtagintitle);
	}
	
	public void openProfile(Context context, String id) {
		Intent intent = new Intent(context, ProfileActivity.class);
		intent.putExtra("ID", id);
		context.startActivity(intent);
	}
	
	private void openHashTag(Context context, String tagName) {
		Intent intent = new Intent(context, ExploreActivity.class);
		intent.putExtra("tagName", tagName);
		context.startActivity(intent);

	}
	
	private void hideUneededViews(ViewGroup view) {
		view.findViewById(R.id.visualizerView).setVisibility(View.GONE);
		view.findViewById(R.id.postImage).setVisibility(View.GONE);
		view.findViewById(R.id.videoIcon).setVisibility(View.GONE);
		view.findViewById(R.id.videoView).setVisibility(View.GONE);
		view.findViewById(R.id.linear_play).setVisibility(View.GONE);
	}

	private void setListenr(View view, Comment comment, OnClickListener listener) {
		view.setTag(comment);
		view.setOnClickListener(listener);
	}

	private void showAtachments(ViewGroup view, List<Attachment> attachments) {
		if (attachments == null || attachments.size() == 0) {
			displayImage(view, R.id.postImage, "");
			activity.hideView(view.findViewById(R.id.attachments));
			return;
		}
		for (final Attachment attachment : attachments) {
			activity.showView(view.findViewById(R.id.attachments));
			switch (attachment.getAttachmentTypeID()) {
			case 1:
				displayImage(view, R.id.postImage, attachment.getPath());
				break;
			case 2:
//				 View playIcon = view.findViewById(R.id.videoIcon);
//				 playIcon.setVisibility(View.VISIBLE);
//				view.findViewById(R.id.visualizerView).setVisibility(View.VISIBLE);
				holder.mPlayMedia.setTag("http://www.combomobile.com" + attachment.getPath());
//				view.findViewById(R.id.visualizerView).setOnClickListener(playAudioListener);
//				holder.mPlayMedia
				view.findViewById(R.id.linear_play).setVisibility(View.VISIBLE);
				
				
				holder.mPlayMedia.setOnClickListener(new OnClickListener() {
					@Override
					public void onClick(View v) {
						// TODO Auto-generated method stub

						AudioWifeSpecial
								.getInstance()
								.init(activity,(String)v.getTag())
								.setSeekBar((SeekBar) holder.mMediaSeekBar)
								.setRuntimeView((TextView) holder.mRunTime)
								.setTotalTimeView(
										(TextView) holder.mTotalTime)
								.play();
						AudioWifeSpecial
								.getInstance()
								.getmMediaPlayer()
								.setOnCompletionListener(
										new OnCompletionListener() {
											@Override
											public void onCompletion(
													MediaPlayer mp) {
												// TODO Auto-generated
												// method stub
												holder.mPauseMedia
														.setVisibility(View.GONE);
												holder.mPlayMedia
														.setVisibility(View.VISIBLE);
											}
										});
						;
						holder.mPauseMedia.setVisibility(View.VISIBLE);
						holder.mPlayMedia.setVisibility(View.GONE);
					}
				});

				holder.mPauseMedia
						.setOnClickListener(new OnClickListener() {

							@Override
							public void onClick(View v) {
								// TODO Auto-generated method stub
								holder.mPauseMedia.setVisibility(View.GONE);
								holder.mPlayMedia
										.setVisibility(View.VISIBLE);
								AudioWifeSpecial.getInstance().pause();
							}
						});
			

				
				
				
				
				
				
				break;
			case 3:
				View playIcon2 = view.findViewById(R.id.videoIcon);
				playIcon2.setTag("http://www.combomobile.com" + attachment.getPath());
				playIcon2.setVisibility(View.VISIBLE);
				playIcon2.setOnClickListener(playVideoListener);
				displayImage(view, R.id.postImage, attachment.getThumbsPath());
				break;

			}
		}
	}

	private void displayProfileImage(ViewGroup view, int viewId, String path) {
		if ("".equals(path)) {
			((ImageView) view.findViewById(viewId)).setImageResource(R.drawable.profile);
			return;
		}
		
		activity.util.loadImageByPath("http://www.combomobile.com/comboapi/images.aspx?Image=" + path, ((ImageView) view.findViewById(viewId)), animateFirstListener);
	}

	private void displayImage(ViewGroup view, int viewId, String path) {
		view.findViewById(viewId).setVisibility(View.VISIBLE);
		if ("".equals(path)) {
			((ImageView) view.findViewById(viewId)).setImageResource(R.drawable.default_post_pic);
			return;
		}
		activity.util.loadImageByPath("http://www.combomobile.com/comboapi/images.aspx?Image=" + path, ((ImageView) view.findViewById(viewId)), animateFirstListener);
	}

	private void setText(ViewGroup view, int fieldId, String text) {
		((TextView) view.findViewById(fieldId)).setText(text);

	}

	public void addComments(ArrayList<Comment> comments) {
		this.comments.addAll(0,comments);
		

	}

	public class PlayVideoOrAudioListener implements OnClickListener {

		@Override
		public void onClick(View view) {
			activity.playVideoOrAudio((String) view.getTag());
		}

	}

	// public class LikeCommentListner implements OnClickListener {
	//
	// @Override
	// public void onClick(View v) {
	// activity.model.toggleLikeCommentByID(((Comment)
	// v.getTag()).getComboCommentID(), activity.util.user.getComboUserID(), new
	// DefaultRequestListiner() {
	// @Override
	// public void requestDone(Object result) {
	// activity.reload();
	// super.requestDone(result);
	// }
	//
	// });
	// }
	//
	// }

	public class CommentsCommentListener implements OnClickListener {

		@Override
		public void onClick(View v) {
			Intent intent = new Intent(activity, CommentsActivity.class);
			intent.putExtra("CommentId", ((Comment) v.getTag()).getComboCommentID());
			activity.startActivity(intent);

		}

	}

	public class ShareCommentListener implements OnClickListener {

		@Override
		public void onClick(View v) {
			Intent share = new Intent(android.content.Intent.ACTION_SEND);
			share.setType("text/plain");
			// share.addFlags(Intent.FLAG_ACTIVITY_CLEAR_WHEN_TASK_RESET);
			share.putExtra(Intent.EXTRA_SUBJECT, ((Comment) v.getTag()).getCommentText());
			share.putExtra(Intent.EXTRA_TEXT, "http://combomobile.com/showComment.html?id=" + ((Comment) v.getTag()).getComboCommentID());
			activity.startActivity(Intent.createChooser(share, ""));
		}

	}

	public void reset() {
		comments.clear();

	}

	public void addComment(Comment comment) {
		comments.add(comment);
	}
	
	private CommentPopupMenu postPopupMenu;

	public class CommentMenu implements OnClickListener {
		private boolean menuOpened;

		@Override
		public void onClick(View v) {
			if (menuOpened) {
				postPopupMenu.dismiss();
				
				
				postPopupMenu.setPost(((Comment) v.getTag()));
				postPopupMenu.setAnchor(v);
				postPopupMenu.setActivity(activity);
				postPopupMenu.show();
				menuOpened = true;
			} else {
//				if (postPopupMenu == null) {
					postPopupMenu = new CommentPopupMenu(activity, v);
					postPopupMenu.setPost(((Comment) v.getTag()));
					postPopupMenu.setActivity(activity);
					postPopupMenu.setOnDismissListener(new OnDismissListener() {
						@Override
						public void onDismiss() {
							menuOpened = false;

						}
					});
//				}
				postPopupMenu.setPost(((Comment) v.getTag()));
				postPopupMenu.setAnchor(v);
				postPopupMenu.show();
				postPopupMenu.setActivity(activity);
				menuOpened = true;
			}
		}

	}


}
