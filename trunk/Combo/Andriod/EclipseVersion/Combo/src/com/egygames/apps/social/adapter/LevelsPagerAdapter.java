package com.egygames.apps.social.adapter;

import java.util.ArrayList;

import android.content.Context;
import android.os.AsyncTask;
import android.os.Handler;
import android.os.Parcelable;
import android.support.v4.view.ViewPager;
import android.support.v4.view.ViewPager.LayoutParams;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.GridView;
import android.widget.ProgressBar;

import com.combomobile.R;
import com.egygames.apps.social.BaseActivity;
import com.egygames.apps.social.entity.Post;
import com.egygames.apps.social.model.Model;
import com.egygames.apps.social.model.RequestListiner;
import com.egygames.apps.social.views.util.Util;
import com.handmark.pulltorefresh.library.PullToRefreshBase;
import com.handmark.pulltorefresh.library.PullToRefreshBase.Mode;
import com.handmark.pulltorefresh.library.PullToRefreshBase.OnRefreshListener2;
import com.handmark.pulltorefresh.library.PullToRefreshGridView;
import com.handmark.pulltorefresh.library.PullToRefreshListView;

public class LevelsPagerAdapter extends android.support.v4.view.PagerAdapter{

	private BaseActivity activity;
	/*private ArrayList<Levels> levels;
	private Activity activity;
	private PinnedHeaderListView listView;
	private ArrayList<Day[]> allLevelsList;*/
	private View views[];
	private String userId;
	private boolean isGrid;

	int currentPage0=0,currentPage1=0,currentPage2=0;

	public LevelsPagerAdapter(BaseActivity activity,boolean isGrid
			//, ArrayList<Levels> levelsList,
			//ArrayList<Day[]> allLevelsList
			) {
		this.activity = activity;
		this.isGrid=isGrid;
		this.userId=activity.util.user.getComboUserID();
		model = Model.getInstance(activity);
		//this.levels = levelsList;
	//	this.allLevelsList = allLevelsList;
         views = new View[3];
	}

	@Override
	public int getCount() {
		//return levels.size();
		return 3;
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public Object instantiateItem(ViewGroup container, final int position) {
		 if (views[position] != null) {
		 ((ViewPager) container).addView(views[position]);
		 return views[position];
		 }
		View view = null;
		
		Context context = container.getContext();

		final PullToRefreshListView mPullRefreshListView;
		final PullToRefreshGridView mPullRefreshGridView ;
		
		view=LayoutInflater.from(context).inflate(
				R.layout.activity_ptr_viewpager, container, false);
		
		final ProgressBar progress=(ProgressBar)view.findViewById(R.id.progressBar1);
		
		mPullRefreshGridView = (PullToRefreshGridView) view.findViewById(R.id.pull_refresh_grid);
		mPullRefreshListView = (PullToRefreshListView) view.findViewById(R.id.pull_refresh_viewpager);
		 
		((ViewPager) container).addView(view);
		views[position] = view;
		
		if(isGrid)
		{
			mPullRefreshGridView.setVisibility(View.VISIBLE);
			mPullRefreshListView.setVisibility(View.GONE);
		}
		else
		{
			mPullRefreshGridView.setVisibility(View.GONE);
			mPullRefreshListView.setVisibility(View.VISIBLE);
		}
		
		
		
		final PostsTypeListAdapter adapterGrid = new PostsTypeListAdapter(activity, mPullRefreshGridView,activity,position);
		mPullRefreshGridView.setMode(Mode.BOTH);
		adapterGrid.setFullWidth(false);
		mPullRefreshGridView.setAdapter(adapterGrid);
		
	   final PostsTypeListAdapter adapterList = new PostsTypeListAdapter(activity, mPullRefreshListView,activity,position);
	   mPullRefreshListView.setMode(Mode.BOTH);
		adapterList.setFullWidth(true);
		mPullRefreshListView.setAdapter(adapterList);
		
		
		if(position==0)
			method="GetPosts";
		else if(position==1)
			method="ExplorePosts";
		else
			method="GetFavouritePosts";
		reload(false,false,mPullRefreshListView,adapterList,mPullRefreshGridView,adapterGrid,position,progress);
		
		mPullRefreshGridView.setOnRefreshListener(new OnRefreshListener2<GridView>() {

			@Override
			public void onPullDownToRefresh(PullToRefreshBase<GridView> refreshView) {
				if(position==0)
				{
					currentPage0=0;
				}
				else if(position==1)
				{
					currentPage1=0;	
				}
				else if(position==2)
				{
					currentPage2=0;
				}
				reload(true,true,mPullRefreshListView,adapterList,mPullRefreshGridView,adapterGrid,position,progress);
			}

			@Override
			public void onPullUpToRefresh(PullToRefreshBase<GridView> refreshView) {
				if(position==0)
				{
					currentPage0+=1;
				}
				else if(position==1)
				{
					currentPage1+=1;	
				}
				else if(position==2)
				{
					currentPage2+=1;
				}
				reload(true,false,mPullRefreshListView,adapterList,mPullRefreshGridView,adapterGrid,position,progress);
			}

		});

		// Set a listener to be invoked when the list should be refreshed.
		mPullRefreshListView.setOnRefreshListener(new OnRefreshListener2() {

			@Override
			public void onPullDownToRefresh(PullToRefreshBase refreshView) {
				// TODO Auto-generated method stub
				//refresh
				if(position==0)
				{
					currentPage0=0;
				}
				else if(position==1)
				{
					currentPage1=0;	
				}
				else if(position==2)
				{
					currentPage2=0;
				}
				reload(false,true,mPullRefreshListView,adapterList,mPullRefreshGridView,adapterGrid,position,progress);
				//reload(mPullRefreshListView,adapterList,position);
			}

			@Override
			public void onPullUpToRefresh(PullToRefreshBase refreshView) {
				// TODO Auto-generated method stub
				//more
				if(position==0)
				{
					currentPage0+=1;
				}
				else if(position==1)
				{
					currentPage1+=1;	
				}
				else if(position==2)
				{
					currentPage2+=1;
				}
				reload(false,false,mPullRefreshListView,adapterList,mPullRefreshGridView,adapterGrid,position,progress);
				//reload(mPullRefreshListView,adapterList,position);
			}
		});
		
		
		container.addView(view, LayoutParams.MATCH_PARENT, LayoutParams.MATCH_PARENT);
		return view;
	}

	@Override
	public void destroyItem(View arg0, int arg1, Object arg2) {
		((ViewPager) arg0).removeView((View) arg2);

	}

	private static final String[] CONTENT = new String[] { "Following","Explore","Favourite" };

	@Override
	public CharSequence getPageTitle(int position) {
		return CONTENT[position % CONTENT.length].toUpperCase();
	}

	@Override
	public float getPageWidth(int position) {
		return 1f;
	}

	@Override
	public boolean isViewFromObject(View view, Object object) {
		return view == (View) object;
	}

	@Override
	public Parcelable saveState() {
		return super.saveState();
	}

	@Override
	public void restoreState(Parcelable state, ClassLoader loader) {
		// TODO Auto-generated method stub
		super.restoreState(state, loader);
	}
	
	boolean isReload=false;
	public Util util;
	public Model model;
	private String method = "GetPosts";
	
	public void reload2(final PullToRefreshListView mPullRefreshListView,final PostsTypeListAdapter adapterList,final int position) {
		//showProgress();
		isReload=true;
		int currPage=0;
		if(position==0)
		{
			currPage=currentPage0;method="GetPosts";
		}
		else if(position==1)
		{
			currPage=currentPage1;	method="ExplorePosts";
		}
		else if(position==2)
		{
			currPage=currentPage2;method="GetFavouritePosts";
		}
		
		model.getPostsByType(userId, currPage, method, new RequestListiner() {
			
			@Override
			public void requestError(int errorResource) {
				// TODO Auto-generated method stub	
			}
			@Override
			public void requestError(String result) {
				// TODO Auto-generated method stub
			}
			
			@Override
			public void requestDone(Object result) {
				// TODO Auto-generated method stub
				int currPage=0;
				if(position==0)
				{
					currPage=currentPage0;
				}
				else if(position==1)
				{
					currPage=currentPage1;	
				}
				else if(position==2)
				{
					currPage=currentPage2;
				}
				
				if (currPage == 0)
					adapterList.resetPosts();
				
				ArrayList<Post> po=(ArrayList<Post>) result;
				Log.d("combo", "size="+po.size());
				Log.d("combo", "pos="+position);
				Log.d("combo", "curpage="+currPage);
				Log.d("combo", "method="+method);
				adapterList.addPosts((ArrayList<Post>) result);
				mPullRefreshListView.onRefreshComplete();
				adapterList.notifyDataSetChanged();
			}
		});
		//findViewById(R.id.progress2).setVisibility(View.VISIBLE);
	}
	
	public void reload(final boolean isGrid,final boolean isDown,final PullToRefreshListView mPullRefreshListView,final PostsTypeListAdapter adapterList,final PullToRefreshGridView mPullRefreshGridView,final PostsTypeListAdapter adapterGrid,final int position,final ProgressBar progress) {
		//showProgress();
		
		/*new Handler().postDelayed(new Runnable() {
			public void run() {
				
				
			}
		}, 200);*/
		isReload=true;
		int currPage=0;
		
		if(position==0)
		{
			currPage=currentPage0;method="GetPosts";
		}
		else if(position==1)
		{
			currPage=currentPage1;	method="ExplorePosts";
		}
		else if(position==2)
		{
			currPage=currentPage2;method="GetFavouritePosts";
		}
		model.getPostsByType(userId, currPage, method, new RequestListiner() {
			
			@Override
			public void requestError(int errorResource) {
				// TODO Auto-generated method stub
				
			}
			
			@Override
			public void requestError(String result) {
				// TODO Auto-generated method stub
				
			}
			
			@Override
			public void requestDone(Object result) {
				// TODO Auto-generated method stub
				int currPage=0;
				progress.setVisibility(View.GONE);
				if(position==0)
				{
					currPage=currentPage0;
				}
				else if(position==1)
				{
					currPage=currentPage1;	
				}
				else if(position==2)
				{
					currPage=currentPage2;
				}
				
				if(isGrid)
				{
					if(isDown)
					{
						
					}
					else
					{
						adapterGrid.resetPosts();
					}
				}
				else 
				{
					if(isDown)
					{
						
					}
					else
					{
						adapterList.resetPosts();
					}
				}
				//if (currPage == 0)
					//adapterGrid.resetPosts();
				
				//if (currPage == 0)
				//	adapterList.resetPosts();
				
				ArrayList<Post> po=(ArrayList<Post>) result;
				Log.d("combo", "size="+po.size());
				Log.d("combo", "pos="+position);
				Log.d("combo", "curpage="+currPage);
				Log.d("combo", "method="+method);
				
				adapterGrid.addPosts((ArrayList<Post>) result);
				mPullRefreshGridView.onRefreshComplete();
				adapterGrid.notifyDataSetChanged();
				
				adapterList.addPosts((ArrayList<Post>) result);
				mPullRefreshListView.onRefreshComplete();
				adapterList.notifyDataSetChanged();

				
			}
		});
		class TestAsync extends AsyncTask<Void, Integer, String>
		{
		    protected void onPreExecute (){
		        Log.d("PreExceute","On pre Exceute......");
		    }

		    protected String doInBackground(Void...arg0) {
		    	isReload=true;
				int currPage=0;
				
				if(position==0)
				{
					currPage=currentPage0;method="GetPosts";
				}
				else if(position==1)
				{
					currPage=currentPage1;	method="ExplorePosts";
				}
				else if(position==2)
				{
					currPage=currentPage2;method="GetFavouritePosts";
				}
				model.getPostsByType(userId, currPage, method, new RequestListiner() {
					
					@Override
					public void requestError(int errorResource) {
						// TODO Auto-generated method stub
						
					}
					
					@Override
					public void requestError(String result) {
						// TODO Auto-generated method stub
						
					}
					
					@Override
					public void requestDone(Object result) {
						// TODO Auto-generated method stub
						int currPage=0;
						if(position==0)
						{
							currPage=currentPage0;
						}
						else if(position==1)
						{
							currPage=currentPage1;	
						}
						else if(position==2)
						{
							currPage=currentPage2;
						}
						if (currPage == 0)
							adapterGrid.resetPosts();
						if (currPage == 0)
							adapterList.resetPosts();
						
						ArrayList<Post> po=(ArrayList<Post>) result;
						Log.d("combo", "size="+po.size());
						Log.d("combo", "pos="+position);
						Log.d("combo", "curpage="+currPage);
						Log.d("combo", "method="+method);
						
						adapterList.addPosts((ArrayList<Post>) result);
						mPullRefreshListView.onRefreshComplete();
						adapterList.notifyDataSetChanged();

						adapterGrid.addPosts((ArrayList<Post>) result);
						mPullRefreshGridView.onRefreshComplete();
						adapterGrid.notifyDataSetChanged();
					}
				});
		        return "You are at PostExecute";
		    }

		    protected void onProgressUpdate(Integer...a){
		    }

		    protected void onPostExecute(String result) {
		    	progress.setVisibility(View.GONE);
		    }
		}
		//new TestAsync().equals("");
		//findViewById(R.id.progress2).setVisibility(View.VISIBLE);
	}

}
