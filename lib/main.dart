import 'package:core/core.dart';
import 'package:core/localization/app_localization.dart';
import 'package:flutter/material.dart';

import 'app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  AppDI.initFirebase();
  await Firebase.initializeApp(
    options: appLocator<FirebaseOptions>(),
  );
  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  final NotificationSettings notificationSettings =
      await firebaseMessaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  AppLogger().info(
      'User granted permission: ${notificationSettings.authorizationStatus}');

  AppDI.initDependencies();

  runApp(
    EasyLocalization(
      child: App(),
      supportedLocales: AppLocalization.supportedLocales,
      path: AppLocalization.langsFolderPath,
      fallbackLocale: AppLocalization.fallbackLocale,
    ),
  );
}
