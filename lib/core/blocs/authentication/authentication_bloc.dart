import 'package:money_controller/core/utils/dialog_utils.dart';
import 'package:money_controller/repos/google_user_repository.dart';

import '../../../base/blocs/base_bloc.dart';
import '../../../injector.dart';
import '../../../repos/user_repository.dart';
import 'authentication_event.dart';
import 'authentication_state.dart';

class AuthenticationBloc extends BaseBloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository _userRepository = it();
  final GoogleUserRepository _googleUserRepository = it();

  AuthenticationBloc() : super(AuthenticationStateInitial()) {
    on<OnStartAuthentication>((event, emit) async {
      final user = await _userRepository.getUser();
      if (user != null) {
        emit(AuthenticationStateLoggedIn(id: user.uid));
      } else {
        _checkLogIn(
          onFail: () async {
            await _googleUserRepository.logIn();
            _checkLogIn(
              onFail: () {
                DialogUtils.showPrimaryDialog(
                  message: 'Login fail. \nTry to login again?',
                  onConfirm: () {
                    add(OnStartAuthentication());
                  },
                );
              },
            );
          },
        );
      }
    });

    on<AuthenticationEventLoggingIn>((event, emit) {
      emit(AuthenticationStateLoggedIn(id: event.userId));
    });

    on<AuthenticationEventLoggingOut>((event, emit) {
      emit(AuthenticationStateNotLoggedIn());
    });
  }

  void _checkLogIn({Function? onFail}) async {
    if (_googleUserRepository.isLogIn()) {
      emit(AuthenticationStateLoggedIn(id: (await _googleUserRepository.getUser())!.id));
    } else {
      if (onFail != null) await onFail();
    }
  }
}
