import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';

import '../config/firebase_options.dart';

final AppDI appDI = AppDI();
final GetIt appLocator = GetIt.instance;

class AppDI {
  static void initFirebase() {
    appLocator.registerSingleton<FirebaseOptions>(
      DefaultFirebaseOptions.currentPlatform,
    );
  }

  static void initDependencies() {}
}
