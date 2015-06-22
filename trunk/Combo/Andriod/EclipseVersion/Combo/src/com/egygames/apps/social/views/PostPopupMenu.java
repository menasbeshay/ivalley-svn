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
import com.egygames.apps.social.ProfileActivity;
import com.egygames.apps.social.ReportPostDialog;
import com.egygames.apps.social.entity.Attachment;
import com.egygames.apps.social.entity.Post;
import com.egygames.apps.social.model.DefaultRequestListiner;
import com.egygames.apps.social.model.Model;
import com.egygames.apps.social.views.util.Util;
import com.kbeanie.imagechooser.api.FileUtils;

public class PostPopupMenu implements OnItemClickListener {

	private PopupWindow popup;
	private View anchor;
	//private final int[] TITLES = { R.string.download, R.string.shareLink, R.string.unFollow, R.string.ban, R.string.rePort };
	private final int[] TITLES = { R.string.copy,R.string.download, R.string.shareLink, R.string.block, R.string.rePort };
	private final int[] OWNTITLES = {R.string.copy,R.string.download, R.string.shareLink, R.string.delete };
	
	private final int[] TITLES2 = { R.string.copy,R.string.shareLink, R.string.block, R.string.rePort };
	private final int[] OWNTITLES2 = {R.string.copy,R.string.shareLink, R.string.delete };
	
	private Post post;
	private BaseActivity context;
	private ViewGroup layout;
	private boolean myPost;
	private Activity activity;
	public Activity getActivity() {
		return activity;
	}

	public void setActivity(Activity activity) {
		this.activity = activity;
	}

	public PostPopupMenu(BaseActivity context, View anchor, Post post2) {
		this.anchor = anchor;
		this.context = context;
		this.post=post2;
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

	public void setPost(Post post) {
		this.post = post;
		myPost = post.getComboUserID().equals(Util.instance.user.getComboUserID());
		
		if(post.getOriginalCreator()==1 && myPost==false)
			myPost=true;
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
			
			
			if (myPost )
			{
				if (post.getAttachments() == null  || post.getAttachments().size()==0)
					return OWNTITLES2.length;
				else
					return OWNTITLES.length;
			}
			else
			{
				if (post.getAttachments() == null  || post.getAttachments().size()==0)
					return TITLES2.length;
				else
					return TITLES.length;
			}
		}

		@Override
		public Object getItem(int position) {
			if (myPost){
				if (post.getAttachments() == null  || post.getAttachments().size()==0)
					return OWNTITLES2[position];
				else
					return OWNTITLES[position];
			}
			else
			{
				if (post.getAttachments() == null  || post.getAttachments().size()==0)
					return TITLES2[position];
				else
					return TITLES[position];
			}
				
				
			
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

			if (myPost)
			{
				if(post.getAttachments()==null || post.getAttachments().size()==0)
					((TextView) view.findViewById(R.id.title)).setText(parent.getContext().getString(OWNTITLES2[position]));
				else
					((TextView) view.findViewById(R.id.title)).setText(parent.getContext().getString(OWNTITLES[position]));
			}
			else
			{
				if(post.getAttachments()==null || post.getAttachments().size()==0)
					((TextView) view.findViewById(R.id.title)).setText(parent.getContext().getString(TITLES2[position]));
				else
					((TextView) view.findViewById(R.id.title)).setText(parent.getContext().getString(TITLES[position]));
				
			}
			return view;
		}

	}

	@Override
	public void onItemClick(AdapterView<?> arg0, View arg1, int position, long arg3) {

		ClipboardManager clipboard = (ClipboardManager)activity.getSystemService(activity.CLIPBOARD_SERVICE);
		if (myPost)
		{
			if(post.getAttachments()==null || post.getAttachments().size()==0)
			{
				switch (position) {
				case 0:
					dismiss();
					clipboard.setText(post.getPostText());
					break;
				case 1:
					dismiss();
					sharePost();
					return;
				case 2:
					dismiss();
					if(post.getOriginalCreator()==1)
						deleteSharedPost();
					else
						deletePost();
					return;
				}
			}
			else
			{
				switch (position) {
				case 0:
					popup.dismiss();
					clipboard.setText(post.getPostText());
					
					break;
				case 1:
					popup.dismiss();
					downloadPost();
					
					break;
				case 2:
					popup.dismiss();
					sharePost();
					
					return;
				case 3:
					popup.dismiss();
					if(post.getOriginalCreator()==1)
						deleteSharedPost();
					
					else
						deletePost();
					
					return;
				}
			}
		}

		if(post.getAttachments()==null || post.getAttachments().size()==0)
		{
			switch (position) {
			case 0:
				clipboard.setText(post.getPostText());
				break;
			case 1:
				sharePost();
				break;
			/*case 2:

				Model.instance.unFollowPost(post.getComboPostID(), Util.instance.user.getComboUserID(), new DefaultRequestListiner());
				Toast.makeText(context, "You have unfollowed this post", Toast.LENGTH_LONG).show();
				break;*/
			case 2:
				Model.instance.toggleBlockFriend(Util.instance.user.getComboUserID(), post.getComboUserID(), new DefaultRequestListiner() {
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
				break;
			case 3:

				new ReportPostDialog(post.getComboPostID(), context,"post","").show();
				break;
			}
		}
		else
		{
			switch (position) {
			case 0:
				clipboard.setText(post.getPostText());
				break;
			case 1:
				downloadPost();
				break;
			case 2:
				sharePost();
				break;
			/*case 2:

				Model.instance.unFollowPost(post.getComboPostID(), Util.instance.user.getComboUserID(), new DefaultRequestListiner());
				Toast.makeText(context, "You have unfollowed this post", Toast.LENGTH_LONG).show();
				break;*/
			case 3:
				Model.instance.toggleBlockFriend(Util.instance.user.getComboUserID(), post.getComboUserID(), new DefaultRequestListiner() {
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
				break;
			case 4:

				new ReportPostDialog(post.getComboPostID(), context,"post","").show();
				break;
			}
		}
		
		dismiss();

	}

	private void deletePost() {
		DialogInterface.OnClickListener dialogClickListener = new DialogInterface.OnClickListener() {
			@Override
			public void onClick(DialogInterface dialog, int which) {
				switch (which) {
				case DialogInterface.BUTTON_POSITIVE:
					Model.instance.deletePost(post.getComboPostID(), new DefaultRequestListiner() {
						@Override
						public void requestDone(Object result) {
							
							if(context instanceof ProfileActivity){
								context.reload();
							}
							else
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
					Model.instance.deleteSharedPost(util.user.getComboUserID(),post.getComboPostID(), new DefaultRequestListiner() {
						@Override
						public void requestDone(Object result) {
							if(context instanceof ProfileActivity){
								context.reload();
							}
							else
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
		share.putExtra(Intent.EXTRA_SUBJECT, post.getPostText());
		share.putExtra(Intent.EXTRA_TEXT, "http://combomobile.com/showPost.html?id=" + post.getComboPostID());
		try {
			context.startActivity(Intent.createChooser(share, ""));
		} catch (Exception ex) {

		}

	}

	private void downloadPost() {
		String url = getDowmloadableContent();
		if ("".equals(url)) {
			Toast.makeText(context, "Nothing to download", Toast.LENGTH_LONG).show();
			return;
		}
		DownloadManager.Request r = new DownloadManager.Request(Uri.parse(url));

		// This put the download in the same Download dir the browser uses
		r.setDestinationInExternalPublicDir(Environment.DIRECTORY_DOWNLOADS, post.getComboPostID() + "." + FileUtils.getFileExtension(url));

		// When downloading music and videos they will be listed in the player
		// (Seems to be available since Honeycomb only)
		r.allowScanningByMediaScanner();

		// Notify user when download is completed
		// (Seems to be available since Honeycomb only)
		r.setNotificationVisibility(DownloadManager.Request.VISIBILITY_VISIBLE_NOTIFY_COMPLETED);

		// Start download
		DownloadManager dm = (DownloadManager) context.getSystemService(context.DOWNLOAD_SERVICE);
		dm.enqueue(r);
		Toast.makeText(context, "Download is started.\nCheck the notification ", Toast.LENGTH_LONG).show();
	}

	private String getDowmloadableContent() {
		String url = "";
		if (post.getAttachments() == null)
			return "";
		for (Attachment attachment : post.getAttachments()) {
			url = "http://www.combomobile.com" + attachment.getPath();
		}
		return url;
	}
}
