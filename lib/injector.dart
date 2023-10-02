
import 'package:get_it/get_it.dart';
import 'package:money_controller/core/utils/device_info.dart';
import 'package:money_controller/core/utils/error_handler.dart';
import 'package:money_controller/main_bloc.dart';
import 'package:money_controller/repos/google_user_repository.dart';
import 'package:money_controller/repos/user_repository.dart';

final it = GetIt.instance;

Future<void> init() async {
  // Repository
  it.registerLazySingleton<UserRepository>(() => UserRepository());
  it.registerLazySingleton<GoogleUserRepository>(() => GoogleUserRepository());

  //device information
  await DeviceInfo.init();

  final errorHandler = ErrorHandler();
  it.registerFactory<ErrorHandler>(() => errorHandler);

  MainBloc mainBloc = MainBloc();
  mainBloc.init(errorHandler, mainBloc);
}
