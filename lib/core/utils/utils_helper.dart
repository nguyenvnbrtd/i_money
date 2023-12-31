import 'package:encrypt/encrypt.dart' as Aes;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart' as intl;
import 'package:money_controller/core/blocs/authentication/authentication_bloc.dart';
import 'package:money_controller/core/blocs/authentication/authentication_event.dart';
import 'package:money_controller/core/utils/recase.dart';
import 'package:money_controller/models/navigator_agruments/arguments_screen_model.dart';
import '../../injector.dart';
import '../../route/page_routes.dart';
import 'constants.dart';
import 'dialog_utils.dart';
import 'error_handler.dart';

class UtilsHelper {
  UtilsHelper._();

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  /// Text height
  static double getTextHeight(
      {required String text,
        required TextStyle textStyle,
        required double maxWidthOfWidget,
        double minWidthOfWidget = 0}) {
    final textPainter = TextPainter(
        textAlign: TextAlign.center, textDirection: TextDirection.ltr, text: TextSpan(text: text, style: textStyle))
      ..layout(maxWidth: maxWidthOfWidget, minWidth: minWidthOfWidget);
    return textPainter.height;
  }

  /// Text Width
  static double getTextWidth({required String text, required TextStyle textStyle}) {
    final textPainter = TextPainter(
        textAlign: TextAlign.center, textDirection: TextDirection.ltr, text: TextSpan(text: text, style: textStyle))
      ..layout();
    return textPainter.size.width;
  }


  static void copyStringToClipBoard({required String data}) async {
    final context = UtilsHelper.navigatorKey.currentContext;
    if (context == null) return;

    ClipboardData clipboardData = ClipboardData(text: data);
    await Clipboard.setData(clipboardData);
  }

  static String encode(String input) {
    final encrypter = Aes.Encrypter(Aes.AES(Constants.AES_KEY));
    final encrypted = encrypter.encrypt(input, iv: Constants.AES_INITIALIZATION_VECTOR);
    return encrypted.base64;
  }

  static decode(String input) {
    final encrypter = Aes.Encrypter(Aes.AES(Constants.AES_KEY));
    final decrypted = encrypter.decrypt64(input, iv: Constants.AES_INITIALIZATION_VECTOR);
    return decrypted;
  }

  /// when using it in a bloc and call a emit in function
  /// you must to await
  static Future<void> runInGuardZone({required Function func, Function(Object e)? onFailed, bool isShowProgress = false, bool showLoading = true}) async {
    try {
      // DialogUtils.showLoadingDialog(isShowProgress: isShowProgress);
      await func();
      // await DialogUtils.dismissPopup();
    } catch (e) {
      // await DialogUtils.dismissPopup();
      if (onFailed != null) onFailed(e);
      pushError(e);
    }
  }

  static void pushError(Object errorOrCode) {
    it<ErrorHandler>().pushError(errorOrCode);
  }

  static void dismissKeyBoard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static bool pop() {
    Navigator.pop(navigatorKey.currentContext!);
    return true;
  }

  static bool popUntil(RoutePredicate predicate) {
    Navigator.popUntil(navigatorKey.currentContext!, predicate);
    return true;
  }

  static bool popUntilName(String routeName) {
    Navigator.popUntil(navigatorKey.currentContext!, (route) => route.settings.name == routeName);
    return true;
  }

  static void popToLogin() {
    UtilsHelper.popUntil((route) => route.settings.name == Routes.login);
  }

  static Future<void> pushNamed(String route, [Object? data]) async {
    final arg = ArgumentsScreenModel(title: route, data: data);
    await Navigator.pushNamed(navigatorKey.currentContext!, route, arguments: arg);
  }

  static void popAllAndPushNamed(String route) {
    Navigator.restorablePopAndPushNamed(navigatorKey.currentContext!, route);
  }

  static void login(String userId) {
    navigatorKey.currentContext!.read<AuthenticationBloc>().add(AuthenticationEventLoggingIn(userId: userId));
  }

  static void logout() {
    DialogUtils.showPrimaryDialog(label: 'Log out', message: 'Do you want to sign out?', onConfirm: () => navigatorKey.currentContext!.read<AuthenticationBloc>().add(AuthenticationEventLoggingOut()), onCancel: () {});
  }

  static String formatMoney(double money) {
    final oCcy = intl.NumberFormat("#,##0", "vi_VN");
    return oCcy.format(money);
  }

  static String formatTime(DateTime date) {
    intl.DateFormat format = intl.DateFormat(Constants.DATE_TIME_FORMAT);
    return format.format(date);
  }

  static String formatDate(DateTime date) {
    intl.DateFormat format = intl.DateFormat(Constants.DATE_FORMAT);
    return format.format(date);
  }

  static String getCurrentDateTime() {
    final time = DateTime.now();
    intl.DateFormat format = intl.DateFormat(Constants.DATE_TIME_FORMAT);
    return format.format(time);
  }

  static String getCurrentTime() {
    final time = DateTime.now();
    intl.DateFormat format = intl.DateFormat(Constants.TIME_FORMAT);
    return format.format(time);
  }

  static String getTimeFromString(String date) {
    try {
      intl.DateFormat format = intl.DateFormat(Constants.HOUR_MINUTES_FORMAT);
      DateTime time = intl.DateFormat(Constants.DATE_TIME_FORMAT).parse(date);
      return format.format(time);
    } catch (e) {
      return 'none';
    }
  }

  static String getDateFromString(String date) {
    try {
      intl.DateFormat format = intl.DateFormat(Constants.DATE_FORMAT);
      DateTime time = intl.DateFormat(Constants.DATE_TIME_FORMAT).parse(date);
      return format.format(time);
    } catch (e) {
      return 'none';
    }
  }

  static String timestampToDateString(int? timestamp, {String formatTemplate = Constants.DATE_TIME_FORMAT}) {
    intl.DateFormat format = intl.DateFormat(formatTemplate);
    return format.format(DateTime.fromMillisecondsSinceEpoch((timestamp ?? 0) * 1000));
  }

  static DateTime timestampToDate(int? timestamp) {
    return DateTime.fromMillisecondsSinceEpoch((timestamp ?? 0) * 1000);
  }

  // minute
  static int getDiffFromTwo(String h1, String h2) {
    try {
      DateTime hour1 = intl.DateFormat(Constants.DATE_TIME_FORMAT).parse(h1);
      DateTime hour2 = intl.DateFormat(Constants.DATE_TIME_FORMAT).parse(h2);

      return hour1.difference(hour2).inMinutes;
    } catch (e) {
      return 0;
    }
  }

  static String getDiffHoursFromTwo(String h1, String h2) {
    try {
      String result = '';
      final diff = getDiffFromTwo(h1, h2).abs();

      if (diff ~/ (60 * 24) >= 1) {
        final day = diff ~/ (60 * 24);
        result += '$day day${day > 1 ? 's' : ''} ';
      }
      if (diff ~/ 60 >= 1) {
        final hour = diff % (60 * 24);
        final hourRemain = hour ~/ 60;
        result += '$hourRemain hour${hourRemain > 1 ? 's' : ''} ';
      }
      if (diff % 60 > 0) {
        final minute = diff % 60;
        result += '$minute minutes';
      }

      return result;
    } catch (e) {
      return '0 hour';
    }
  }

  // copy the element of target where it not empty
  static List<T> copyElementList<T>({required List<T> defaultList, required List<T> targetList, required T emptyValue}) {
    List<T> result = [];
    for (int i = 0; i < defaultList.length; i++) {
      if (targetList.length <= i) {
        result.add(defaultList[i]);
        continue;
      }
      final item = targetList[i];
      if (item != emptyValue) {
        result.add(item);
      } else {
        result.add(defaultList[i]);
      }
    }
    return result;
  }

  static bool contain(String a, String b) {
    if (a.toUpperCase().contains(b.toUpperCase())) {
      return true;
    }
    return false;
  }

  static dynamic getJsonValue(Map<String, dynamic> json, List<String> keys, {bool isCheckAllCase = true}) {
    for (int index = 0; index < keys.length; index++) {
      String key = keys[index];
      // convert key theo các trường hợp key
      if (isCheckAllCase) {
        Set<String> findByKeys = {key};
        findByKeys.add(key.camelCaseChange);
        findByKeys.add(key.snakeCase);
        findByKeys.add(key.pascalCase);
        findByKeys.add(key.paramCaseChange);
        for (var element in findByKeys) {
          if (json.containsKey(element)) {
            return json[element];
          }
        }
      } else {
        return json[key];
      }
    }
    return null;
  }

  static bool jsonKeyExist(Map<String, dynamic> json, String key, {bool isCheckAllCase = true}) {
    Set<String> keys = {key};
    if (isCheckAllCase) {
      keys.add(key.camelCaseChange);
      keys.add(key.snakeCase);
      keys.add(key.pascalCase);
      keys.add(key.paramCaseChange);
    }
    for (var element in keys) {
      if (json.containsKey(element)) {
        return true;
      }
    }
    return false;
  }
}
