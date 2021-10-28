import 'package:flutter/material.dart';
import 'package:sfl_flutter_package/src/sfl_improved_dialog/res/res_index.dart';
import 'package:sfl_flutter_package/src/sfl_improved_dialog/ui/display_enhanced_dialog.dart';

class SFLEnhancedDialog {
  /// A General SFL  Improved Dialog Widget to return specific Dialog  based on passed
  /// [type] value.

  /// Build Context [context] and SFLImprovedDialogBoxType [type] are required to be passed
  static void display({
    required BuildContext context,
    required DisplayEnhancedDialog dialog,
  }) {
    showDialog(
      context: context,
      builder: (context) => dialog,
    );
  }
}
