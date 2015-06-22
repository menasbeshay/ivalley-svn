package com.egygames.apps.social;

import android.content.Intent;
import android.graphics.Color;
import android.os.Bundle;
import android.support.v4.view.ViewPager;
import android.support.v4.view.ViewPager.OnPageChangeListener;
import android.view.View;
import android.widget.ImageButton;
import android.widget.SearchView;
import android.widget.SearchView.OnQueryTextListener;
import android.widget.TextView;

import com.combomobile.R;
import com.egygames.apps.social.adapter.LevelsPagerAdapter;
import com.viewpagerindicator.TabPageIndicator;

public class NewExploreActivity extends BaseActivity implements OnQueryTextListener{

	private ViewPager itemsViewPager;
	private TabPageIndicator indicator;
	private LevelsPagerAdapter levelsPagerAdapter;
	
	private ViewPager itemsViewPager2;
	private TabPageIndicator indicator2;
	private LevelsPagerAdapter levelsPagerAdapter2;

	private boolean isGrid=false;
	private SearchView searchView;
	private String userId;
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_new_explore);
		disableTab(R.id.explore);
		
		searchView = (SearchView) findViewById(R.id.searchView);
		searchView.setOnQueryTextListener(this);

		setUserId(util.user.getComboUserID());
		int id = searchView.getContext().getResources().getIdentifier("android:id/search_src_text", null, null);
		TextView searchTextView = (TextView) searchView.findViewById(id);
		searchTextView.setTextColor(Color.WHITE);
		//setTitle(R.string.app_name);

		
		//To add specific font typeface
		/*if (indicator.getChildCount() > 0) {
			ViewGroup viewGroup=(ViewGroup) indicator.getChildAt(0);
			for (int i = 0; i < viewGroup.getChildCount(); i++) {
				if (viewGroup.getChildAt(i) instanceof TextView) {
					//FontUtil.setFont((TextView) viewGroup.getChildAt(i));
				}
			}
		}*/
		init();
		initGrid();
		
	}
	
	@Override
	protected void onStart() {
		// TODO Auto-generated method stub
		
		super.onStart();
	}
	private void init()
	{
		
		itemsViewPager = (ViewPager) findViewById(R.id.pagerList);
		itemsViewPager.setOffscreenPageLimit(2);
		
		levelsPagerAdapter = new LevelsPagerAdapter(this,false);
		itemsViewPager.setAdapter(levelsPagerAdapter);
		
		indicator = (TabPageIndicator) findViewById(R.id.indicatorList);
		indicator.setViewPager(itemsViewPager);
		
		itemsViewPager.setOnPageChangeListener(new OnPageChangeListener() {

			@Override
			public void onPageSelected(int position) {
				// TODO Auto-generated method stub
				indicator.setCurrentItem(position);
			}

			@Override
			public void onPageScrolled(int arg0, float arg1, int arg2) {
				// TODO Auto-generated method stub

			}

			@Override
			public void onPageScrollStateChanged(int arg0) {
				// TODO Auto-generated method stub

			}
		});
	}
	
	private void initGrid()
	{
		
		itemsViewPager2 = (ViewPager) findViewById(R.id.pagergrid);
		itemsViewPager2.setOffscreenPageLimit(2);
		
		levelsPagerAdapter2 = new LevelsPagerAdapter(this,true);
		itemsViewPager2.setAdapter(levelsPagerAdapter2);
		
		indicator2 = (TabPageIndicator) findViewById(R.id.indicatorgrid);
		indicator2.setViewPager(itemsViewPager2);
		
		itemsViewPager2.setOnPageChangeListener(new OnPageChangeListener() {

			@Override
			public void onPageSelected(int position) {
				// TODO Auto-generated method stub
				indicator2.setCurrentItem(position);
				
			}

			@Override
			public void onPageScrolled(int arg0, float arg1, int arg2) {
				// TODO Auto-generated method stub

			}

			@Override
			public void onPageScrollStateChanged(int arg0) {
				// TODO Auto-generated method stub

			}
		});
	}
	
	public void list(View v) {
		ImageButton listGridView=(ImageButton)findViewById(R.id.iv_grid_list);
		if(!isGrid)
		{
			isGrid=true;
			listGridView.setImageResource(R.drawable.list_icon_explore);
			//init();
			//levelsPagerAdapter.setGrid(true);
			//levelsPagerAdapter = new LevelsPagerAdapter(this,isGrid);
			//levelsPagerAdapter.notifyDataSetChanged();;
			
			findViewById(R.id.linear_grid).setVisibility(View.VISIBLE);
			findViewById(R.id.linear_list).setVisibility(View.GONE);
		}
		else
		{
			isGrid=false;
			listGridView.setImageResource(R.drawable.grid_icon_explore);
			
			findViewById(R.id.linear_grid).setVisibility(View.GONE);
			findViewById(R.id.linear_list).setVisibility(View.VISIBLE);
		    //init();
			//levelsPagerAdapter.setGrid(false);
			///levelsPagerAdapter = new LevelsPagerAdapter(this,isGrid);
			//levelsPagerAdapter.notifyDataSetChanged();
		}
	}
	private String searchText;
	private int currentPage=0;
	@Override
	public boolean onQueryTextChange(String arg0) {
		return false;
	}

	@Override
	public boolean onQueryTextSubmit(String query) {
		searchText = query;
		currentPage = 0;
		//model.searchPosts(util.user.getComboUserID(), searchText, currentPage, postListiner);
		Intent i=new Intent(NewExploreActivity.this,SearchResultActivity.class);
		i.putExtra("text", searchText);
		startActivity(i);
		return false;
	}

	public void search(View v) {
		searchText = searchView.getQuery().toString();
		currentPage = 0;
		Intent i=new Intent(NewExploreActivity.this,SearchResultActivity.class);
		i.putExtra("text", searchText);
		startActivity(i);
		//model.searchPosts(util.user.getComboUserID(), searchText, currentPage, postListiner);
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	
}
