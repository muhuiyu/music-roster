package com.example.music_roster

import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
	UrlLauncherPlugin.registerWith(registrarFor("io.flutter.plugins.urllauncher.UrlLauncherPlugin"))
    }
}
