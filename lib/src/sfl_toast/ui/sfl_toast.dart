import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sfl_flutter_package/sfl_flutter_package.dart';
import 'package:sfl_flutter_package/src/sfl_toast/ui/fade_in_from.dart';

/*
*  SFL Toast class
*  contains method to display toast messages and child component on the screen
*  by passing BuildContext from Screen where it needs to display 
* */
class SFLToast {
  /// Display Widget child or String message based on specified direction for
  /// specified duration
  /// Build Context [context] is required to be passed
  /// Either [child] or String [message] will be displayed and If both passed [child]
  /// will be displayed, for passed Duration() value to [duration] parameter.
  /// [direction] will define from where Widget needs to be displayed on the screen.
  /// Value [ToastDirection.top] will display from top & [ToastDirection.bottom] will
  /// display from bottom.
  /// Passing TextStyle value to [messageTextStyle] will be used to style passed String [message]
  /// & override default TextStyle specified for it.
  /// Color value to [messageContainerColor] will take effect only when String [message] is
  /// passed & override default backgroundColor specified for it. Default color is
  /// [Theme.of(context).primaryColorDark].
  /// [textAlign] will handle alignment of message displayed in Toast.
  static void display({
    required BuildContext context,
    Widget? child,
    String? message,
    TextStyle? messageStyle,
    Color? messageContainerColor,
    Duration duration = const Duration(milliseconds: 3000),
    ToastDirection direction = ToastDirection.bottom,
    TextAlign textAlignment = TextAlign.center,
  }) async {
    OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) {
        if (direction == ToastDirection.top) {
          return Positioned(
            top: MediaQuery.of(context).padding.top,
            left: 10.0,
            right: 10.0,
            child: FadeInFrom(
              duration: duration,
              child: child ??
                  _getCustomMessageComponent(context, message, messageStyle,
                      messageContainerColor, textAlignment),
              fromTop: true,
            ),
          );
        } else {
          return Positioned(
            bottom: MediaQuery.of(context).padding.bottom,
            left: 10.0,
            right: 10.0,
            child: FadeInFrom(
              duration: duration,
              child: child ??
                  _getCustomMessageComponent(context, message, messageStyle,
                      messageContainerColor, textAlignment),
              fromTop: false,
            ),
          );
        }
      },
    );

    _addOverlayToContext(context, overlayEntry, duration);
  }

  static void _addOverlayToContext(BuildContext context,
      OverlayEntry overlayEntry, Duration duration) async {
    OverlayState overlayState = Overlay.of(context)!;
    overlayState.insert(overlayEntry);
    await Future.delayed(
      Duration(milliseconds: 750) + duration,
    );
    overlayEntry.remove();
  }

  static Widget _getCustomMessageComponent(
      BuildContext context,
      String? message,
      TextStyle? messageStyle,
      Color? backgroundColor,
      TextAlign textAlignment) {
    return Card(
      elevation: 2.0,
      color: backgroundColor ?? Theme.of(context).primaryColorDark,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          8.0,
        ),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 20.0,
        ),
        child: Text(
          message!,
          textAlign: textAlignment,
          style: messageStyle ??
              TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
        ),
      ),
    );
  }
}
