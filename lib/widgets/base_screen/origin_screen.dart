import 'package:flutter/material.dart';
import 'package:money_controller/core/src/app_colors.dart';
import 'package:money_controller/core/utils/utils_helper.dart';

class OriginScreen extends StatefulWidget {
  final Widget? child;
  final Color backgroundColor;
  final Widget? bottomNavigator;
  final PreferredSizeWidget? appbar;
  final Future<bool> Function()? onBackPress;

  const OriginScreen({
    Key? key,
    this.child,
    this.appbar,
    this.onBackPress,
    this.bottomNavigator,
    this.backgroundColor = AppColors.white,
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
    return WillPopScope(
      onWillPop: widget.onBackPress ?? onBackPressed,
      child: Container(
        color: widget.backgroundColor,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: widget.backgroundColor,
            bottomNavigationBar: widget.bottomNavigator,
            appBar: widget.appbar,
            body: widget.child,
          ),
        ),
      ),
    );
  }
}
