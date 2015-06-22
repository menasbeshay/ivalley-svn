package com.egygames.apps.social.views.util;

import java.io.File;
import java.io.IOException;
import java.io.RandomAccessFile;

import android.media.AudioFormat;
import android.media.AudioRecord;
import android.media.MediaRecorder;
import android.util.Log;

public class AudioRecorder {
	public enum State {
		INITIALIZING, READY, RECORDING, ERROR, STOPPED
	};

	public static final boolean RECORDING_UNCOMPRESSED = true;
	public static final boolean RECORDING_COMPRESSED = false;

	private static final int TIMER_INTERVAL = 120;

	private boolean rUncompressed;

	private AudioRecord aRecorder = null;
	private MediaRecorder mRecorder = null;

	private int cAmplitude = 0;
	private String fPath = null;

	private State state;

	private RandomAccessFile fWriter;
	private short nChannels;
	private int sRate;
	private short bSamples;
	private int bufferSize;
	private int aSource;
	private int aFormat;
	private int framePeriod;
	private byte[] buffer;
	private int payloadSize;

	public State getState() {
		return state;
	}

	private AudioRecord.OnRecordPositionUpdateListener updateListener = new AudioRecord.OnRecordPositionUpdateListener() {
		int receiveSTSamples = 0;
		public void onPeriodicNotification(AudioRecord recorder) {
			aRecorder.read(buffer, 0, buffer.length);
			
			try {
	
			   fWriter.write(buffer);
				payloadSize += buffer.length;
				if (bSamples == 16) {
					for (int i = 0; i < buffer.length / 2; i++) {
						short curSample = getShort(buffer[i * 2], buffer[i * 2 + 1]);
						if (curSample > cAmplitude) { // Check amplitude
							cAmplitude = curSample;
						}
					}
				} else { // 8bit sample size
					for (int i = 0; i < buffer.length; i++) {
						if (buffer[i] > cAmplitude) { // Check amplitude
							cAmplitude = buffer[i];
						}
					}
				}
			} catch (IOException e) {
				stop();
			}
		}

		public void onMarkerReached(AudioRecord recorder) {
		}
	};

	@SuppressWarnings("deprecation")
	public AudioRecorder(boolean uncompressed, int audioSource, int sampleRate, int channelConfig, int audioFormat) {
		try {
			rUncompressed = uncompressed;
			if (rUncompressed) { // RECORDING_UNCOMPRESSED
				if (audioFormat == AudioFormat.ENCODING_PCM_16BIT) {
					bSamples = 16;
				} else {
					bSamples = 8;
				}
				if (channelConfig == AudioFormat.CHANNEL_CONFIGURATION_MONO) {
					nChannels = 1;
				} else {
					nChannels = 2;
				}
				aSource = audioSource;
				sRate = sampleRate;
				aFormat = audioFormat;
				framePeriod = sampleRate * TIMER_INTERVAL / 1000;
				bufferSize = framePeriod * 2 * bSamples * nChannels / 8;
				if (bufferSize < AudioRecord.getMinBufferSize(sampleRate, channelConfig, audioFormat)) {
					bufferSize = AudioRecord.getMinBufferSize(sampleRate, channelConfig, audioFormat);
					framePeriod = bufferSize / (2 * bSamples * nChannels / 8);
					Log.w(AudioRecorder.class.getName(), "Increasing buffer size to " + Integer.toString(bufferSize));
				}
				aRecorder= new AudioRecord(audioSource, sampleRate, channelConfig, audioFormat, bufferSize);
				if (aRecorder.getState() != AudioRecord.STATE_INITIALIZED)
					throw new Exception("AudioRecord initialization failed");
				aRecorder.setRecordPositionUpdateListener(updateListener);
				aRecorder.setPositionNotificationPeriod(framePeriod);
			} else {
				mRecorder = new MediaRecorder();
				mRecorder.setAudioSource(MediaRecorder.AudioSource.MIC);
				mRecorder.setOutputFormat(MediaRecorder.OutputFormat.THREE_GPP);
				mRecorder.setAudioEncoder(MediaRecorder.AudioEncoder.AMR_NB);
			}
			cAmplitude = 0;
			fPath = null;
			state = State.INITIALIZING;
		} catch (Exception e) {
			if (e.getMessage() != null) {
				Log.e(AudioRecorder.class.getName(), e.getMessage());
			} else {
				Log.e(AudioRecorder.class.getName(), "Unknown error occured while initializing recording");
			}
			state = State.ERROR;
		}
	}

	public void setOutputFile(File folder, String file) {
		File fileWithinMyDir = new File(folder, file);
		try {
			if (state == State.INITIALIZING) {
				fPath = fileWithinMyDir.getAbsolutePath();
				if (!rUncompressed) {
					mRecorder.setOutputFile(fPath);
				}

			}
		} catch (Exception e) {
			if (e.getMessage() != null) {
				Log.e(AudioRecorder.class.getName(), e.getMessage());
			} else {
				Log.e(AudioRecorder.class.getName(), "Unknown error occured while setting output path");
			}
			state = State.ERROR;
		}
	}

	public int getMaxAmplitude() {
		if (state == State.RECORDING) {
			if (rUncompressed) {
				int result = cAmplitude;
				cAmplitude = 0;
				return result;
			} else {
				try {
					return mRecorder.getMaxAmplitude();
				} catch (IllegalStateException e) {
					return 0;
				}
			}
		} else {
			return 0;
		}
	}

	public void prepare() {
		try {
			if (state == State.INITIALIZING) {
				if (rUncompressed) {
					if ((aRecorder.getState() == AudioRecord.STATE_INITIALIZED) & (fPath != null)) {
						fWriter = new RandomAccessFile(fPath, "rw");
						fWriter.setLength(0);
						fWriter.writeBytes("RIFF");
						fWriter.writeInt(0);
						fWriter.writeBytes("WAVE");
						fWriter.writeBytes("fmt ");
						fWriter.writeInt(Integer.reverseBytes(16));
						fWriter.writeShort(Short.reverseBytes((short) 1));
						fWriter.writeShort(Short.reverseBytes(nChannels));
						fWriter.writeInt(Integer.reverseBytes(sRate));
						fWriter.writeInt(Integer.reverseBytes(sRate * bSamples * nChannels / 8)); // Byte
						fWriter.writeShort(Short.reverseBytes((short) (nChannels * bSamples / 8))); // Block
						fWriter.writeShort(Short.reverseBytes(bSamples));
						fWriter.writeBytes("data");
						fWriter.writeInt(0);
						buffer = new byte[framePeriod * bSamples / 8 * nChannels];
						state = State.READY;
					} else {
						Log.e(AudioRecorder.class.getName(), "prepare() method called on uninitialized recorder");
						state = State.ERROR;
					}
				} else {
					mRecorder.prepare();
					state = State.READY;
				}
			} else {
				Log.e(AudioRecorder.class.getName(), "prepare() method called on illegal state");
				release();
				state = State.ERROR;
			}
		} catch (Exception e) {
			if (e.getMessage() != null) {
				Log.e(AudioRecorder.class.getName(), e.getMessage());
			} else {
				Log.e(AudioRecorder.class.getName(), "Unknown error occured in prepare()");
			}
			state = State.ERROR;
		}
	}

	public void release() {
		if (state == State.RECORDING) {
			stop();
		} else {
			if ((state == State.READY) & (rUncompressed)) {
				try {
					fWriter.close(); // Remove prepared file
				} catch (IOException e) {
					Log.e(AudioRecorder.class.getName(), "I/O exception occured while closing output file");
				}
				(new File(fPath)).delete();
			}
		}

		if (rUncompressed) {
			if (aRecorder != null) {
				aRecorder.release();
			}
		} else {
			if (mRecorder != null) {
				mRecorder.release();
			}
		}
	}

	/**
	 * 
	 * 
	 * Resets the recorder to the INITIALIZING state, as if it was just created.
	 * In case the class was in RECORDING state, the recording is stopped. In
	 * case of exceptions the class is set to the ERROR state.
	 * 
	 */
	public void reset() {
		try {
			if (state != State.ERROR) {
				release();
				fPath = null; // Reset file path
				cAmplitude = 0; // Reset amplitude
				if (rUncompressed) {
					aRecorder = new AudioRecord(aSource, sRate, nChannels + 1, aFormat, bufferSize);
				} else {
					mRecorder = new MediaRecorder();
					mRecorder.setAudioSource(MediaRecorder.AudioSource.MIC);
					mRecorder.setOutputFormat(MediaRecorder.OutputFormat.THREE_GPP);
					mRecorder.setAudioEncoder(MediaRecorder.AudioEncoder.AMR_NB);
				}
				state = State.INITIALIZING;
			}
		} catch (Exception e) {
			Log.e(AudioRecorder.class.getName(), e.getMessage());
			state = State.ERROR;
		}
	}

	/**
	 * 
	 * 
	 * Starts the recording, and sets the state to RECORDING. Call after
	 * prepare().
	 * 
	 */
	public void start() {
		if (state == State.READY) {
			if (rUncompressed) {
				payloadSize = 0;
				aRecorder.startRecording();
				aRecorder.read(buffer, 0, buffer.length);
			} else {
				mRecorder.start();
			}
			state = State.RECORDING;
		} else {
			Log.e(AudioRecorder.class.getName(), "start() called on illegal state");
			state = State.ERROR;
		}
	}

	/**
	 * 
	 * 
	 * Stops the recording, and sets the state to STOPPED. In case of further
	 * usage, a reset is needed. Also finalizes the wave file in case of
	 * uncompressed recording.
	 * 
	 */
	public void stop() {
		if (state == State.RECORDING) {
			if (rUncompressed) {
				aRecorder.stop();

				try {
					fWriter.seek(4); // Write size to RIFF header
					fWriter.writeInt(Integer.reverseBytes(36 + payloadSize));

					fWriter.seek(40); // Write size to Subchunk2Size field
					fWriter.writeInt(Integer.reverseBytes(payloadSize));

					fWriter.close();
				} catch (IOException e) {
					Log.e(AudioRecorder.class.getName(), "I/O exception occured while closing output file");
					state = State.ERROR;
				}
			} else {
				mRecorder.stop();
			}
			state = State.STOPPED;
		} else {
			Log.e(AudioRecorder.class.getName(), "stop() called on illegal state");
			state = State.ERROR;
		}
	}

	/*
	 * 
	 * Converts a byte[2] to a short, in LITTLE_ENDIAN format
	 */
	private short getShort(byte argB1, byte argB2) {
		return (short) (argB1 | (argB2 << 8));
	}
}
