import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluent_ui/fluent_ui.dart';

import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_i18n/loaders/decoders/toml_decode_strategy.dart';
import 'package:flutter_i18n/loaders/file_translation_loader.dart';

import 'package:system_theme/system_theme.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'package:window_manager/window_manager.dart';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'package:desktop_webview_window/desktop_webview_window.dart';

Future<void> main(List<String> args) async {
  var launcherArgs = args;

  if (runWebViewTitleBarWidget(args)) {
    return;
  }

  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  WindowsDeviceInfo windows = await deviceInfo.windowsInfo;
  Application.buildNumber = windows.buildNumber;

// Default window size
  Size size = const Size(1200, 600);
  // window position
  Offset? position;

  SystemTheme.fallbackColor = const Color(0xfff6b4f8);
  await SystemTheme.accentColor.load();

  WindowOptions windowOptions = WindowOptions(
      size: size,
      minimumSize: const Size(1000, 300),
      center: true,
      skipTaskbar: false,
      windowButtonVisibility: false,
      titleBarStyle: TitleBarStyle.hidden,
      title: "FMCLauncher");

  runApp(fApp());
}

class Application {
  static var buildNumber;
  var packageInfo =
      PackageInfo(appName: '', buildNumber: '', packageName: '', version: '');
}

class fApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      //home: HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

Widget build(BuildContext context) {
  return Scaffold();
}
