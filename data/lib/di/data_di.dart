import 'package:core/core.dart';
import 'package:data/providers/firebase_provider.dart';
import 'package:data/providers/storage_provider.dart';
import 'package:data/repositories/user_repository_impl.dart';
import 'package:domain/domain.dart';
import 'package:shared_preferences/shared_preferences.dart';

final DataDI dataDI = DataDI();

class DataDI {
  Future<void> initDependencies() async {
    await initProviders();
    await initRepositories();
    initUseCases();
  }

  Future<void> initProviders() async {
    appLocator.registerSingleton<StorageProvider>(
      StorageProvider(
        sharedPreferences: await SharedPreferences.getInstance(),
      ),
    );
    appLocator.registerSingleton<FirebaseProvider>(
      FirebaseProvider(
        firebaseStorage: FirebaseStorage.instance,
        firebaseFirestore: FirebaseFirestore.instance,
      ),
    );
  }

  Future<void> initRepositories() async {
    appLocator.registerSingleton<UserRepository>(
      UserRepositoryImpl(
        storageProvider: appLocator<StorageProvider>(),
        firebaseProvider: appLocator<FirebaseProvider>(),
      ),
    );
  }

  void initUseCases() {
    appLocator.registerFactory<GetLocalUserUseCase>(
      () => GetLocalUserUseCase(
        userRepository: appLocator<UserRepository>(),
      ),
    );
    appLocator.registerFactory<AddUserUseCase>(
      () => AddUserUseCase(
        userRepository: appLocator<UserRepository>(),
      ),
    );
    appLocator.registerFactory<DeleteUserUseCase>(
      () => DeleteUserUseCase(
        userRepository: appLocator<UserRepository>(),
      ),
    );
    appLocator.registerFactory<FetchLocalUserUseCase>(
      () => FetchLocalUserUseCase(
        userRepository: appLocator<UserRepository>(),
      ),
    );
    appLocator.registerFactory<GetUserByUuidUseCase>(
      () => GetUserByUuidUseCase(
        userRepository: appLocator<UserRepository>(),
      ),
    );
    appLocator.registerFactory<SetImageUseCase>(
      () => SetImageUseCase(
        userRepository: appLocator<UserRepository>(),
      ),
    );
    appLocator.registerFactory<SetUserUseCase>(
      () => SetUserUseCase(
        userRepository: appLocator<UserRepository>(),
      ),
    );
  }
}
