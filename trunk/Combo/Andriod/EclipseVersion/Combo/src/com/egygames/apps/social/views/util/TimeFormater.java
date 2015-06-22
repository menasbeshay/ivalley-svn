package com.egygames.apps.social.views.util;

public class TimeFormater {

	private static final int SECOND_MILLIS = 1000;
	private static final int MINUTE_MILLIS = 60 * SECOND_MILLIS;
	private static final int HOUR_MILLIS = 60 * MINUTE_MILLIS;
	private static final int DAY_MILLIS = 24 * HOUR_MILLIS;

	// private static Calendar cal = Calendar.getInstance();
	// private static TimeZone tz = Calendar.getInstance().getTimeZone();
	public static String getTimeAgo(long time) {

		// Log.d("Time zone: ", tz.getRawOffset()+"");

		// if (time < 1000000000000L) {
		// if timestamp given in seconds, convert to millis
		time *= 1000;
		// }

		long now = System.currentTimeMillis(); // getCurrentTime(ctx);
		if (time > now || time <= 0) {
			return "0s";
		}
		// Log.d("Time zone: ", tz.getRawOffset()+"");
		// Log.d("Time zone: ", now+" now");
		// Log.d("Time zone: ", time+"  time");

		// Calendar cal = Calendar.getInstance();
		// time += tz.getRawOffset();

		final long diff = now - time;
		if (diff < MINUTE_MILLIS) {
			return (diff / 1000) + "s";
		} else if (diff < 2 * MINUTE_MILLIS) {
			return "1m";
		} else if (diff < 50 * MINUTE_MILLIS) {
			return diff / MINUTE_MILLIS + "m";
		} else if (diff < 90 * MINUTE_MILLIS) {
			return "1h";
		} else if (diff < 24 * HOUR_MILLIS) {
			return diff / HOUR_MILLIS + "h";
		} else if (diff < 48 * HOUR_MILLIS) {
			return "1d";
		} else {
			return diff / DAY_MILLIS + "d";
		}
	}
}
