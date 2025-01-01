// Flutter web plugin registrant file.
//
// Generated file. Do not edit.
//

// @dart = 2.13
// ignore_for_file: type=lint

import 'package:flutter_inappwebview_web/web/main.dart';
import 'package:google_maps_flutter_web/google_maps_flutter_web.dart';
import 'package:maps_launcher/maps_launcher_web.dart';
import 'package:url_launcher_web/url_launcher_web.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void registerPlugins([final Registrar? pluginRegistrar]) {
  final Registrar registrar = pluginRegistrar ?? webPluginRegistrar;
  InAppWebViewFlutterPlugin.registerWith(registrar);
  GoogleMapsPlugin.registerWith(registrar);
  MapsLauncherWeb.registerWith(registrar);
  UrlLauncherPlugin.registerWith(registrar);
  registrar.registerMessageHandler();
}
