package com.egygames.apps.social.adapter;

import java.util.ArrayList;
import java.util.List;

import android.content.Intent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import com.combomobile.R;
import com.egygames.apps.social.BaseActivity;
import com.egygames.apps.social.CommentsActivity;
import com.egygames.apps.social.entity.Attachment;
import com.egygames.apps.social.entity.Comment;
import com.egygames.apps.social.views.util.TimeFormater;
import com.nostra13.universalimageloader.core.ImageLoader;

public class MessageCommentsListAdapter extends BaseAdapter {

	ArrayList<Comment> comments;
	private OnClickListener playAudioListener, playVideoListener
	// , shareListener, commentListener, commentMenu , likeListener
			;
	private BaseActivity activity;
	private LayoutInflater inflater;

	public ArrayList<Comment> getComments() {
		return comments;
	}

	public MessageCommentsListAdapter(BaseActivity context, ViewGroup parent) {
		this.activity = context;
		playAudioListener = new PlayAudioListener();
		playVideoListener = new PlayVideoListener(context);
		comments = new ArrayList<Comment>();
		inflater = LayoutInflater.from(parent.getContext());
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
	public View getView(int position, View convertView, ViewGroup parent) {

		Comment comment = comments.get(position);

		ViewGroup view;
		if (convertView == null) {
			view = (ViewGroup) inflater.inflate(R.layout.chat_list_item, parent, false);
		} else
			view = (ViewGroup) convertView;
		hideUneededViews(view);
		if (comment.getIsLocal()) {
			view.findViewById(R.id.messageStatus).setVisibility(View.VISIBLE);
		} else {
			view.findViewById(R.id.messageStatus).setVisibility(View.GONE);
		}
		showAtachments(view, comment.getAttachments());
		setText(view, R.id.postText, comment.getCommentText());
		setText(view, R.id.time, TimeFormater.getTimeAgo(comment.getCommentDate()));
		if (comment.getComboUserID().equals(activity.util.user.getComboUserID())) {
			view.findViewById(R.id.parent).setBackgroundResource(R.drawable.message_ballon_1);
			view.findViewById(R.id.right).setVisibility(View.VISIBLE);
			view.findViewById(R.id.left).setVisibility(View.GONE);

		} else {
			view.findViewById(R.id.parent).setBackgroundResource(R.drawable.message_ballon_2);
			view.findViewById(R.id.left).setVisibility(View.VISIBLE);
			view.findViewById(R.id.right).setVisibility(View.GONE);
		}
		// setText(view, R.id.likesCount, comment.getLikes().size() + "");
		// setListenr(view.findViewById(R.id.share), comment, shareListener);
		// setListenr(view.findViewById(R.id.like), comment, likeListener);
		// setListenr(view.findViewById(R.id.comment), comment,
		// commentListener);
		// setListenr(view.findViewById(R.id.commentMenu), comment,
		// commentMenu);
		return view;
	}

	private void hideUneededViews(ViewGroup view) {

		view.findViewById(R.id.visualizerView).setVisibility(View.GONE);
		view.findViewById(R.id.postImage).setVisibility(View.GONE);
		view.findViewById(R.id.videoIcon).setVisibility(View.GONE);
		view.findViewById(R.id.videoView).setVisibility(View.GONE);
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
		for (Attachment attachment : attachments) {
//			activity.showView(view.findViewById(R.id.attachments));
			switch (attachment.getAttachmentTypeID()) {
			case 1:
				displayImage(view, R.id.postImage, attachment.getPath());
				break;
			case 2:
				// View playIcon = view.findViewById(R.id.videoIcon);
				// playIcon.setVisibility(View.VISIBLE);
				view.findViewById(R.id.visualizerView).setVisibility(View.VISIBLE);
				view.findViewById(R.id.visualizerView).setTag("http://www.combomobile.com" + attachment.getPath());
				view.findViewById(R.id.visualizerView).setOnClickListener(playAudioListener);

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
		ImageLoader.getInstance().displayImage("http://www.combomobile.com/comboapi/images.aspx?Image=" + path, ((ImageView) view.findViewById(viewId)));

	}

	private void displayImage(ViewGroup view, int viewId, String path) {
		view.findViewById(viewId).setVisibility(View.VISIBLE);
		if ("".equals(path)) {
			((ImageView) view.findViewById(viewId)).setImageResource(R.drawable.default_post_pic);
			return;
		}

		ImageLoader.getInstance().displayImage("http://www.combomobile.com/comboapi/images.aspx?Image=" + path, ((ImageView) view.findViewById(viewId)));

	}

	private void setText(ViewGroup view, int fieldId, String text) {
		((TextView) view.findViewById(fieldId)).setText(text);

	}

	public void addComments(ArrayList<Comment> comments) {
		this.comments.addAll( comments);

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

}
