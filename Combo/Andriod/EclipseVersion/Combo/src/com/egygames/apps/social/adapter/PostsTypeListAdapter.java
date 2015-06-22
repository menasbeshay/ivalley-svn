package com.egygames.apps.social.adapter;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;

import nl.changer.audiowife.AudioWifeSpecial;
import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.graphics.Color;
import android.media.MediaPlayer;
import android.media.MediaPlayer.OnCompletionListener;
import android.text.Spannable;
import android.text.SpannableString;
import android.text.method.LinkMovementMethod;
import android.text.style.ClickableSpan;
import android.text.style.ForegroundColorSpan;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.PopupWindow.OnDismissListener;
import android.widget.SeekBar;
import android.widget.TextView;
import android.widget.Toast;

import com.combomobile.R;
import com.egygames.apps.social.BaseActivity;
import com.egygames.apps.social.CommentsActivity;
import com.egygames.apps.social.ExploreActivity;
import com.egygames.apps.social.FriendsPostDialog;
import com.egygames.apps.social.ImageActivity;
import com.egygames.apps.social.NewExploreActivity;
import com.egygames.apps.social.PostActivity;
import com.egygames.apps.social.ProfileActivity;
import com.egygames.apps.social.VideoPlayerActivity;
import com.egygames.apps.social.entity.Attachment;
import com.egygames.apps.social.entity.Post;
import com.egygames.apps.social.entity.PostHashTag;
import com.egygames.apps.social.entity.PostUserTag;
import com.egygames.apps.social.model.DefaultRequestListiner;
import com.egygames.apps.social.model.Model;
import com.egygames.apps.social.model.RequestListiner;
import com.egygames.apps.social.views.PostPopupMenu;
import com.egygames.apps.social.views.VideoView;
import com.egygames.apps.social.views.util.TimeFormater;
import com.egygames.apps.social.views.util.Util;
import com.nostra13.universalimageloader.core.listener.ImageLoadingListener;

public class PostsTypeListAdapter extends BaseAdapter {

	private ArrayList<Post> posts;
	private OnClickListener favouriteListener, playAudioListener,
			imageFullScreen, playVideoListener, shareListener, profileListener,
			commentListener, postMenu, likeListener, likeFriendsListener,
			shareFriendsListener;
	private BaseActivity activity;
	private LayoutInflater inflater;
	private ImageLoadingListener animateFirstListener = new AnimateFirstDisplayListener();
	private String userId;
	private int type;
	private Activity currentActivity;
	private boolean isFullWidth;
	private OnClickListener openPostActivity;
	private int positionExplore;
	boolean profile = false;
	private boolean explore = false;

	public PostsTypeListAdapter(BaseActivity context, ViewGroup parent,
			Activity currentActivity, int positionExplore) {
		this.activity = context;
		if (context instanceof ProfileActivity)
			profile = true;
		else
			profile = false;
		
		this.positionExplore = positionExplore;
		playAudioListener = new PlayAudioListener();
		playVideoListener = new PlayVideoListener(context);
		shareListener = new SharePostListener();
		commentListener = new CommentsPostListener();
		likeListener = new LikePostListner();
		likeFriendsListener = new LikeFriendsPostListner();
		shareFriendsListener = new ShareFriendsPostListner();
		imageFullScreen = new ImageFullScreen();
		profileListener = new ProfileListener();
		openPostActivity = new OpenPostActivity();
		postMenu = new PostMenuListner();
		favouriteListener = new FavouritePostListner();
		posts = new ArrayList<Post>();
		inflater = LayoutInflater.from(parent.getContext());
		userId = activity.util.user.getComboUserID();
		type = 0;
		isFullWidth = false;

	}

	private static final int AUDIO_PROGRESS_UPDATE_TIME = 100;

	// TODO: externalize the error messages.
	private static final String ERROR_PLAYVIEW_NULL = "Play view cannot be null";
	private static final String ERROR_PLAYTIME_CURRENT_NEGATIVE = "Current playback time cannot be negative";
	private static final String ERROR_PLAYTIME_TOTAL_NEGATIVE = "Total playback time cannot be negative";

	public void setFullWidth(boolean isFullWidth) {
		this.isFullWidth = isFullWidth;
	}

	public ArrayList<Post> getPosts() {
		return posts;
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

		final Post post = posts.get(position);
		final PostViewHolder holder;

		ViewGroup view;
		if (convertView == null) {
			if (isFullWidth) {
				convertView = (ViewGroup) inflater.inflate(
						R.layout.feed_list_item, parent, false);

				view = (ViewGroup) convertView;
				holder = new PostViewHolder();
				holder.follow = view.findViewById(R.id.follow);
				holder.userView = view.findViewById(R.id.user);
				holder.buttons = view.findViewById(R.id.buttons);
				holder.attachmentsParent = view.findViewById(R.id.parent);
				holder.userDisplayName = view
						.findViewById(R.id.userDisplayName);
				holder.postText = (TextView) view.findViewById(R.id.postText);
				holder.postTextMax = (TextView) view
						.findViewById(R.id.postText_max);
				holder.time = view.findViewById(R.id.time);
				holder.likesCount = view.findViewById(R.id.likesCount);
				holder.commentsCount = view.findViewById(R.id.commentsCount);
				holder.shareCount = view.findViewById(R.id.shareCount);
				holder.profiel = view.findViewById(R.id.profiel);
				holder.like = view.findViewById(R.id.like);
				holder.shareLinear = view.findViewById(R.id.linear_repost);
				holder.comment = view.findViewById(R.id.comment);
				holder.postMenu = view.findViewById(R.id.postMenu);
				holder.share = view.findViewById(R.id.share);
				holder.share.setTag(post);
				holder.share.setOnClickListener(new OnClickListener() {

					@Override
					public void onClick(final View v) {
						// TODO Auto-generated method stub
						AlertDialog.Builder builder1 = new AlertDialog.Builder(
								activity);
						builder1.setMessage("Do you want to Repost this Post ?");
						builder1.setCancelable(true);
						builder1.setPositiveButton("Yes",
								new DialogInterface.OnClickListener() {
									public void onClick(DialogInterface dialog,
											int id) {
										dialog.cancel();
										((ImageView) v)
												.setImageResource(R.drawable.share_type);
										activity.model.sharePost(((Post) v
												.getTag()).getComboPostID(),
												activity.util.user
														.getComboUserID(),
												new DefaultRequestListiner() {
													@Override
													public void requestDone(
															Object result) {
														// activity.reload();

														super.requestDone(result);
													}
												});
									}
								});
						builder1.setNegativeButton("No",
								new DialogInterface.OnClickListener() {
									public void onClick(DialogInterface dialog,
											int id) {
										dialog.cancel();
									}
								});

						AlertDialog alert11 = builder1.create();
						alert11.show();
					}
				});

				holder.favourite = view.findViewById(R.id.favourite);
				holder.visualizerView = view.findViewById(R.id.visualizerView);
				holder.postImage = view.findViewById(R.id.postImage);
				// holder.waterMark = view.findViewById(R.id.watermark);
				holder.videoIcon = view.findViewById(R.id.videoIcon);
				holder.videoView = (VideoView) view
						.findViewById(R.id.videoView);
				holder.originalCreator = view
						.findViewById(R.id.post_originaluser);
				// if(isFullWidth)
				holder.rankValue = view.findViewById(R.id.tv_rank);
				holder.progress = view.findViewById(R.id.progress);
				// holder.postType = view.findViewById(R.id.postType);
				holder.playerLinear = view.findViewById(R.id.linear_play);
				holder.likeAction = view.findViewById(R.id.linear_like);
				holder.commentAction = view.findViewById(R.id.linear_comment);
				holder.repostAction = view.findViewById(R.id.linear_repost);
				holder.favouriteAction = view
						.findViewById(R.id.linear_favourite);

				holder.mPlayMedia = view.findViewById(R.id.play);
				holder.mPauseMedia = view.findViewById(R.id.pause);
				holder.mMediaSeekBar = (SeekBar) view
						.findViewById(R.id.media_seekbar);
				holder.mRunTime = (TextView) view.findViewById(R.id.run_time);
				holder.mTotalTime = (TextView) view
						.findViewById(R.id.total_time);
				if (profile)
					holder.shareLinear.setVisibility(View.GONE);

				if (explore)
					if (post.getComboUserID().equals(
							(activity.util.user.getComboUserID())))
						holder.shareLinear.setVisibility(View.GONE);
				view.setTag(holder);

			} else {
				convertView = (ViewGroup) inflater.inflate(
						R.layout.newfeed_grid_list_item, parent, false);

				view = (ViewGroup) convertView;
				holder = new PostViewHolder();
				holder.userDisplayName = view
						.findViewById(R.id.userDisplayName);
				holder.postText = (TextView) view.findViewById(R.id.postText);
				holder.profiel = view.findViewById(R.id.profiel);
				holder.postImage = view.findViewById(R.id.postImage);
				holder.videoIcon = view.findViewById(R.id.videoIcon);
				view.setTag(holder);

			}
		} else {
			view = (ViewGroup) convertView;
			holder = (PostViewHolder) view.getTag();

			// ((ImageView) holder.postImage)
			// .setImageResource(R.drawable.default_imge);
		}

		if (!isFullWidth)
			view.setBackgroundColor(0x10520a76);

		if (positionExplore == 1 && isFullWidth) {
			holder.follow.setVisibility(View.VISIBLE);
			holder.postMenu.setVisibility(View.GONE);

			holder.follow.setOnClickListener(new OnClickListener() {

				@Override
				public void onClick(View v) {
					// TODO Auto-generated method stub
					// if (post.getComboUserID()) {
					holder.follow.setVisibility(View.GONE);
					notifyDataSetChanged();
					Model.instance.requestFollowFriend(post.getComboUserID(),
							userId, friendRequestListiner);

					Intent intent = new Intent(activity, ProfileActivity.class);
					intent.putExtra("ID", post.getComboUserID());
					activity.startActivity(intent);
					// }
					/*
					 * else {
					 * Model.instance.toggleFollowFriend(user.getComboUserID(),
					 * userId, friendRequestListiner); }
					 */

				}
			});
		}

		if (isFullWidth) {
			hideUneededViews(holder, post);

			if (post.isIsFavourite())
				((ImageView) holder.favourite)
						.setImageResource(R.drawable.post_favourite_added);
			else
				((ImageView) holder.favourite)
						.setImageResource(R.drawable.post_favourite);

			if (post.isIsLike())
				((ImageView) holder.like)
						.setImageResource(R.drawable.post_liked);
			else
				((ImageView) holder.like)
						.setImageResource(R.drawable.post_like);

			if (post.isIsReposted()) {
				((ImageView) holder.share)
						.setImageResource(R.drawable.share_type);
				((ImageView) holder.share)
						.setOnClickListener(shareFriendsListener);
			} else {
				((ImageView) holder.share)
						.setImageResource(R.drawable.post_repost);
				((ImageView) holder.share)
						.setOnClickListener(shareFriendsListener);
			}
			if (post.isIsCommented())
				((ImageView) holder.comment)
						.setImageResource(R.drawable.comment_type);
			else
				((ImageView) holder.comment)
						.setImageResource(R.drawable.post_comment);

			showAtachments(holder, post.getAttachments(), post);
			// setText(holder.userDisplayName, post.getComboUserName());

			setPostText(post, holder.postText, post.getPostText());

			if (post.getPostText().length() > 200)
				setPostText(post, holder.postTextMax, post.getPostText()
						+ "...[-]");
			else
				setPostText(post, holder.postTextMax, post.getPostText());

			setText(holder.time, TimeFormater.getTimeAgo(post.getPostDate()));
			setText(holder.likesCount, post.getLikes().size() + "");
			setText(holder.commentsCount, post.getCommentsCount() + "");
			setText(holder.shareCount, post.getShareCount() + "");
			holder.share.setTag(post);
			holder.share.setOnClickListener(new OnClickListener() {

				@Override
				public void onClick(final View v) {
					// TODO Auto-generated method stub
					AlertDialog.Builder builder1 = new AlertDialog.Builder(
							activity);
					builder1.setMessage("Do you want to Repost this Post ?");
					builder1.setCancelable(true);
					builder1.setPositiveButton("Yes",
							new DialogInterface.OnClickListener() {
								public void onClick(DialogInterface dialog,
										int id) {
									dialog.cancel();
									((ImageView) v)
											.setImageResource(R.drawable.share_type);
									activity.model.sharePost(
											((Post) v.getTag())
													.getComboPostID(),
											activity.util.user.getComboUserID(),
											new DefaultRequestListiner() {
												@Override
												public void requestDone(
														Object result) {
													// activity.reload();

													super.requestDone(result);
												}
											});
								}
							});
					builder1.setNegativeButton("No",
							new DialogInterface.OnClickListener() {
								public void onClick(DialogInterface dialog,
										int id) {
									dialog.cancel();
								}
							});

					AlertDialog alert11 = builder1.create();
					alert11.show();
				}
			});
			// if(isFullWidth)
			setText(holder.rankValue, post.getUserRankID() + "");

			if (post.getOriginalCreator() == 1)// means i reposted this post
												// before
												// so display my name and image
			{
				setText(holder.userDisplayName,
						activity.util.user.getUserName());
				displayProfileImage(holder.profiel,
						activity.util.user.getProfilePic());

				if (isFullWidth)
					holder.originalCreator.setVisibility(View.VISIBLE);
				else
					holder.originalCreator.setVisibility(View.GONE);
				setPostTextOriginalCreator(post, holder.originalCreator,
						post.getComboUserName() + " created this Post");
			} else {
				setText(holder.userDisplayName, post.getComboUserName());
				displayProfileImage(holder.profiel, post.getProfilePic());
			}

			holder.postText.setOnClickListener(new OnClickListener() {

				@Override
				public void onClick(View v) {
					// TODO Auto-generated method stub
					holder.postText.setVisibility(View.GONE);
					holder.postTextMax.setVisibility(View.VISIBLE);
				}
			});
			holder.postTextMax.setOnClickListener(new OnClickListener() {

				@Override
				public void onClick(View v) {
					// TODO Auto-generated method stub
					holder.postTextMax.setVisibility(View.GONE);
					holder.postText.setVisibility(View.VISIBLE);
				}
			});
		} else {
			view.setOnClickListener(new OnClickListener() {

				@Override
				public void onClick(View v) {
					// TODO Auto-generated method stub
					Intent postIntent = new Intent(activity, PostActivity.class);
					postIntent.putExtra("postId", post.getComboPostID());
					activity.startActivity(postIntent);
				}
			});
			holder.profiel.setOnClickListener(new OnClickListener() {

				@Override
				public void onClick(View v) {
					// TODO Auto-generated method stub
					Intent intent = new Intent(v.getContext(),
							ProfileActivity.class);
					intent.putExtra("ID", post.getComboUserID());
					activity.startActivity(intent);
				}
			});
			setText(holder.userDisplayName, post.getComboUserName());
			displayProfileImage(holder.profiel, post.getProfilePic());

			if (post.getAttachments().size() == 0) {
				holder.postText.setVisibility(View.VISIBLE);
				setPostText(post, holder.postText, post.getPostText());
				((ImageView) holder.postImage)
						.setImageResource(R.drawable.grid_text);
			}
			for (final Attachment attachment : post.getAttachments()) {
				switch (attachment.getAttachmentTypeID()) {
				case 1:
					displayImage(holder.postImage, attachment.getPath());
					(holder.postImage)
//							.setTag("http://www.combomobile.com.stevenm3.arvixevps.com/"
					.setTag("http://www.combomobile.com.stevenm3.arvixevps.com/comboapi/images.aspx?Image="
									+ attachment.getPath());
					holder.postText.setVisibility(View.GONE);
					break;
				case 2:
					holder.postText.setVisibility(View.GONE);
					break;
				case 3:
					holder.postText.setVisibility(View.GONE);
					holder.videoIcon.setVisibility(View.VISIBLE);
					holder.videoIcon
							.setTag("http://www.combomobile.com.stevenm3.arvixevps.com"
									+ attachment.getPath());
					displayImage(holder.postImage, attachment.getThumbsPath());

					break;

				}
			}

		}
		if (holder.share != null) {
			holder.share.setTag(post);
			holder.share.setOnClickListener(shareListener);
		}

		return view;
	}

	private void manageUserRelatedViews(View view, boolean isMyPosts) {
		view.setEnabled(!isMyPosts);
	}

	private void hideUneededViews(PostViewHolder holder, Post post) {
		(holder.visualizerView).setVisibility(View.GONE);
		(holder.postImage).setVisibility(View.GONE);
		(holder.videoIcon).setVisibility(View.GONE);
		(holder.videoView).setVisibility(View.GONE);
		(holder.progress).setVisibility(View.GONE);
		holder.originalCreator.setVisibility(View.GONE);
		(holder.playerLinear).setVisibility(View.GONE);
		if (!isFullWidth) {
			// holder.userView.setVisibility(View.GONE);
			holder.buttons.setVisibility(View.GONE);
			// if (type != 3) {
			// holder.postText.setVisibility(View.GONE);
			// } else {
			// ((TextView) holder.postText).setMaxLines(3);
			// holder.attachmentsParent.setVisibility(View.GONE);
			// }
		} else {
			setListenr(holder.share, post, shareListener);
			setListenr(holder.profiel, post, profileListener);
			setListenr(holder.like, post, likeListener);
			setListenr(holder.likesCount, post, likeFriendsListener);
			setListenr(holder.shareCount, post, shareFriendsListener);
			// setListenr(holder.shareCount, post, likeFriendsListener);
			setListenr(holder.commentAction, post, commentListener);
			setListenr(holder.favourite, post, favouriteListener);
			setListenr(holder.postMenu, post, postMenu);
			holder.buttons.setVisibility(View.VISIBLE);
			manageUserRelatedViews(holder.share,
					userId.equals(post.getComboUserID()));
		}
		// view.findViewById(R.id.surface_view).setVisibility(View.GONE);

	}

	private void setListenr(View view, Post post, OnClickListener listener) {
		view.setTag(post);
		view.setOnClickListener(listener);
	}

	private void showAtachments(final PostViewHolder holder,
			List<Attachment> attachments, Post post) {

		(holder.postImage).setOnClickListener(null);
		if (attachments == null || attachments.size() == 0) {
			// holder.postType.setVisibility(View.GONE);
			displayImage(holder.postImage, "");
			holder.postImage.setVisibility(View.GONE);
			((TextView) holder.postText).setMaxLines(3);
			if (!isFullWidth) {
				holder.attachmentsParent.setVisibility(View.GONE);

				setListenr(holder.postText, post, openPostActivity);
			}
			return;
		} else {
			((TextView) holder.postText).setMaxLines(3);
			if (isFullWidth)
				holder.postText.setVisibility(View.VISIBLE);
		}

		for (final Attachment attachment : attachments) {
			switch (attachment.getAttachmentTypeID()) {
			case 1:
				displayImage(holder.postImage, attachment.getPath());
				(holder.postImage)
									.setTag("http://www.combomobile.com.stevenm3.arvixevps.com/comboapi/images.aspx?Image="

//						.setTag("http://www.combomobile.com.stevenm3.arvixevps.com/"
								+ attachment.getPath());
				
				holder.postImage.setVisibility(View.VISIBLE);
				if (isFullWidth) {
					(holder.postImage).setOnClickListener(imageFullScreen);
					holder.postText.setVisibility(View.GONE);
				} else
					setListenr(holder.postImage, post, openPostActivity);
				// (holder.postType).setVisibility(View.VISIBLE);
				// ((ImageView) (holder.postType))
				// .setImageResource(R.drawable.camera);
				break;
			case 2:
				// View playIcon = view.findViewById(R.id.videoIcon);
				// playIcon.setVisibility(View.VISIBLE);
				// "http://combomobile.com.stevenm3.arvixevps.com/comboapi/combo.asmx"
				(holder.visualizerView)
						.setTag("http://www.combomobile.com.stevenm3.arvixevps.com/"
								+ attachment.getPath());
				if (isFullWidth) {
					// (holder.visualizerView).setOnClickListener(playAudioListener);
					(holder.playerLinear).setVisibility(View.VISIBLE);

					// AudioWife takes care of click
					// handler for play/pause button

					// AudioWife audio=new AudioWife();
					// audio.init(activity,"http://koral4u.yolasite.com/resources/%D9%86%D9%88%D8%B1%D9%8A%20%D9%8A%D8%A7%D8%B3%D9%85%D8%A7%20%28Instrumental%29.mp3").setPlayView(holder.mPlayMedia).setPauseView(holder.mPauseMedia).setSeekBar((SeekBar)holder.mMediaSeekBar).setRuntimeView((TextView)holder.mRunTime).setTotalTimeView((TextView)holder.mTotalTime);

					/*
					 * AudioWifeSpecial .getInstance() .init(activity,
					 * "http://www.combomobile.com.stevenm3.arvixevps.com/" +
					 * attachment
					 * .getPath()).setSeekBar((SeekBar)holder.mMediaSeekBar
					 * ).setRuntimeView
					 * ((TextView)holder.mRunTime).setTotalTimeView
					 * ((TextView)holder.mTotalTime);
					 */
					holder.mPlayMedia.setOnClickListener(new OnClickListener() {
						@Override
						public void onClick(View v) {
							// TODO Auto-generated method stub

							AudioWifeSpecial
									.getInstance()
									.init(activity,
											"http://www.combomobile.com.stevenm3.arvixevps.com/"
													+ attachment.getPath())
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
				} else {
					setListenr(holder.visualizerView, post, openPostActivity);
					(holder.visualizerView).setVisibility(View.GONE);
					holder.postImage.setVisibility(View.GONE);
					holder.postText.setVisibility(View.GONE);
				}

				break;
			case 3:
				final View playIcon2 = (holder.videoIcon);
				playIcon2.setTag("http://www.combomobile.com"
						+ attachment.getPath());
				(holder.postImage).setOnClickListener(null);
				playIcon2.setVisibility(View.VISIBLE);
				if (isFullWidth) {
					playIcon2.setOnClickListener(new OnClickListener() {

						@Override
						public void onClick(View v) {
							// TODO Auto-generated method stub
							Util.setAttachment(attachment);
							// Intent i=new Intent(activity,
							// VideoStreamingActivity.class);
							// activity.startActivity(i);
							Intent i = new Intent(activity,
									VideoPlayerActivity.class);
							activity.startActivity(i);
						}
					});

					// playIcon2.setOnClickListener(playVideoListener);

					// View playIcon2 = (holder.videoIcon);
					// playIcon2.setTag("http://www.combomobile.com" +
					// attachment.getPath());
					// (holder.postImage).setOnClickListener(null);
					// playIcon2.setVisibility(View.VISIBLE);

					// displayImage(holder.postImage,
					// attachment.getThumbsPath());
					// (holder.postType).setVisibility(View.VISIBLE);
					// ((ImageView)
					// (holder.postType)).setImageResource(R.drawable.video);

					// playIcon2.setOnClickListener(playVideoListener);
					/*
					 * playIcon2.setOnClickListener(new OnClickListener() {
					 * 
					 * @Override public void onClick(View v) { // TODO
					 * Auto-generated method stub
					 * holder.videoView.setVisibility(View.VISIBLE);
					 * activity.getWindow().setFormat(PixelFormat.TRANSLUCENT);
					 * MediaController mediaController = new
					 * MediaController(activity.getApplicationContext());
					 * mediaController.setAnchorView(holder.videoView);
					 * 
					 * Uri video =
					 * Uri.parse("http://www.combomobile.com.stevenm3.arvixevps.com"
					 * + attachment.getPath() );
					 * ((VideoView)holder.videoView).setMediaController
					 * (mediaController);
					 * ((VideoView)holder.videoView).setVideoURI(video);
					 * ((VideoView)holder.videoView).requestFocus();
					 * ((VideoView)holder.videoView).setOnPreparedListener(new
					 * OnPreparedListener() {
					 * 
					 * public void onPrepared(MediaPlayer mp) { //
					 * progressDialog.dismiss();
					 * playIcon2.setVisibility(View.GONE);
					 * ((VideoView)holder.videoView).start(); } });
					 * 
					 * ((VideoView)holder.videoView).setOnCompletionListener(new
					 * OnCompletionListener() {
					 * 
					 * @Override public void onCompletion(MediaPlayer mp) { //
					 * TODO Auto-generated method stub
					 * ((VideoView)holder.videoView).setVisibility(View.GONE);
					 * playIcon2.setVisibility(View.VISIBLE); } }); } });
					 */

					/*
					 * playIcon2.setOnClickListener(new OnClickListener() {
					 * 
					 * @Override public void onClick(View v) { Intent intent =
					 * new Intent(Intent.ACTION_VIEW,
					 * Uri.parse("http://www.combomobile.com.stevenm3.arvixevps.com"
					 * + attachment.getPath()));
					 * intent.setDataAndType(Uri.parse(
					 * "http://www.combomobile.com.stevenm3.arvixevps.com" +
					 * attachment.getPath()), "video/*");
					 * activity.startActivity(intent);
					 */
					// TODO Auto-generated method stub
					/*
					 * try { // Start the MediaController MediaController
					 * mediacontroller = new MediaController(currentActivity);
					 * mediacontroller.setAnchorView(holder.videoView); // Get
					 * the URL from String VideoURL Uri video =
					 * Uri.parse("http://www.combomobile.com.stevenm3.arvixevps.com"
					 * + attachment.getPath() );
					 * holder.videoView.setMediaController(mediacontroller);
					 * holder.videoView.setVideoURI(video);
					 * 
					 * } catch (Exception e) { //Log.e("Error", e.getMessage());
					 * e.printStackTrace(); }
					 * 
					 * holder.videoView.requestFocus();
					 * holder.videoView.setOnPreparedListener(new
					 * OnPreparedListener() { // Close the progress bar and play
					 * the video public void onPrepared(MediaPlayer mp) {
					 * holder.videoView.start(); } });
					 */
					// }
					// });

				} else {
					holder.postImage.setVisibility(View.GONE);
					holder.postText.setVisibility(View.GONE);
					setListenr(playIcon2, post, openPostActivity);
				}

				displayImage(holder.postImage, attachment.getThumbsPath());
				// (holder.postType).setVisibility(View.VISIBLE);
				// ((ImageView) (holder.postType))
				// .setImageResource(R.drawable.video);
				break;

			}
		}
	}

	private void updateRuntime(int currentTime, TextView mRunTime) {

		if (mRunTime == null) {
			// this view can be null if the user
			// does not want to use it. Don't throw
			// an exception.
			return;
		}

		StringBuilder playbackStr = new StringBuilder();

		// set the current time
		// its ok to show 00:00 in the UI
		playbackStr.append(String.format(
				"%02d:%02d",
				TimeUnit.MILLISECONDS.toMinutes((long) currentTime),
				TimeUnit.MILLISECONDS.toSeconds((long) currentTime)
						- TimeUnit.MINUTES.toSeconds(TimeUnit.MILLISECONDS
								.toMinutes((long) currentTime))));

		mRunTime.setText(playbackStr);

		// DebugLog.i(currentTime + " / " + totalDuration);
	}

	private void displayProfileImage(View view, String path) {
		if ("".equals(path)) {
			((ImageView) view).setImageResource(R.drawable.profile);
			return;
		}
		activity.util.loadImageByPath(
				"http://www.combomobile.com.stevenm3.arvixevps.com/comboapi/images.aspx?Image="
						+ path, ((ImageView) view), animateFirstListener);
	}

	private void displayImage(View view, String path) {
		view.setVisibility(View.VISIBLE);
		if ("".equals(path)) {
			((ImageView) view).setImageResource(R.drawable.default_post_pic);
			return;
		}
		activity.util.loadImageByPath(
				"http://www.combomobile.com.stevenm3.arvixevps.com/comboapi/images.aspx?Image="
						+ path, ((ImageView) view), animateFirstListener);
		Log.e("mytag", "http://www.combomobile.com.stevenm3.arvixevps.com/comboapi/images.aspx?Image="
				+ path);
	}

	private void setText(View view, String text) {
		((TextView) view).setText(text);

	}

	/*
	 * private void setPostText(Post post, View view, String text) { ((TextView)
	 * view).setText(text); SpannableString hashtagintitle = new
	 * SpannableString(text); if(post.getUserTagss()!=null){ for (final
	 * PostUserTag userTag : post.getUserTagss()) {
	 * 
	 * hashtagintitle.setSpan(new ClickableSpan() {
	 * 
	 * @Override public void onClick(View widget) {
	 * openProfile(widget.getContext(), userTag.getComboUserID()); } },
	 * userTag.getOffset(), userTag.getUserName().length() +
	 * userTag.getOffset(), 0); } }
	 * 
	 * if(post.getHashTags()!=null){ for (final PostHashTag hashTag :
	 * post.getHashTags()) { hashtagintitle.setSpan(new ClickableSpan() {
	 * 
	 * @Override public void onClick(View widget) {
	 * openHashTag(widget.getContext(), hashTag.getTagName()); }
	 * 
	 * }
	 * 
	 * , hashTag.getOffset(), hashTag.getTagName().length() +
	 * hashTag.getOffset(), 0); }} ((TextView)
	 * view).setMovementMethod(LinkMovementMethod.getInstance()); ((TextView)
	 * view).setText(hashtagintitle); }
	 */

	private void setPostText(Post post, View view, String text) {
		((TextView) view).setText(text);
		SpannableString hashtagintitle = new SpannableString(text);

		try {
			if (post.getUserTagss() != null && post.getUserTagss().size() > 0) {
				for (final PostUserTag userTag : post.getUserTagss()) {

					text = text.replace(userTag.getUserName(),
							"@" + userTag.getUserName());

				}
				hashtagintitle = new SpannableString(text);

				int counter = 1;
				for (final PostUserTag userTag : post.getUserTagss()) {

					hashtagintitle.setSpan(new ClickableSpan() {

						@Override
						public void onClick(View widget) {
							openProfile(widget.getContext(),
									userTag.getComboUserID());
						}
					}, userTag.getOffset(), userTag.getUserName().length()
							+ userTag.getOffset() + counter, 0);
					counter++;
				}
			}
		} catch (Exception e) {
		}

		if (text.contains("[-]") || text.contains("[+]")) {
			hashtagintitle.setSpan(new ForegroundColorSpan(Color.BLUE),
					hashtagintitle.length() - 6, hashtagintitle.length(),
					Spannable.SPAN_EXCLUSIVE_EXCLUSIVE);
		}
		if (post.getHashTags() != null) {
			for (final PostHashTag hashTag : post.getHashTags()) {
				hashtagintitle.setSpan(new ClickableSpan() {

					@Override
					public void onClick(View widget) {
						openHashTag(widget.getContext(), hashTag.getTagName());
					}

				}

				, hashTag.getOffset(),
						hashTag.getTagName().length() + hashTag.getOffset(), 0);
			}
		}
		((TextView) view).setMovementMethod(LinkMovementMethod.getInstance());
		((TextView) view).setText(hashtagintitle);
	}

	private void setPostTextOriginalCreator(final Post post, View view,
			String text) {
		((TextView) view).setText(text);
		SpannableString hashtagintitle = new SpannableString(text);

		try {

			text = text.replace(post.getComboUserName(),
					"@" + post.getComboUserName());

			hashtagintitle = new SpannableString(text);

			int counter = 1;

			hashtagintitle.setSpan(new ClickableSpan() {

				@Override
				public void onClick(View widget) {
					openProfile(widget.getContext(), post.getComboUserID());
				}
			}, 0, post.getComboUserName().length() + 0 + counter, 0);

		} catch (Exception e) {
		}

		if (post.getHashTags() != null) {
			for (final PostHashTag hashTag : post.getHashTags()) {
				hashtagintitle.setSpan(new ClickableSpan() {

					@Override
					public void onClick(View widget) {
						openHashTag(widget.getContext(), hashTag.getTagName());
					}

				}

				, hashTag.getOffset(),
						hashTag.getTagName().length() + hashTag.getOffset(), 0);
			}
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

	public void addPosts(ArrayList<Post> posts) {
		if (posts.size() > 0) {
			this.posts = new ArrayList<Post>();
			this.posts.addAll(posts);
			notifyDataSetChanged();
		}
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
		public void onClick(final View v) {

			if (((Post) v.getTag()).isIsLike()) {
				((ImageView) v).setImageResource(R.drawable.post_like);
			} else {
				((ImageView) v).setImageResource(R.drawable.post_liked);
			}
			activity.model.toggleLikePostByID(
					((Post) v.getTag()).getComboPostID(),
					activity.util.user.getComboUserID(),
					new DefaultRequestListiner() {
						@Override
						public void requestDone(Object result) {
							activity.reload();
							super.requestDone(result);
						}
					});
		}
	}

	public class LikeFriendsPostListner implements OnClickListener {
		@Override
		public void onClick(View v) {
			if (((Post) v.getTag()).getLikes().size() > 0)
				new FriendsPostDialog(true,
						((Post) v.getTag()).getComboPostID(), activity,
						activity.util.user.getComboUserID()).show();
		}
	}

	public class ShareFriendsPostListner implements OnClickListener {
		@Override
		public void onClick(View v) {
			if (((Post) v.getTag()).getLikes().size() > 0)
				new FriendsPostDialog(false,
						((Post) v.getTag()).getComboPostID(), activity,
						activity.util.user.getComboUserID()).show();
		}
	}

	public class FavouritePostListner implements OnClickListener {

		@Override
		public void onClick(View v) {
			if (((Post) v.getTag()).isIsFavourite()) {
				((ImageView) v).setImageResource(R.drawable.post_favourite);
			} else {
				((ImageView) v)
						.setImageResource(R.drawable.post_favourite_added);
			}

			activity.model.toggleFavouritePostByID(
					((Post) v.getTag()).getComboPostID(),
					activity.util.user.getComboUserID(),
					new DefaultRequestListiner() {
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
		public void onClick(final View v) {

			AlertDialog.Builder builder1 = new AlertDialog.Builder(activity);
			builder1.setMessage("Do you want to Repost this Post ?");
			builder1.setCancelable(true);
			builder1.setPositiveButton("Yes",
					new DialogInterface.OnClickListener() {
						public void onClick(DialogInterface dialog, int id) {
							dialog.cancel();
							((ImageView) v)
									.setImageResource(R.drawable.share_type);
							activity.model.sharePost(
									((Post) v.getTag()).getComboPostID(),
									activity.util.user.getComboUserID(),
									new DefaultRequestListiner() {
										@Override
										public void requestDone(Object result) {
											// activity.reload();

											super.requestDone(result);
										}
									});
						}
					});
			builder1.setNegativeButton("No",
					new DialogInterface.OnClickListener() {
						public void onClick(DialogInterface dialog, int id) {
							dialog.cancel();
						}
					});

			AlertDialog alert11 = builder1.create();
			alert11.show();

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

	public class ProfileListener implements OnClickListener {

		@Override
		public void onClick(View v) {

			Intent intent = new Intent(v.getContext(), ProfileActivity.class);
			intent.putExtra("ID", ((Post) v.getTag()).getComboUserID());
			v.getContext().startActivity(intent);

		}

	}

	public class OpenPostActivity implements OnClickListener {

		@Override
		public void onClick(View view) {

			Intent postIntent = new Intent(view.getContext(),
					PostActivity.class);
			postIntent.putExtra("postId",
					((Post) view.getTag()).getComboPostID());
			view.getContext().startActivity(postIntent);
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
				postPopupMenu.setActivity(activity);
				postPopupMenu.show();
				menuOpened = true;
			} else {
				if (postPopupMenu == null) {
					postPopupMenu = new PostPopupMenu(activity, v,
							((Post) v.getTag()));
					postPopupMenu.setActivity(activity);
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
				postPopupMenu.setActivity(activity);
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

	public void setType(int type) {
		this.type = type;

	}

	private RequestListiner friendRequestListiner = new RequestListiner() {

		public void requestDone(Object result) {

		}

		@Override
		public void requestError(String result) {
		}

		@Override
		public void requestError(int errorResource) {
		}
	};
}
