import 'package:core/core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppDI.initFirebase();
  await Firebase.initializeApp(
    options: appLocator<FirebaseOptions>(),
  );
  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  NotificationSettings notificationSettings =
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
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
