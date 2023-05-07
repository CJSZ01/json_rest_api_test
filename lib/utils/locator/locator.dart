import 'package:api_test_caio/data/repository/interface/user_repository_interface.dart';
import 'package:api_test_caio/data/repository/user_repository.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;
void initializeLocator() {
  serviceLocator.registerLazySingleton<IUserRepository>(
    () => UserRepository(),
  );
}
