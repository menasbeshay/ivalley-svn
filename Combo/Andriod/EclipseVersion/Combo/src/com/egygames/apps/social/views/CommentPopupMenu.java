package com.egygames.apps.social.views;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.DownloadManager;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.net.Uri;
import android.os.Environment;
import android.text.ClipboardManager;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.BaseAdapter;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.PopupWindow;
import android.widget.PopupWindow.OnDismissListener;
import android.widget.TextView;
import android.widget.Toast;

import com.combomobile.R;
import com.egygames.apps.social.BaseActivity;
import com.egygames.apps.social.ReportPostDialog;
import com.egygames.apps.social.entity.Attachment;
import com.egygames.apps.social.entity.Comment;
import com.egygames.apps.social.entity.Post;
import com.egygames.apps.social.model.DefaultRequestListiner;
import com.egygames.apps.social.model.Model;
import com.egygames.apps.social.views.util.Util;
import com.kbeanie.imagechooser.api.FileUtils;

public class CommentPopupMenu implements OnItemClickListener {

	private PopupWindow popup;
	private View anchor;
	//private final int[] TITLES = { R.string.download, R.string.shareLink, R.string.unFollow, R.string.ban, R.string.rePort };
	//MY Post Other Comment
	private final int[] MYPOST = { R.string.copyname, R.string.copycomment, R.string.delete, R.string.reportdelete,R.string.block };
	//Other Post Other Comment
	private final int[] OTHER = { R.string.copyname, R.string.copycomment, R.string.rePort};
	//MY Post My Comment
		private final int[] MYCOMMENT = { R.string.copyname, R.string.copycomment, R.string.delete };
	
	
	
	private Comment comment;
	private BaseActivity context;
	private ViewGroup layout;
	private boolean myPost;
	private Activity activity;
	private boolean myComment;
	public Activity getActivity() {
		return activity;
	}

	public void setActivity(Activity activity) {
		this.activity = activity;
	}

	public CommentPopupMenu(BaseActivity context, View anchor) {
		this.anchor = anchor;
		this.context = context;
		LayoutInflater layoutInflater = (LayoutInflater) context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
		layout = (ViewGroup) layoutInflater.inflate(R.layout.post_popup_menu, null);
		ListView list = (ListView) layout.findViewById(R.id.items);
		list.setAdapter(new MenuItemsAdapter());
		list.setOnItemClickListener(this);
		// Creating the PopupWindow
		popup = new PopupWindow(context);
		popup.setContentView(layout);
		popup.setWidth(LinearLayout.LayoutParams.WRAP_CONTENT);
		popup.setHeight(LinearLayout.LayoutParams.WRAP_CONTENT);
		popup.setFocusable(true);
		myPost = false;

		// // Clear the default translucent background
		popup.setBackgroundDrawable(context.getResources().getDrawable(R.drawable.strok_white_bg));
		popup.showAsDropDown(anchor);
		
		
	}

	public void setAnchor(View anchor) {
		this.anchor = anchor;
	}

	public void setPost(Comment comment) {
		this.comment = comment;
		
		
		if(comment.getCreatorUserID().equals(Util.instance.user.getComboUserID()))//comment must return creator id for the post
			myPost=true;
		if(comment.getComboUserID().equals(Util.instance.user.getComboUserID()))//comment must return creator id for the post
			myComment=true;
	}

	public void show() {
		popup.showAsDropDown(anchor);

	}

	public void setOnDismissListener(OnDismissListener onDismissListener) {
		popup.setOnDismissListener(onDismissListener);

	}

	public void dismiss() {
		popup.dismiss();
	}

	public class MenuItemsAdapter extends BaseAdapter {

		@Override
		public int getCount() {
			if(myComment)
				return MYCOMMENT.length;
			
			if (myPost)
				return MYPOST.length;
			return OTHER.length;
		}

		@Override
		public Object getItem(int position) {
			if(myComment)
				return MYCOMMENT[position];
			
			if (myPost)
				
				return MYPOST[position];
			return OTHER[position];
		}

		@Override
		public long getItemId(int position) {
			return position;
		}

		@Override
		public View getView(int position, View convertView, ViewGroup parent) {
			LayoutInflater inflater = LayoutInflater.from(parent.getContext());
			final ViewGroup view;
			view = (ViewGroup) inflater.inflate(R.layout.settings_item, parent, false);
			if(myComment)
				((TextView) view.findViewById(R.id.title)).setText(parent.getContext().getString(MYCOMMENT[position]));

			else{
			if (myPost)
				((TextView) view.findViewById(R.id.title)).setText(parent.getContext().getString(MYPOST[position]));
			else
				((TextView) view.findViewById(R.id.title)).setText(parent.getContext().getString(OTHER[position]));
			}
			return view;
		}

	}

	@Override
	public void onItemClick(AdapterView<?> arg0, View arg1, int position, long arg3) {

		ClipboardManager clipboard = (ClipboardManager)activity.getSystemService(activity.CLIPBOARD_SERVICE);
		if(myComment)
switch (position) {
			
			case 0:
				//downloadPost();
				clipboard.setText(comment.getComboUserName());
				dismiss();
				return;
			case 1:
				clipboard.setText(comment.getCommentText());
				dismiss();
				return;
			case 2:
				deleteComment();//edit method name
				dismiss();
				
				return;
}
		if (myPost)
			switch (position) {
			
			case 0:
				//downloadPost();
				clipboard.setText(comment.getComboUserName());
				dismiss();
				return;
			case 1:
				clipboard.setText(comment.getCommentText());
				dismiss();
				return;
			case 2:
				deleteComment();//edit method name
				dismiss();
				return;
			case 3:
				new ReportPostDialog(comment.getComboCommentID(), context,"comment",Util.instance.user.getComboUserID()).show();//report comment
				deleteComment();//edit method name
				dismiss();
				return;
			case 4:
				Model.instance.toggleBlockFriend(Util.instance.user.getComboUserID(), comment.getComboUserID(), new DefaultRequestListiner() {
					@Override
					public void requestDone(Object result) {
						Toast.makeText(context, "User blocked successFully", Toast.LENGTH_LONG).show();
						//activity.finish();
						if(activity!=null)
							activity.finish();
						super.requestDone(result);
					}
				});
				Toast.makeText(context, "You will not see this user again", Toast.LENGTH_LONG).show();
				dismiss();
				return;
			}

		switch (position) {
		case 0:
			break;
		case 1:
			clipboard.setText(comment.getComboUserName());
			break;
		case 2:
			clipboard.setText(comment.getCommentText());
			break;
		case 3:

			new ReportPostDialog(comment.getComboCommentID(), context,"comment",Util.instance.user.getComboUserID()).show();//report comment method
			break;
		}
		dismiss();

	}

	private void deleteComment() {
		DialogInterface.OnClickListener dialogClickListener = new DialogInterface.OnClickListener() {
			@Override
			public void onClick(DialogInterface dialog, int which) {
				switch (which) {
				case DialogInterface.BUTTON_POSITIVE:
					Model.instance.deleteComment(comment.getComboCommentID(), new DefaultRequestListiner() {
						@Override
						public void requestDone(Object result) {
							context.explore(null);

						}
					});
					break;

				case DialogInterface.BUTTON_NEGATIVE:
					dialog.dismiss();
					break;
				}
			}
		};

		AlertDialog.Builder builder = new AlertDialog.Builder(context);
		builder.setMessage("Are you sure?").setPositiveButton("Yes", dialogClickListener).setNegativeButton("No", dialogClickListener).show();

	}
	
	private void deleteSharedPost() {
		DialogInterface.OnClickListener dialogClickListener = new DialogInterface.OnClickListener() {
			@Override
			public void onClick(DialogInterface dialog, int which) {
				Util util;
				switch (which) {
				case DialogInterface.BUTTON_POSITIVE:
					util = Util.getInstance(activity);
					Model.instance.deleteSharedPost(util.user.getComboUserID(),comment.getComboPostID(), new DefaultRequestListiner() {
						@Override
						public void requestDone(Object result) {
							context.explore(null);

						}
					});
					break;

				case DialogInterface.BUTTON_NEGATIVE:
					dialog.dismiss();
					break;
				}
			}
		};

		AlertDialog.Builder builder = new AlertDialog.Builder(context);
		builder.setMessage("Are you sure?").setPositiveButton("Yes", dialogClickListener).setNegativeButton("No", dialogClickListener).show();

	}


	private void sharePost() {

		Intent share = new Intent(android.content.Intent.ACTION_SEND);
		share.setType("text/plain");
		// share.addFlags(Intent.FLAG_ACTIVITY_CLEAR_WHEN_TASK_RESET);
		share.putExtra(Intent.EXTRA_SUBJECT, comment.getCommentText());
		share.putExtra(Intent.EXTRA_TEXT, "http://combomobile.com/showPost.html?id=" + comment.getComboPostID());
		try {
			context.startActivity(Intent.createChooser(share, ""));
		} catch (Exception ex) {

		}

	}
}
