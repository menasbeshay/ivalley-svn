package com.egygames.apps.social.adapter;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ProgressBar;
import android.widget.TextView;

import com.combomobile.R;

public class LevelsAdapter extends BaseAdapter {

	private int[] titles;
	private int[] values;

	public LevelsAdapter(int[] titles, int[] values) {
		this.titles = titles;
		this.values = values;

	}

	@Override
	public int getCount() {

		return titles.length;
	}

	@Override
	public Object getItem(int arg0) {

		return titles[arg0];
	}

	@Override
	public long getItemId(int arg0) {

		return arg0;
	}

	@Override
	public View getView(int position, View convertView, ViewGroup parent) {

		ViewGroup view;
		// if (convertView == null) {
		LayoutInflater inflater = LayoutInflater.from(parent.getContext());
		convertView = (ViewGroup) inflater.inflate(R.layout.levels_item, parent, false);
		// }
		view = (ViewGroup) convertView;
		setText(view, R.id.title, parent.getContext().getString(titles[position]));
		setText(view, R.id.value, " (" + values[position] + ")");
		ProgressBar progress = (ProgressBar) view.findViewById(R.id.progress);
		progress.setProgress(values[position]);
		if (position == getCount() - 2) {
			setDatesProgress(view);
		}
		if (position == getCount() - 1) {
			progress.setProgress(values[position] * 3000);
			setVirifyProgress(view);
		}
		return view;
	}

	private void setVirifyProgress(ViewGroup view) {
		setText(view, R.id.tv1, "Not verified");
		setText(view, R.id.tv2, "");
		setText(view, R.id.tv3, "");
		setText(view, R.id.tv4, "");
		setText(view, R.id.tv5, "");
		setText(view, R.id.tv6, "Verified");

	}

	private void setDatesProgress(ViewGroup view) {

		setText(view, R.id.tv1, "30 \nDays");
		setText(view, R.id.tv2, "120 \nDays");
		setText(view, R.id.tv3, "240 \nDays");
		setText(view, R.id.tv4, "1 \nYear");
		setText(view, R.id.tv5, "2 \nYears");
		setText(view, R.id.tv6, "3 \nYears");
	}

	protected void setText(ViewGroup viewGroup, int fieldId, String text) {
		((TextView) viewGroup.findViewById(fieldId)).setText(text);

	}

}
