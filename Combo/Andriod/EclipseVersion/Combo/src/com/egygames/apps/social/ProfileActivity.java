package com.egygames.apps.social;

import java.util.ArrayList;

import android.annotation.TargetApi;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.Matrix;
import android.graphics.drawable.BitmapDrawable;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.support.v4.app.Fragment;
import android.support.v7.widget.DefaultItemAnimator;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.text.ClipboardManager;
import android.text.Html;
import android.text.method.LinkMovementMethod;
import android.util.Log;
import android.view.DragEvent;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuItem;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnDragListener;
import android.view.View.OnHoverListener;
import android.view.View.OnTouchListener;
import android.view.ViewGroup;
import android.widget.AbsListView;
import android.widget.AbsListView.OnScrollListener;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.PopupWindow.OnDismissListener;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

import com.combomobile.R;
import com.egygames.apps.social.adapter.PostsTypeListAdapter;
import com.egygames.apps.social.entity.Post;
import com.egygames.apps.social.entity.User;
import com.egygames.apps.social.floating.DividerItemDecoration;
import com.egygames.apps.social.floating.FloatingActionButton;
import com.egygames.apps.social.floating.ObservableScrollView;
import com.egygames.apps.social.floating.RecyclerViewAdapter;
import com.egygames.apps.social.model.DefaultRequestListiner;
import com.egygames.apps.social.model.Model;
import com.egygames.apps.social.model.RequestListiner;
import com.egygames.apps.social.utils.SystemUiHider;
import com.egygames.apps.social.views.ExpandableHeightGridView;
import com.egygames.apps.social.views.HomePopupMenu;
import com.egygames.apps.social.views.ViewTypePopupMenu;
import com.egygames.apps.social.views.util.Util;
import com.nostra13.universalimageloader.core.ImageLoader;
import com.nostra13.universalimageloader.core.listener.SimpleImageLoadingListener;

public class ProfileActivity extends BaseActivity implements RequestListiner {

	private User user;
	private String userId;
	private boolean otherUser;
	ScrollView scrollview;
	private ExpandableHeightGridView feedGrid, feedList;
	private int currentPage;
	private PostsTypeListAdapter adapterGrid, adapterList;
	private boolean isGrid = false;
	private ImageButton listGridView2;
public String getId(){
	return this.userId;
}
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_profile);
		disableTab(R.id.profile);


        final View controlsView = findViewById(R.id.fullscreen_content_controls);
        final View contentView = findViewById(R.id.fullscreen_content);

       
        scrollview=(ScrollView) findViewById(R.id.scrollview);
        

        // Upon interacting with UI controls, delay any scheduled hide()
        // operations to prevent the jarring behavior of controls going away
        // while interacting with the UI.
        findViewById(R.id.fab).setOnClickListener(mDelayHideTouchListener);
		showProgress();
		
		if (getIntent().hasExtra("ID")) {
			userId = getIntent().getStringExtra("ID");
			otherUser = !userId.equalsIgnoreCase(util.user.getComboUserID());

		} else
			userId = util.user.getComboUserID();

		if (otherUser) {
			findViewById(R.id.back).setVisibility(View.VISIBLE);
			findViewById(R.id.back).setOnClickListener(new OnClickListener() {

				@Override
				public void onClick(View v) {
					// TODO Auto-generated method stub
					finish();
				}
			});
		}
		feedList = (ExpandableHeightGridView) findViewById(R.id.feedsListView);
		feedList.setExpanded(true);
		adapterList = new PostsTypeListAdapter(this, feedList, this,-1);
		feedList.setAdapter(adapterList);
		feedList.setVerticalScrollBarEnabled(false);
feedList.setOnTouchListener(new OnTouchListener() {
    // Setting on Touch Listener for handling the touch inside ScrollView
    @Override
    public boolean onTouch(View v, MotionEvent event) {
    // Disallow the touch request for parent scroll on touch of child view
    v.getParent().requestDisallowInterceptTouchEvent(false);
   
    return false;
    }
});
scrollview.setOnTouchListener(new View.OnTouchListener() {

    public boolean onTouch(View v, MotionEvent event) {
        Log.v("PARENT", "PARENT TOUCH");
        v.getParent()
                .requestDisallowInterceptTouchEvent(true);
        return false;
    }
});
		feedList.setOnScrollListener(new OnScrollListener() {
			
			@Override
			public void onScrollStateChanged(AbsListView view, int scrollState) {
				// TODO Auto-generated method stub
				Log.d("testtt", ""+scrollState);
				if (TOGGLE_ON_CLICK) {
		              mSystemUiHider.toggle();
		          } else {
		              mSystemUiHider.show();
		          }
			}
			
			@Override
			public void onScroll(AbsListView view, int firstVisibleItem,
					int visibleItemCount, int totalItemCount) {
				// TODO Auto-generated method stub
				Log.d("testt", ""+visibleItemCount);
			}
		});
       

		adapterList.setFullWidth(true);
		feedGrid = (ExpandableHeightGridView) findViewById(R.id.feedsGridView);
		feedGrid.setExpanded(true);
		adapterGrid = new PostsTypeListAdapter(this, feedGrid, this,-1);
		feedGrid.setAdapter(adapterGrid);
		feedGrid.setVerticalScrollBarEnabled(false);
		// method = "GetUserPosts";
		 // Set up an instance of SystemUiHider to control the system UI for
        // this activity.
        mSystemUiHider = SystemUiHider.getInstance(this, feedList, HIDER_FLAGS);
        mSystemUiHider.setup();
        mSystemUiHider
                .setOnVisibilityChangeListener(new SystemUiHider.OnVisibilityChangeListener() {
                    // Cached values.
                    int mControlsHeight;
                    int mShortAnimTime;

                    @Override
                    @TargetApi(Build.VERSION_CODES.HONEYCOMB_MR2)
                    public void onVisibilityChange(boolean visible) {
                        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.HONEYCOMB_MR2) {
                            // If the ViewPropertyAnimator API is available
                            // (Honeycomb MR2 and later), use it to animate the
                            // in-layout UI controls at the bottom of the
                            // screen.
                            if (mControlsHeight == 0) {
                                mControlsHeight = controlsView.getHeight();
                            }
                            if (mShortAnimTime == 0) {
                                mShortAnimTime = getResources().getInteger(
                                        android.R.integer.config_shortAnimTime);
                            }
                            controlsView.animate()
                                    .translationY(visible ? 0 : mControlsHeight)
                                    .setDuration(mShortAnimTime);
                        } else {
                            // If the ViewPropertyAnimator APIs aren't
                            // available, simply show or hide the in-layout UI
                            // controls.
                            controlsView.setVisibility(visible ? View.VISIBLE : View.GONE);
                        }

                        if (visible && AUTO_HIDE) {
                            // Schedule a hide().
                            delayedHide(AUTO_HIDE_DELAY_MILLIS);
                        }
                    }
                });

        // Set up the user interaction to manually show or hide the system UI.
        contentView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
        	
        	
        
            }
        });
		/////////////
		setNotificationsAndMessagesCount();
		isGrid = false;
		currentPage = 0;
		findViewById(R.id.iv_category).setBackgroundResource(
				R.drawable.grid_icon);
		// listGridView2.setImageResource(R.drawable.grid_icon_explore);
		adapterList = new PostsTypeListAdapter(this, feedList, this,-1);
		adapterList.setFullWidth(true);
		feedList.setAdapter(adapterList);
		reload();
		showProgress();
		// model.getUserFullProfile(util.user.getComboUserID(), userId, this);
		init();
	}

	private ImageButton more;
	private boolean isMoreOpened = false;
	private HomePopupMenu popup;

	public void more(View v) {

		more = (ImageButton) v;
		if (isMoreOpened) {
			dismissMore();
		} else {
			more.setImageResource(R.drawable.more_icon_expanded);
			if (popup != null)
				popup.show();

			else {
				if(otherUser)
					popup = new HomePopupMenu(this, v, true);
				else
					popup = new HomePopupMenu(this, v, false);
				popup.setOnDismissListener(new OnDismissListener() {
					@Override
					public void onDismiss() {
						isMoreOpened = false;
						more.setImageResource(R.drawable.more_icon);
					}
				});
			}
		}

		isMoreOpened = !isMoreOpened;

	}

	public void blockAction(View v) {
		Model.instance.toggleBlockFriend(Util.instance.user.getComboUserID(), userId, new DefaultRequestListiner() {
			@Override
			public void requestDone(Object result) {
				Toast.makeText(getApplicationContext(), "User blocked successFully", Toast.LENGTH_LONG).show();
					finish();
				super.requestDone(result);
			}
		});
		Toast.makeText(getApplicationContext(), "You will not see this user again", Toast.LENGTH_LONG).show();
		dismissMore();
	}

	public void reportAction(View v) {
		new ReportPostDialog(userId, this,"user",util.user.getComboUserID()).show();
		dismissMore();
	}

	public void copyAction(View v) {
		ClipboardManager clipboard = (ClipboardManager) getSystemService(CLIPBOARD_SERVICE);
		clipboard.setText(userId);
		dismissMore();
	}

	private void dismissMore() {
		isMoreOpened = false;
		more.setImageResource(R.drawable.more_icon);
		popup.dismiss();
	}

	private void init() {

		method = "GetUserPosts";
		
		model.getUserFullProfile(util.user.getComboUserID(), userId, this);
	}

	private void displayImage(int viewId, String path) {
		if ("".equals(path)) {
			((ImageView) findViewById(viewId))
					.setImageResource(R.drawable.profile);
			return;
		}
		util.loadImageByPath(
				"http://www.combomobile.com/comboapi/images.aspx?Image=" + path,
				((ImageView) findViewById(viewId)), null);

	}

	private void displayCoverImage(final int viewId, String path) {
		if ("".equals(path)) {
			return;
		}
		ImageLoader.getInstance()
				.loadImage(
						"http://www.combomobile.com/comboapi/images.aspx?Image="
								+ path, util.options,
						new SimpleImageLoadingListener() {
							@Override
							public void onLoadingComplete(String imageUri,
									View view, Bitmap loadedImage) {

								super.onLoadingComplete(imageUri, view,
										loadedImage);
								findViewById(viewId).setBackgroundDrawable(
										new BitmapDrawable(loadedImage));
							}
						});
	}

	public void list(View v) {
		// showProgress();

		//
		if (!isGrid) {
			isGrid = true;
			currentPage = 0;
			// listGridView2.setImageResource(R.drawable.list_icon_explore);
			findViewById(R.id.iv_category).setBackgroundResource(
					R.drawable.list_icon);
			feedGrid.setNumColumns(3);
			adapterGrid.setFullWidth(false);
			findViewById(R.id.feedsGridView).setVisibility(View.GONE);
			findViewById(R.id.feedsListView).setVisibility(View.GONE);
			rreload();

		} else {
			isGrid = false;
			currentPage = 0;
			findViewById(R.id.iv_category).setBackgroundResource(
					R.drawable.grid_icon);
			// listGridView2.setImageResource(R.drawable.grid_icon_explore);
			adapterList = new PostsTypeListAdapter(this, feedList, this,-1);
			adapterList.setFullWidth(true);
			//feedList.setAdapter(adapterList);
			findViewById(R.id.feedsGridView).setVisibility(View.GONE);
			findViewById(R.id.feedsListView).setVisibility(View.GONE);
		rreload();
		}
	}

	private void rreload() {
		adapterGrid.setType(type);
	//	adapterGrid.notifyDataSetChanged();

		//adapterList.resetPosts();
		adapterList.setType(type);
	//	adapterList.notifyDataSetChanged();
		if (menuOpened)
			popupMenu.dismiss();
		// TODO Auto-generated method stub
		
		findViewById(R.id.profileImage).requestFocus();

		if (!isGrid) {
			findViewById(R.id.feedsGridView).setVisibility(View.GONE);
			findViewById(R.id.feedsListView).setVisibility(View.VISIBLE);
		} else {
			findViewById(R.id.feedsGridView).setVisibility(View.VISIBLE);
			findViewById(R.id.feedsListView).setVisibility(View.GONE);
		}
	}
	public void grid(View v) {
		// adapter.setFullWidth(false);
		// feedListView.setNumColumns(3);
	}

	public void editProfile(View v) {
		startActivity(new Intent(this, EditProfileActivity.class));
	}

	/*
	 * public void addFriend(View v) {
	 * model.addFriend(util.user.getComboUserID(), userId,
	 * friendRequestListiner); }
	 * 
	 * public void unFriend(View v) {
	 * model.removeFriend(util.user.getComboUserID(), userId,
	 * friendRequestListiner); }
	 * 
	 * public void acceptFriendRequest(View v) {
	 * model.respondToFriendRequest(userId, util.user.getComboUserID(), true,
	 * friendRequestListiner); }
	 * 
	 * public void rejectFriendRequest(View v) {
	 * model.respondToFriendRequest(userId, util.user.getComboUserID(), false,
	 * friendRequestListiner); }
	 */

	public void acceptFollowRequest(View v) {
		model.respondToFollowRequest("-1", util.user.getComboUserID(),
				user.getComboUserID(), true, friendRequestListiner);
		showProgress();

	}

	public void rejectFollowRequest(View v) {
		model.respondToFollowRequest("-1", util.user.getComboUserID(),
				user.getComboUserID(), false, friendRequestListiner);
		showProgress();

	}

	public void openChat(View v) {
		//startActivity(new Intent(this, MessagesListActivity.class));
		chat(null);
	}

	public void follow(View v) {
		if (user.getIsPrivateAccount()) {
			model.requestFollowFriend(user.getComboUserID(),
					util.user.getComboUserID(), friendRequestListiner);
		} else {
			model.toggleFollowFriend(user.getComboUserID(),
					util.user.getComboUserID(), friendRequestListiner);
		}
		showProgress();

	}

	public void unfollow(View v) {
		Util.setSetCurrentUser(user);
		// model.toggleFollowFriend(util.user.getComboUserID(), userId,
		// friendRequestListiner);
		Intent i = new Intent(ProfileActivity.this,
				UnFollowDialogActivity.class);
		i.putExtra("followerid", userId);
		i.putExtra("userid", util.user.getComboUserID());
		startActivity(i);
		// showProgress();
	}

	@Override
	public void requestDone(Object result) {
		hideProgress();
		hideView(R.id.linear_follow_request);
		// hideView(R.id.linear_follow_edit);
		hideView(R.id.follow);
		hideView(R.id.unfollow);
		hideView(R.id.request_sent);
		user = ((ArrayList<User>) result).get(0);
		util.otherUser = user;
		if (otherUser) {
			// if (user.getIsFriend()) {
			// showView(R.id.unFriend);
			// } else {
			if (user.getIsFollowerRequestSent()) {
				// showView(R.id.linear_follow_edit);
				showView(R.id.linear_follow_request);
			}
			// Now with pirority to show following button if already
			// following,then request send then follow button
			if (user.getIsFollowing()) {
				// showView(R.id.linear_follow_edit);
				// showView(R.id.img_followed);
				showView(R.id.unfollow);
			} else if (user.getIsFollowingRequestSent()) {
				// showView(R.id.linear_follow_edit);
				showView(R.id.request_sent);
			} else {
				// showView(R.id.linear_follow_edit);
				showView(R.id.follow);
			}

			/*
			 * if (user.getFriendRequestSent() == 0) {
			 * //showView(R.id.addAsFriend);
			 * 
			 * } else if (user.getFriendRequestSent() == 2) {
			 * //showView(R.id.acceptFriendRequest);
			 * //showView(R.id.rejectFriendRequest); }
			 */
			// }
			/*
			 * if (!user.getIsFollower()) { showView(R.id.linear_follow_edit);
			 * showView(R.id.follow); } else {
			 * showView(R.id.linear_follow_edit); showView(R.id.unfollow); }
			 */

		} else {
			// showView(R.id.linear_follow_edit);
			showView(R.id.editProfile);
		}
		if (!otherUser) {
			util.saveUser(user);
		}
		displayImage(R.id.profileImage, user.getProfilePic());
		if (!(user.getCountryFlagPath() == null || user.getCountryFlagPath()
				.equals(""))) {
			ImageLoader.getInstance().displayImage(
					"http://www.combomobile.com/" + user.getCountryFlagPath(),
					((ImageView) findViewById(R.id.countryFlag)), util.options,
					new SimpleImageLoadingListener() {

						@Override
						public void onLoadingComplete(String imageUri,
								View view, Bitmap origImage) {
							int oldWidth = origImage.getWidth();
							int oldHeight = origImage.getHeight();

							int newWidth = view.getWidth(); //

							// calculate the scale
							float scaleWidth = ((float) newWidth) / oldWidth;

							// create a matrix for the manipulation
							Matrix matrix = new Matrix();
							// resize the bit map
							matrix.postScale(scaleWidth, scaleWidth);

							// recreate the new scaled Bitmap
							Bitmap newImage = Bitmap.createBitmap(origImage, 0,
									0, oldWidth, oldHeight, matrix, true);
							((ImageView) view).setImageBitmap(newImage);
							// super.onLoadingComplete(imageUri, view,
							// loadedImage);
						}

					});
		}

		displayCoverImage(R.id.coverPhoto, user.getCoverPic());
		setText(R.id.postsCount, "" + user.getPostsCount());
		setText(R.id.flowersCount, "" + user.getFollowingCount());
		setText(R.id.following, "" +user.getFollowersCount() );
		// setText(R.id.likesCount, "" + user.getProfileLikerCount());
		setText(R.id.likesCount, "" + user.getPostsLikeCount());
		setText(R.id.rankingCount, "" + user.getUserRankID());
		setText(R.id.userUserName, "" + user.getDisplayName());
		setText(R.id.bio, "" + user.getBio());
		setTitle(user.getUserName());

		if (user.getIsPrivateAccount() && otherUser && !user.getIsFriend()) {
			showView(R.id.privateAccountTv);
			hideView(R.id.viewType);
			hideView(feedList);
			hideView(feedGrid);
		} else {
			// model.getPostsByType(userId, 0, method, userPostsListiner);
			reload();
		}

	}

	@Override
	protected void onResume() {
		super.onResume();
		
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

	private RequestListiner friendRequestListiner = new RequestListiner() {

		public void requestDone(Object result) {
			//showError(R.string.friendRequestDone);
			/*
			 * Intent intent=new
			 * Intent(ProfileActivity.this,ProfileActivity.class);
			 * intent.putExtra("ID", userId); startActivity(intent);
			 * 
			 * finish();
			 */
			// model.getUserFullProfile(util.user.getComboUserID(), userId,
			// this);
			init();

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

	private RequestListiner userPostsListiner = new RequestListiner() {

		@Override
		public void requestDone(Object result) {
			hideProgress();
			ArrayList<Post> posts = (ArrayList<Post>) result;
			
			if (posts.size() == 0) {
				// showView(findViewById(R.id.noData));
				adapterGrid.resetPosts();
				adapterGrid.addPosts(posts);
				// hideView(findViewById(R.id.noData));
				adapterGrid.notifyDataSetChanged();

				adapterList.resetPosts();
				adapterList.addPosts(posts);
				// hideView(findViewById(R.id.noData));
				adapterList.notifyDataSetChanged();
				return;
			}
			adapterGrid.resetPosts();
			adapterGrid.addPosts(posts);
			// hideView(findViewById(R.id.noData));
			adapterGrid.notifyDataSetChanged();

			adapterList.resetPosts();
			adapterList.addPosts(posts);
			// hideView(findViewById(R.id.noData));
			adapterList.notifyDataSetChanged();
			findViewById(R.id.profileImage).requestFocus();

			if (!isGrid) {
				findViewById(R.id.feedsGridView).setVisibility(View.GONE);
				findViewById(R.id.feedsListView).setVisibility(View.VISIBLE);
			} else {
				findViewById(R.id.feedsGridView).setVisibility(View.VISIBLE);
				findViewById(R.id.feedsListView).setVisibility(View.GONE);
			}
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

	private String method;
	private int type;

	public void displayAll() {
		type = 4;
		method = "GetUserPosts";
		reload();
	}

	public void displayUserPhotos() {
		type = 0;
		method = "GetPhotoPosts";
		reload();
	}

	public void displayUserVideos() {
		type = 1;
		method = "GetVedioPosts";
		reload();
	}

	public void displayUserAudios() {
		type = 2;
		method = "GetAudioPosts";
		reload();
	}

	public void displayUserText() {
		type = 3;
		method = "GetTextPosts";
		reload();
	}

	@Override
	public void reload() {
		showProgress();

	//	adapterGrid.resetPosts();
		adapterGrid.setType(type);
		//adapterGrid.notifyDataSetChanged();

		//adapterList.resetPosts();
		adapterList.setType(type);
	//	adapterList.notifyDataSetChanged();
		model.getPostsByType(userId, 0, method, userPostsListiner);
		if (menuOpened)
			popupMenu.dismiss();
	}

	private ViewTypePopupMenu popupMenu;
	private boolean menuOpened;

	public void popupMenu(View v) {

		if (menuOpened) {
			popupMenu.dismiss();
			popupMenu.setAnchor(v);
			popupMenu.show();
			menuOpened = true;
		} else {
			if (popupMenu == null) {
				popupMenu = new ViewTypePopupMenu(this, v);
				popupMenu.setOnDismissListener(new OnDismissListener() {
					@Override
					public void onDismiss() {
						menuOpened = false;

					}
				});
			}

			popupMenu.setAnchor(v);
			popupMenu.show();
			menuOpened = true;
		}

	}

	public void messages(View v) {
		startActivity(new Intent(this, MessagesListActivity.class));

	}

	public void location(View v) {
		try {
			String location = util.user.getLocation();
			String[] longAndLat = location.split(",");
			Intent intent = new Intent(this, MapActivity.class);
			intent.putExtra("lat", longAndLat[0]);
			intent.putExtra("long", longAndLat[1]);
			startActivity(intent);
		} catch (Exception ex) {
			showError("Can't show the user location");
		}
	}
    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.main, menu);
        return super.onCreateOptionsMenu(menu);
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        if (item.getItemId() == R.id.about) {
            TextView content = (TextView) getLayoutInflater().inflate(R.layout.about_view, null);
            content.setMovementMethod(LinkMovementMethod.getInstance());
            content.setText(Html.fromHtml(getString(R.string.about_body)));
            new AlertDialog.Builder(this)
                    .setTitle(R.string.about)
                    .setView(content)
                    .setInverseBackgroundForced(true)
                    .setPositiveButton(android.R.string.ok, new DialogInterface.OnClickListener() {
                        @Override
                        public void onClick(DialogInterface dialog, int which) {
                            dialog.dismiss();
                        }
                    }).create().show();
        }
        return super.onOptionsItemSelected(item);
    }

	public void openFollowers(View view) {
		Intent intent = new Intent(this, ProfilesListActivity.class);
		intent.putExtra("method", "GetProfileFollowers");
		intent.putExtra("id", userId);
		startActivity(intent);
	}

	public void openFollowings(View view) {
		Intent intent = new Intent(this, ProfilesListActivity.class);
		intent.putExtra("method", "GetProfileFollowing");
		intent.putExtra("id", userId);
		startActivity(intent);

	}

	public void userLevels(View view) {
		Intent intent = new Intent(this, UserLevelActivity.class);
		intent.putExtra("FollowingCount", user.getFollowingCount());
		intent.putExtra("FollowersCount", user.getFollowersCount());
		intent.putExtra("PostsCount", user.getPostsCount());
		intent.putExtra("ProfileLikerCount", user.getProfileLikerCount());
		intent.putExtra("CommentsCount", user.getCommentsCount());
		intent.putExtra("TotalActivityDays", user.getTotalActivityDays());
		intent.putExtra("id", userId);
		startActivity(intent);

	}
	
	//Floating Action Button


	public static class RecyclerViewFragment extends Fragment {
        @Override
        public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
            View root = inflater.inflate(R.layout.fragment_recyclerview, container, false);

            RecyclerView recyclerView = (RecyclerView) root.findViewById(R.id.recycler_view);
            recyclerView.setHasFixedSize(true);
            recyclerView.setItemAnimator(new DefaultItemAnimator());
            recyclerView.setLayoutManager(new LinearLayoutManager(getActivity()));
            recyclerView.addItemDecoration(new DividerItemDecoration(getActivity(), DividerItemDecoration.VERTICAL_LIST));

            RecyclerViewAdapter adapter = new RecyclerViewAdapter(getActivity(), getResources()
                    .getStringArray(R.array.countries));
            recyclerView.setAdapter(adapter);

            //ImageView fab = (ImageView) root.findViewById(R.id.fab);
           // fab.attachToRecyclerView(recyclerView);

            return root;
        }
    }

    public static class ScrollViewFragment extends Fragment {
        @Override
        public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
            View root = inflater.inflate(R.layout.fragment_scrollview, container, false);

            ObservableScrollView scrollView = (ObservableScrollView) root.findViewById(R.id.scroll_view);
            LinearLayout list = (LinearLayout) root.findViewById(R.id.list);

            String[] countries = getResources().getStringArray(R.array.countries);
            for (String country : countries) {
                TextView textView = (TextView) inflater.inflate(R.layout.list_item, container, false);
                String[] values = country.split(",");
                String countryName = values[0];
                int flagResId = getResources().getIdentifier(values[1], "drawable", getActivity().getPackageName());
                textView.setText(countryName);
                textView.setCompoundDrawablesWithIntrinsicBounds(flagResId, 0, 0, 0);

                list.addView(textView);
            }

//            FloatingActionButton fab = (FloatingActionButton) root.findViewById(R.id.fab);
//            fab.attachToScrollView(scrollView);

            return root;
        }
    }
    
    

    /**
     * Whether or not the system UI should be auto-hidden after
     * {@link #AUTO_HIDE_DELAY_MILLIS} milliseconds.
     */
    private static final boolean AUTO_HIDE = true;

    /**
     * If {@link #AUTO_HIDE} is set, the number of milliseconds to wait after
     * user interaction before hiding the system UI.
     */
    private static final int AUTO_HIDE_DELAY_MILLIS = 3000;

    /**
     * If set, will toggle the system UI visibility upon interaction. Otherwise,
     * will show the system UI visibility upon interaction.
     */
    private static final boolean TOGGLE_ON_CLICK = true;

    /**
     * The flags to pass to {@link SystemUiHider#getInstance}.
     */
    private static final int HIDER_FLAGS = SystemUiHider.FLAG_HIDE_NAVIGATION;

    /**
     * The instance of the {@link SystemUiHider} for this activity.
     */
    private SystemUiHider mSystemUiHider;

  

    @Override
    protected void onPostCreate(Bundle savedInstanceState) {
        super.onPostCreate(savedInstanceState);

        // Trigger the initial hide() shortly after the activity has been
        // created, to briefly hint to the user that UI controls
        // are available.
        delayedHide(0);
    }


    /**
     * Touch listener to use for in-layout UI controls to delay hiding the
     * system UI. This is to prevent the jarring behavior of controls going away
     * while interacting with activity UI.
     */
    View.OnClickListener mDelayHideTouchListener = new View.OnClickListener() {
        @Override
        public void onClick(View view) {
            if (AUTO_HIDE) {
                delayedHide(AUTO_HIDE_DELAY_MILLIS);
             //   Toast.makeText(ProfileActivity.this, "test", 2000).show();
                startActivity(new Intent(ProfileActivity.this, choosePostActivity.class));
                
            }
            
        }

    };

    Handler mHideHandler = new Handler();
    Runnable mHideRunnable = new Runnable() {
        @Override
        public void run() {
            //mSystemUiHider.hide();
        }
    };

    /**
     * Schedules a call to hide() in [delay] milliseconds, canceling any
     * previously scheduled calls.
     */
    private void delayedHide(int delayMillis) {
        mHideHandler.removeCallbacks(mHideRunnable);
        mHideHandler.postDelayed(mHideRunnable, delayMillis);
    }



}
