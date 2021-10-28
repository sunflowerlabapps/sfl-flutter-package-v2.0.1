import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sfl_flutter_package/src/sfl_dialog/res/res_index.dart';

class DisplayDialog extends StatelessWidget {
  DisplayDialog({
    required this.context,
    required this.message,
    this.type = SFLDialogType.Default,
    this.messageTextStyle,
    this.title,
    this.titleTextStyle,
    this.positiveButtonText = 'Ok',
    this.positiveButtonTextStyle,
    this.positiveButtonCallBack,
    this.negativeButtonText = 'Cancel',
    this.negativeButtonTextStyle,
    this.negativeButtonCallBack,
    this.neutralButtonText = 'Neutral Button',
    this.neutralButtonTextStyle,
    this.neutralButtonCallBack,
    this.shape,
    this.displayPositiveButton = true,
    this.displayNegativeButton = true,
    this.displayNeutralButton = false,
  })  : assert(title!.isNotEmpty, "title should contain some value to display"),
        assert(message!.isNotEmpty,
            "message should contain some value to display");

  /// [BuildContext] objects are actually [Element] objects. The [BuildContext]
  /// interface is used to discourage direct manipulation of [Element] objects.
  final BuildContext? context;

  /// [type] value [SFLDialogType.PlatformSpecific] return a [AlertDialog] Widget which has platform specific look and feel.
  /// [type] value [SFLDialogType.Default] return a [AlertDialog] Widget which has default Android specific look and feel.
  final SFLDialogType type;

  /// [title] value defines the Title of the Dialog.
  final String? title;

  /// It Defines the style and look of the Title.
  final TextStyle? titleTextStyle;

  /// [message] value defines the message that to be shown on Dialog.
  final String? message;

  /// It Defines the style and look of the Message.
  final TextStyle? messageTextStyle;

  /// bool to decided positive button should be displayed or not
  final bool displayPositiveButton;

  /// It is the text displayed for the Positive Button.
  final String? positiveButtonText;

  /// Defines the style of the Positive button.
  final TextStyle? positiveButtonTextStyle;

  /// Function Callback triggered on button pressed.
  final VoidCallback? positiveButtonCallBack;

  /// bool to decided negative button should be displayed or not
  final bool displayNegativeButton;

  /// It is the text displayed for the Negative Button.
  final String? negativeButtonText;

  /// Defines the style of the Negative button.
  final TextStyle? negativeButtonTextStyle;

  /// Function Callback triggered on button pressed.
  final VoidCallback? negativeButtonCallBack;

  /// bool to decided neutral button should be displayed or not
  final bool displayNeutralButton;

  /// It is the text displayed for the Neutral Button.
  final String? neutralButtonText;

  /// Defines the style of the Neutral button.
  final TextStyle? neutralButtonTextStyle;

  /// Function Callback triggered on button pressed.
  final VoidCallback? neutralButtonCallBack;

  /// It defines the shape of the default dialog.
  final ShapeBorder? shape;

  @override
  Widget build(context) {
    if (type == SFLDialogType.PlatformSpecific) {
      return displayPlatformSpecificDialog(context);
    } else {
      return displayAndroidStyleDialog();
    }
  }

  ///Display Platform Specific Dialog
  Widget displayPlatformSpecificDialog(BuildContext context) {
    if (Platform.isIOS) {
      return displayIosStyleDialog();
    } else {
      return displayAndroidStyleDialog();
    }
  }

  ///Return Android style Dialog
  Widget displayAndroidStyleDialog() {
    return AlertDialog(
      shape: shape,
      title: Text(
        title!,
        style: titleTextStyle,
      ),
      content: Text(
        message!,
        style: messageTextStyle,
      ),
      actions: [
        (displayPositiveButton)
            ? TextButton(
                onPressed: positiveButtonCallBack,
                child: Text(
                  positiveButtonText!,
                  style: positiveButtonTextStyle,
                ),
              )
            : SizedBox(),
        (displayNegativeButton)
            ? TextButton(
                onPressed: negativeButtonCallBack,
                child: Text(
                  negativeButtonText!,
                  style: negativeButtonTextStyle,
                ),
              )
            : SizedBox(),
        (displayNeutralButton)
            ? TextButton(
                onPressed: neutralButtonCallBack,
                child: Text(
                  neutralButtonText!,
                  style: neutralButtonTextStyle,
                ),
              )
            : SizedBox(),
      ],
    );
  }

  ///Return iOS style Dialog
  Widget displayIosStyleDialog() {
    return CupertinoAlertDialog(
      title: Text(title!),
      content: Text(message!),
      actions: <Widget>[
        (displayPositiveButton)
            ? CupertinoDialogAction(
                child: Text(
                  positiveButtonText!,
                  style: positiveButtonTextStyle,
                ),
                onPressed: positiveButtonCallBack,
                isDefaultAction: true,
              )
            : SizedBox(),
        (displayNegativeButton)
            ? CupertinoDialogAction(
                child: Text(
                  negativeButtonText!,
                  style: negativeButtonTextStyle,
                ),
                onPressed: negativeButtonCallBack,
                isDefaultAction: true,
              )
            : SizedBox(),
        (displayNeutralButton)
            ? CupertinoDialogAction(
                child: Text(
                  neutralButtonText!,
                  style: neutralButtonTextStyle,
                ),
                onPressed: neutralButtonCallBack,
                isDefaultAction: true,
              )
            : SizedBox(),
      ],
    );
  }
}
