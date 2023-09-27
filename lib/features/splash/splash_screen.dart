import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_controller/core/blocs/authentication/authentication_bloc.dart';
import 'package:money_controller/core/blocs/authentication/authentication_event.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(const Duration(milliseconds: 1000));
      startAuthentication();
    });
    super.initState();
  }

  void startAuthentication(){
    context.read<AuthenticationBloc>().add(OnStartAuthentication());
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
