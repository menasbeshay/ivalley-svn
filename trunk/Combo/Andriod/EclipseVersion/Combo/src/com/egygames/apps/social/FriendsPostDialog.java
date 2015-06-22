package com.egygames.apps.social;
import java.util.ArrayList;

import android.app.Dialog;
import android.content.Context;
import android.view.View;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.ListView;
import android.widget.ProgressBar;

import com.combomobile.R;
import com.egygames.apps.social.adapter.PostFriendsAdapter;
import com.egygames.apps.social.entity.User;
import com.egygames.apps.social.model.Model;
import com.egygames.apps.social.model.RequestListiner;

public class FriendsPostDialog extends Dialog implements OnItemClickListener, RequestListiner {


	private PostFriendsAdapter adapter;
	ArrayList<User> profiles;
	private ProgressBar progress;
	private ListView list;

	public FriendsPostDialog(boolean isLike,String postId, Context context,String userID) {
		super(context);
		setContentView(R.layout.friends_post);
		
		
		profiles=new ArrayList<User>();
		adapter = new PostFriendsAdapter(context,profiles,userID);
		list = (ListView) findViewById(R.id.lv_friends);
		list.setOnItemClickListener(this);
		list.setAdapter(adapter);
		list.setVisibility(View.GONE);
		
		progress=(ProgressBar)findViewById(R.id.progressBar);
		if(isLike)
		{
			setTitle(R.string.like);
			Model.instance.postLikeFriends(postId, userID,this);
		}
		else
		{
			setTitle(R.string.share_friends);
			Model.instance.getPostShares(postId, userID,this);
		}
	}

	@Override
	public void onItemClick(AdapterView<?> arg0, View arg1, int arg2, long arg3) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void requestDone(Object result) {
		// TODO Auto-generated method stub
		@SuppressWarnings("unchecked")
		ArrayList<User> users=((ArrayList<User>) result);
		profiles.addAll(users);
		adapter.notifyDataSetChanged();
		progress.setVisibility(View.GONE);
		list.setVisibility(View.VISIBLE);
	}

	@Override
	public void requestError(String result) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void requestError(int errorResource) {
		// TODO Auto-generated method stub
		
	}

}
