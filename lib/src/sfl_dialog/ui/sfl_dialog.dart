import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sfl_flutter_package/src/sfl_dialog/res/res_index.dart';
import 'package:sfl_flutter_package/src/sfl_dialog/ui/display_dialog.dart';

/*
*  SFL Dialog class
*  contains method to display dialog on the screen
*  by passing BuildContext and Message from Screen where it needs to display 
* */

class SFLDialog {
  /// A General SFL Dialog Widget to return specific AlertDialog Widget based on passed
  /// [type] value. If not passed [AlertDialog] will return a default AlertDialog.

  /// Build Context [context] and String [message] are required to be passed

  static void display({
    required BuildContext context,
    required String message,
    SFLDialogType type = SFLDialogType.Default,
    TextStyle? messageTextStyle,
    String? title,
    TextStyle? titleTextStyle,
    bool displayPositiveButton = true,
    String? positiveButtonText,
    TextStyle? positiveButtonTextStyle,
    VoidCallback? positiveButtonCallBack,
    bool displayNegativeButton = true,
    String? negativeButtonText,
    TextStyle? negativeButtonTextStyle,
    VoidCallback? negativeButtonCallBack,
    bool displayNeutralButton = false,
    String? neutralButtonText,
    TextStyle? neutralButtonTextStyle,
    VoidCallback? neutralButtonCallBack,
    ShapeBorder? shape,
  }) async {
    assert(message.isNotEmpty, "message should contain some value to display");

    showDialog(
      context: context,
      builder: (context) => DisplayDialog(
        context: context,
        type: type,
        message: message,
        messageTextStyle: messageTextStyle,
        title: title,
        titleTextStyle: titleTextStyle,
        displayPositiveButton: displayPositiveButton,
        positiveButtonText: positiveButtonText,
        positiveButtonTextStyle: positiveButtonTextStyle,
        positiveButtonCallBack: positiveButtonCallBack,
        displayNegativeButton: displayNegativeButton,
        negativeButtonText: negativeButtonText,
        negativeButtonTextStyle: negativeButtonTextStyle,
        negativeButtonCallBack: negativeButtonCallBack,
        displayNeutralButton: displayNeutralButton,
        neutralButtonText: neutralButtonText,
        neutralButtonTextStyle: neutralButtonTextStyle,
        neutralButtonCallBack: neutralButtonCallBack,
        shape: shape,
      ),
    );
  }
}
