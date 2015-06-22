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
import android.widget.PopupWindow.OnDismissListener;
import android.widget.TextView;

import com.combomobile.R;
import com.egygames.apps.social.BaseActivity;
import com.egygames.apps.social.CommentsActivity;
import com.egygames.apps.social.ImageActivity;
import com.egygames.apps.social.entity.Attachment;
import com.egygames.apps.social.entity.Post;
import com.egygames.apps.social.model.DefaultRequestListiner;
import com.egygames.apps.social.views.PostPopupMenu;
import com.egygames.apps.social.views.util.TimeFormater;
import com.nostra13.universalimageloader.core.DisplayImageOptions;
import com.nostra13.universalimageloader.core.listener.ImageLoadingListener;

public class PhotoPostsListAdapter extends BaseAdapter {

	private ArrayList<Post> posts;
	private OnClickListener playAudioListener, imageFullScreen, playVideoListener, shareListener, commentListener, postMenu, likeListener;
	private BaseActivity activity;
	private LayoutInflater inflater;
	private DisplayImageOptions options;
	private ImageLoadingListener animateFirstListener = new AnimateFirstDisplayListener();

	public ArrayList<Post> getPosts() {
		return posts;
	}

	public PhotoPostsListAdapter(BaseActivity context, ViewGroup parent) {
		this.activity = context;

		playAudioListener = new PlayAudioListener();
		playVideoListener = new PlayVideoListener(context);
		shareListener = new SharePostListener();
		commentListener = new CommentsPostListener();
		likeListener = new LikePostListner();
		imageFullScreen = new ImageFullScreen();
		postMenu = new PostMenuListner();
		posts = new ArrayList<Post>();
		inflater = LayoutInflater.from(parent.getContext());

	}

	@Override
	public int getCount() {
		return posts.size();
	}

	@Override
	public Object getItem(int position) {
		return posts.get(position);
	}

	@Override
	public long getItemId(int position) {
		return position;
	}

	@Override
	public View getView(int position, View convertView, ViewGroup parent) {

		Post post = posts.get(position);

		ViewGroup view;
		if (convertView == null) {
			view = (ViewGroup) inflater.inflate(R.layout.photo_feed_list_item, parent, false);
		} else
			view = (ViewGroup) convertView;
		showAtachments(view, post.getAttachments());
	
		return view;
	}

	private void hideUneededViews(ViewGroup view) {
		view.findViewById(R.id.visualizerView).setVisibility(View.GONE);
		view.findViewById(R.id.postImage).setVisibility(View.GONE);
		view.findViewById(R.id.videoIcon).setVisibility(View.GONE);
		view.findViewById(R.id.videoView).setVisibility(View.GONE);
		view.findViewById(R.id.progress).setVisibility(View.GONE);
		// view.findViewById(R.id.surface_view).setVisibility(View.GONE);

	}

	private void setListenr(View view, Post post, OnClickListener listener) {
		view.setTag(post);
		view.setOnClickListener(listener);
	}

	private void showAtachments(ViewGroup view, List<Attachment> attachments) {
		if (attachments == null || attachments.size() == 0) {
			displayImage(view, R.id.postImage, "");
//			view.findViewById(R.id.postType).setVisibility(View.GONE);
			return;
		}
		for (Attachment attachment : attachments) {
			switch (attachment.getAttachmentTypeID()) {
			case 1:
				displayImage(view, R.id.postImage, attachment.getPath());
				view.findViewById(R.id.postImage).setTag("http://www.combomobile.com/" + attachment.getPath());
				view.findViewById(R.id.postImage).setOnClickListener(imageFullScreen);
//				view.findViewById(R.id.postType).setVisibility(View.VISIBLE);
//				((ImageView) view.findViewById(R.id.postType)).setImageResource(R.drawable.photo_type);
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

	public void addPosts(ArrayList<Post> posts) {
		this.posts.addAll(posts);
		notifyDataSetChanged();

	}

	public void resetPosts() {
		posts.clear();
	}

	public class PlayVideoOrAudioListener implements OnClickListener {

		@Override
		public void onClick(View view) {
			activity.playVideoOrAudio((String) view.getTag());
		}

	}

	public class LikePostListner implements OnClickListener {

		@Override
		public void onClick(View v) {
			activity.model.toggleLikePostByID(((Post) v.getTag()).getComboPostID(), activity.util.user.getComboUserID(), new DefaultRequestListiner() {
				@Override
				public void requestDone(Object result) {
					activity.reload();
					super.requestDone(result);
				}

			});
		}

	}

	public class CommentsPostListener implements OnClickListener {

		@Override
		public void onClick(View v) {
			Intent intent = new Intent(activity, CommentsActivity.class);
			intent.putExtra("PostId", ((Post) v.getTag()).getComboPostID());
			activity.util.resetAttachments();
			activity.startActivity(intent);

		}

	}

	public class SharePostListener implements OnClickListener {

		@Override
		public void onClick(View v) {

			activity.model.sharePost(((Post) v.getTag()).getComboPostID(), activity.util.user.getComboUserID(), new DefaultRequestListiner());
			// Intent share = new Intent(android.content.Intent.ACTION_SEND);
			// share.setType("text/plain");
			// // share.addFlags(Intent.FLAG_ACTIVITY_CLEAR_WHEN_TASK_RESET);
			// share.putExtra(Intent.EXTRA_SUBJECT, ((Post)
			// v.getTag()).getPostText());
			// share.putExtra(Intent.EXTRA_TEXT,
			// "http://www.combomobile.com/showpost.aspx?pid=" + ((Post)
			// v.getTag()).getComboPostID());
			// try {
			// activity.startActivity(Intent.createChooser(share, ""));
			// } catch (Exception ex) {
			// }
		}

	}

	private PostPopupMenu postPopupMenu;

	public class PostMenuListner implements OnClickListener {
		private boolean menuOpened;

		@Override
		public void onClick(View v) {
			if (menuOpened) {
				postPopupMenu.dismiss();
				postPopupMenu.setPost(((Post) v.getTag()));
				postPopupMenu.setAnchor(v);
				postPopupMenu.show();
				menuOpened = true;
			} else {
				if (postPopupMenu == null) {
					postPopupMenu = new PostPopupMenu(activity, v,((Post) v.getTag()));
					postPopupMenu.setOnDismissListener(new OnDismissListener() {
						@Override
						public void onDismiss() {
							menuOpened = false;

						}
					});
				}
				postPopupMenu.setPost(((Post) v.getTag()));
				postPopupMenu.setAnchor(v);
				postPopupMenu.show();
				menuOpened = true;
			}
		}

	}

	public class ImageFullScreen implements OnClickListener {

		@Override
		public void onClick(View view) {
			String imageUrl = (String) view.getTag();

			Intent intent = new Intent(activity, ImageActivity.class);
			intent.putExtra("path", imageUrl);
			activity.startActivity(intent);
		}
	}
}
