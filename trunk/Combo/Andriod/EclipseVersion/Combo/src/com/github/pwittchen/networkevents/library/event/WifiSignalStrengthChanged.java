/*
 * Copyright (C) 2015 Piotr Wittchen
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
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.github.pwittchen.networkevents.library.event;

import android.content.Context;
import android.util.Log;

import com.github.pwittchen.networkevents.library.NetworkEventsConfig;
import com.github.pwittchen.networkevents.library.NetworkHelper;

/**
 * Event pushed to Otto Event Bus when Wifi Signal strength was changed
 * and list of WiFi Access Points was refreshed
 */
public final class WifiSignalStrengthChanged {
    public WifiSignalStrengthChanged(Context context) {
        /**
         * We need to start WiFi scan after refreshing access points
         * in order to get fresh access points list
         */
        NetworkHelper.startWifiScan(context);
        Log.d(NetworkEventsConfig.TAG, "WifiSignalStrengthChanged");
    }
}