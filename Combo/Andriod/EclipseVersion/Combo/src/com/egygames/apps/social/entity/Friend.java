/*
 * Copyright 2015 LinkedIn Corp. All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 */

package com.egygames.apps.social.entity;

import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;

import android.content.res.Resources;
import android.support.annotation.NonNull;
import android.util.Log;

import com.combomobile.R;
import com.linkedin.android.spyglass.mentions.Mentionable;
import com.linkedin.android.spyglass.tokenization.QueryToken;

/**
 * Model representing a basic, mentionable city.
 */
public class Friend implements Mentionable {

	private final String mName;
	private final String id;

	public Friend(String id, String name) {
		mName = name;
		this.id = id;
	}

	public String getName() {
		return mName;
	}

	@NonNull
	@Override
	public String getTextForDisplayMode(MentionDisplayMode mode) {
		switch (mode) {
		case FULL:
			return mName;
		case PARTIAL:
		case NONE:
		default:
			return "";
		}
	}

	@Override
	public MentionDeleteStyle getDeleteStyle() {
		return MentionDeleteStyle.PARTIAL_NAME_DELETE;
	}

	/*@Override
	public String getId() {
		return id;
	}*/

	@Override
	public String getPrimaryText() {
		return mName;
	}

	@Override
	public String getId() {
		// TODO Auto-generated method stub
		return (id);
	}

	/*@Override
	public String getId() {
		return id;
	}*/

}
