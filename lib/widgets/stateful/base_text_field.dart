import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:money_controller/core/src/app_colors.dart';
import 'package:money_controller/core/utils/dimension.dart';
import 'package:money_controller/widgets/stateless/base_tap_widget.dart';

class BaseTextField extends StatefulWidget {
  const BaseTextField({
    Key? key,
    this.controller,
    this.onTextChange,
    this.onFocusChange,
    this.hintText = '',
    this.prefixIcon,
    this.suffixIcon,
    this.secureText = false,
    this.autoFocus,
    this.containerDecoration,
    this.focusContainerDecoration,
    this.hintStyle,
    this.textStyle,
    this.focusTextStyle,
    this.textAlign = TextAlign.left,
    this.keyboardType = TextInputType.text,
    this.borderRadius = 10,
    this.paddingContainer,
    this.maxLine = 1,
    this.maxLenght,
    this.inputFormatters,
    this.textCapitalization = TextCapitalization.none,
  }) : super(key: key);

  final TextEditingController? controller;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final ValueChanged<String>? onTextChange;
  final ValueChanged<bool>? onFocusChange;
  final String hintText;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final TextStyle? focusTextStyle;
  final bool secureText;
  final bool? autoFocus;
  final BoxDecoration? containerDecoration;
  final BoxDecoration? focusContainerDecoration;
  final TextAlign textAlign;
  final TextInputType keyboardType;
  final double borderRadius;
  final EdgeInsetsGeometry? paddingContainer;
  final int maxLine;
  final int? maxLenght;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization textCapitalization;

  @override
  State<StatefulWidget> createState() => _MbTextInput();
}

class _MbTextInput extends State<BaseTextField> {
  final FocusNode focusNode = FocusNode();
  bool focus = false;

  void _focusChange() {
    setState(() {
      focus = focusNode.hasFocus;
    });
    if (widget.onFocusChange != null) widget.onFocusChange!(focusNode.hasFocus);
  }

  @override
  void initState() {
    focusNode.addListener(_focusChange);
    super.initState();
  }

  @override
  void dispose() {
    focusNode.removeListener(_focusChange);
    super.dispose();
  }

  BoxDecoration getDecoration() {
    if (focus) {
      return widget.focusContainerDecoration ??
          widget.containerDecoration ??
          BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(widget.borderRadius),
            border: Border.all(width: 1, color: AppColors.primary),
          );
    }

    return widget.containerDecoration ??
        BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(widget.borderRadius),
          border: Border.all(width: 1, color: Colors.transparent),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BaseTapWidget(
      onTap: focusNode.requestFocus,
      child: Container(
        padding: widget.paddingContainer ?? EdgeInsets.symmetric(horizontal: DeviceDimension.padding / 1.5),
        decoration: getDecoration(),
        clipBehavior: Clip.hardEdge,
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (widget.prefixIcon != null)
                Padding(
                  padding: EdgeInsets.only(right: DeviceDimension.padding / 2),
                  child: widget.prefixIcon!,
                ),
              Expanded(
                child: TextField(
                  maxLength: widget.maxLenght,
                  controller: widget.controller,
                  focusNode: focusNode,
                  autofocus: widget.autoFocus ?? false,
                  textAlign: widget.textAlign,
                  onChanged: widget.onTextChange,
                  textCapitalization: widget.textCapitalization,
                  style: focus ? (widget.focusTextStyle ?? widget.textStyle) : widget.textStyle,
                  obscureText: widget.secureText,
                  enableSuggestions: !widget.secureText,
                  autocorrect: !widget.secureText,
                  keyboardType: widget.keyboardType,
                  inputFormatters: widget.inputFormatters,
                  decoration: InputDecoration(
                    counterText: '',
                    isCollapsed: true,
                    hintText: widget.hintText,
                    hintStyle: widget.hintStyle,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    prefixIconConstraints: const BoxConstraints(maxWidth: 20, maxHeight: 20),
                  ),
                  maxLines: widget.maxLine,
                ),
              ),
              if (widget.suffixIcon != null)
                Padding(
                  padding: EdgeInsets.only(left: DeviceDimension.padding / 2),
                  child: widget.suffixIcon!,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
