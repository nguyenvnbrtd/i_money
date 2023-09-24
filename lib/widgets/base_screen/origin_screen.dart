import 'package:flutter/material.dart';
import 'package:money_controller/core/src/app_colors.dart';
import 'package:money_controller/core/utils/utils_helper.dart';

class OriginScreen extends StatefulWidget {
  final Widget? child;
  final PreferredSizeWidget? appbar;
  final Widget? bottomNavigator;
  final Future<bool> Function()? onBackPress;
  final Color backgroundColor;

  const OriginScreen({
    Key? key,
    this.child,
    this.appbar,
    this.bottomNavigator,
    this.onBackPress,
    this.backgroundColor = AppColors.primary,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _OriginScreen();
}

class _OriginScreen extends State<OriginScreen> {
  Future<bool> onBackPressed() async {
    return UtilsHelper.pop();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return WillPopScope(
        onWillPop: widget.onBackPress ?? onBackPressed,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: theme.backgroundColor,
            bottomNavigationBar: widget.bottomNavigator,
            appBar: widget.appbar,
            body: widget.child,
          ),
        ));
  }
}
