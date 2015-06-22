package com.egygames.apps.social;

import android.content.Intent;
import android.os.Bundle;
import android.support.v4.view.PagerAdapter;
import android.support.v4.view.ViewPager;
import android.util.TypedValue;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.BaseAdapter;
import android.widget.ListView;
import android.widget.TextView;

import com.combomobile.R;
import com.egygames.apps.social.adapter.ConversationsAdapter;
import com.egygames.apps.social.adapter.FriendsAdapter;
import com.egygames.apps.social.entity.Message;
import com.egygames.apps.social.entity.User;
import com.egygames.apps.social.views.PagerSlidingTabStrip;

public class MessagesListActivity extends BaseActivity implements OnItemClickListener {

	private PagerSlidingTabStrip tabs;
	private ViewPager pager;
	private MyPagerAdapter adapter;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_messages_list);
		disableTab(R.id.chat);
		setTitle(R.string.chat);
		// model.getMessagesList(util.user.getComboUserID(),0, this);
		tabs = (PagerSlidingTabStrip) findViewById(R.id.pager_tabs);
		pager = (ViewPager) findViewById(R.id.pager);
		pager.setOffscreenPageLimit(3);
		adapter = new MyPagerAdapter();
		pager.setAdapter(adapter);
		final int pageMargin = (int) TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, 4, getResources().getDisplayMetrics());
		pager.setPageMargin(pageMargin);
		tabs.setViewPager(pager);
		hideProgress();

	}


	public class MyPagerAdapter extends PagerAdapter {

		private final int[] TITLES = {
				R.string.conversations, R.string.friends };

		public MyPagerAdapter() {
		}

		@Override
		public CharSequence getPageTitle(int position) {
			return getString(TITLES[position]);
		}

		@Override
		public int getCount() {
			return TITLES.length;
		}

		@Override
		public Object instantiateItem(View container, int position) {
			LayoutInflater inflater = LayoutInflater.from(MessagesListActivity.this);
			ViewGroup view = (ViewGroup) inflater.inflate(R.layout.list_with_progress, (ViewGroup) container, false);

			ListView list = (ListView) view.findViewById(R.id.listView);
			list.setOnItemClickListener(MessagesListActivity.this);

			switch (position) {
			case 0:
				list.setAdapter(new ConversationsAdapter(view, MessagesListActivity.this));
				break;
			case 1:
				list.setAdapter(new FriendsAdapter(view,"GetFriends", MessagesListActivity.this));

				break;
			case 2:

				break;
			default:
				break;
			}
			((ViewPager) container).addView(view);

			return view;
		}

		@Override
		public void destroyItem(View collection, int position, Object view) {
			((ViewPager) collection).removeView((View) view);
		}

		@Override
		public boolean isViewFromObject(View view, Object object) {
			return view == object;
		}

	}

	public class SettingsAdapter extends BaseAdapter {

		private int[] stringsArray;

		public SettingsAdapter(int[] stringsArray) {
			this.stringsArray = stringsArray;
		}

		@Override
		public int getCount() {
			return stringsArray.length;
		}

		@Override
		public Object getItem(int position) {
			return stringsArray[position];
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
			((TextView) view.findViewById(R.id.title)).setText(getString(stringsArray[position]));
			return view;
		}

	}

	@Override
	public void onItemClick(AdapterView<?> list, View arg1, int position, long arg3) {
		Object item = list.getAdapter().getItem(position);
		if (item instanceof User) {
			User friend = (User) item;
			Intent intent = new Intent(this, ChatActivity.class);
			intent.putExtra("friendId", friend.getComboUserID());
			intent.putExtra("friendPic", friend.getProfilePic());
			intent.putExtra("friendName", friend.getDisplayName());
			startActivity(intent);
		}else
		{
			Message message = (Message) item;
			Intent intent = new Intent(this, ChatActivity.class);
			intent.putExtra("friendId", message.getComboUserID());
			intent.putExtra("friendPic", message.getProfilePic());
			intent.putExtra("friendName", message.getComboUserName());
			startActivity(intent);
		}

	}
}
