package com.egygames.apps.social.entity;

import org.codehaus.jackson.type.TypeReference;

public class Subclass<T> extends TypeReference<Response<T>> {
	public Subclass() {
	}
}