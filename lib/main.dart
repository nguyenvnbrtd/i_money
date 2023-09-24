import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_controller/core/blocs/authentication/authentication_bloc.dart';
import 'package:money_controller/core/blocs/authentication/authentication_state.dart';
import 'package:money_controller/core/utils/log_utils.dart';
import 'package:money_controller/core/utils/utils_helper.dart';
import 'package:money_controller/features/splash/splash_screen.dart';
import 'package:money_controller/repos/user_repository.dart';

import 'core/src/app_colors.dart';
import 'core/src/app_theme.dart';
import 'core/utils/dimension.dart';
import 'injector.dart';
import 'route/page_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  await init();

  runZonedGuarded(
    () {
      runApp(const MyApp());
    },
    (error, stack) {
      LogUtils.e(message: error.toString());
    },
  );

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthenticationBloc(),
        ),
      ],
      child: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: _authenticationListener,
        child: GestureDetector(
          onTap: UtilsHelper.dismissKeyBoard,
          child: Container(
            color: AppColors.white,
            child: MaterialApp(
              navigatorKey: UtilsHelper.navigatorKey,
              color: AppColors.white,
              title: 'I-Ticket',
              theme: AppTheme.defaultTheme,
              debugShowCheckedModeBanner: false,
              onGenerateRoute: Routes.generateRoute,
              home: Builder(
                builder: (context) {
                  DeviceDimension().initValue(context);

                  return const SplashScreen();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _authenticationListener(BuildContext context, state) async {
    if (state is AuthenticationStateLoggedIn) {
      UtilsHelper.popAllAndPushNamed(Routes.main);
      return;
    }

    if (state is AuthenticationStateNotLoggedIn) {
      await it<UserRepository>().logOut();
      UtilsHelper.popAllAndPushNamed(Routes.login);
      return;
    }
  }
}
