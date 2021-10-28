import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sfl_flutter_package/src/sfl_improved_dialog/res/res_index.dart';
import 'package:sfl_flutter_package/src/sfl_improved_dialog/ui/scale_from_back.dart';

class DisplayEnhancedDialog extends StatelessWidget {
  ///[type] value defines what type of dialog will be displayed. It can be one of [alert],[confirmation] or [dialog].
  @required
  final SFLEnhancedDialogType type;

  /// [BuildContext] objects are actually [Element] objects. The [BuildContext]
  /// interface is used to discourage direct manipulation of [Element] objects.
  @required
  final BuildContext context;

  ///[title] value defined title of the dialog
  final String title;

  final TextStyle titleTextStyle;

  final TextStyle descriptionTextStyle;

  ///[description] value defines description show onn the dialog box.
  final String? description;

  ///[positiveButtonLabel] value defines text on the positive action button.
  final String positiveButtonLabel;

  ///[negativeButtonLabel] value defines text on the negative action button.
  final String negativeButtonLabel;

  ///[positiveTextStyle] value defines textStyle of positive action button.
  final TextStyle positiveTextStyle;

  ///[negativeTextStyle] value defines textStyle of negative action button.
  final TextStyle negativeTextStyle;

  ///[circularShapeColorConformation] defines color of Circular Shape on [confirmation] type dialog.
  final Color circularShapeColorConformation;

  ///[circularShapeColorAlert] defines color of Circular Shape on [alert] type dialog.
  final Color circularShapeColorAlert;

  ///[circularShapeColorDialog] defines color of Circular Shape on [dialog] type dialog.
  final Color circularShapeColorDialog;

  ///[iconConfirmation] defines icon in Circular Shape of [confirmation] type dialog.
  final Icon iconConfirmation;

  ///[iconAlert] defines icon in Circular shape of [alert] type dialog.
  final Icon iconAlert;

  ///[iconDialog] defines icon in Circular shape of [dialog] type dialog.
  final Icon iconDialog;

  ///[onNegativeButtonPress] defines which function will be called on negative action button is pressed.
  ///[confirmation] type dialog doesn't have [onNegativeButtonPress].
  final VoidCallback? onNegativeButtonPress;

  ///[onPositiveButtonPress] defines which function will be called on positive action button is pressed.
  ///[alert] type dialog doesn't have [onPositiveButtonPress].
  final VoidCallback? onPositiveButtonPress;

  /// specify radius for circle being displayed above
  final double circleRadius;

  /// specify padding for content being displayed
  final double contentPadding;

  DisplayEnhancedDialog({
    Key? key,
    required this.type,
    required this.context,
    required this.title,
    this.description,
    this.positiveButtonLabel = "Ok",
    this.negativeButtonLabel = "Cancel",
    this.negativeTextStyle = const TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
    ),
    this.positiveTextStyle = const TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
    ),
    this.circularShapeColorAlert = Colors.red,
    this.circularShapeColorConformation = Colors.green,
    this.circularShapeColorDialog = Colors.orange,
    this.iconAlert = const Icon(
      Icons.info,
      size: 28.0,
      color: Colors.white,
    ),
    this.iconConfirmation = const Icon(
      Icons.check,
      size: 28.0,
      color: Colors.white,
    ),
    this.iconDialog = const Icon(
      Icons.warning,
      size: 28.0,
      color: Colors.white,
    ),
    this.onNegativeButtonPress,
    this.onPositiveButtonPress,
    this.circleRadius = 40,
    this.contentPadding = 14,
    this.titleTextStyle = const TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
    ),
    this.descriptionTextStyle = const TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.w500,
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: _buildDialogContent(context),
    );
  }

  Widget _buildDialogContent(context) {
    // void negativeCallBack = onNegativeButtonPress ?? Navigator.pop(context);
    // void positiveCallBack = onPositiveButtonPress ?? Navigator.pop(context);
    Widget _topCenterIconWidget = _buildCircularShape();
    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          padding: EdgeInsets.only(
            top: circleRadius + contentPadding,
            left: contentPadding,
            right: contentPadding,
            bottom: contentPadding,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black38,
                offset: Offset(0, 10),
                blurRadius: 10,
              ),
            ],
          ),
          child: _buildDetailsColumn(context),
        ),
        Positioned(
          top: -circleRadius,
          left: 0.0,
          right: 0.0,
          child: ScaleFromBack(
            child: _topCenterIconWidget,
            duration: Duration(milliseconds: 500),
          ),
        ),
      ],
    );
  }

  /// build column details
  Widget _buildDetailsColumn(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          description!,
          style: TextStyle(fontSize: 14),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 22,
        ),
        _buildButtonRow(context),
      ],
    );
  }

  /// build action button row
  Widget _buildButtonRow(BuildContext context) {
    Widget _return = SizedBox();
    switch (type) {
      case SFLEnhancedDialogType.dialog:
        _return = Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNegativeActionButton(onNegativeButtonPress, context),
            _buildPositiveActionButton(onPositiveButtonPress, context),
          ],
        );
        break;
      case SFLEnhancedDialogType.alert:
        _return = _buildNegativeActionButton(onNegativeButtonPress, context);
        break;
      case SFLEnhancedDialogType.confirmation:
        _return = _buildPositiveActionButton(onPositiveButtonPress, context);
        break;
    }
    return _return;
  }

  ///builds positive action button
  TextButton _buildPositiveActionButton(
      VoidCallback? positiveCallBack, context) {
    return TextButton(
      onPressed: positiveCallBack ?? Navigator.of(context).pop,
      child: Text(
        positiveButtonLabel,
        style: positiveTextStyle,
      ),
    );
  }

  ///builds negative action button
  TextButton _buildNegativeActionButton(
      VoidCallback? negativeCallBack, context) {
    return TextButton(
      onPressed: negativeCallBack ?? Navigator.of(context).pop,
      child: Text(
        negativeButtonLabel,
        style: negativeTextStyle,
      ),
    );
  }

  ///Created Circular shape in top of dialog
  Widget _buildCircularShape() {
    Widget _returnWidget = SizedBox();
    switch (type) {
      case SFLEnhancedDialogType.dialog:
        _returnWidget = _buildTopCircleShape(
          color: circularShapeColorDialog,
          icon: iconDialog,
        );
        break;
      case SFLEnhancedDialogType.alert:
        _returnWidget = _buildTopCircleShape(
          color: circularShapeColorAlert,
          icon: iconAlert,
        );
        break;
      case SFLEnhancedDialogType.confirmation:
        _returnWidget = _buildTopCircleShape(
          color: circularShapeColorConformation,
          icon: iconConfirmation,
        );
        break;
    }
    return _returnWidget;
  }

  /// custom circular shape overlay button
  Widget _buildTopCircleShape({Color? color, Widget? icon}) {
    return CircleAvatar(
      backgroundColor: color!,
      radius: circleRadius,
      child: icon!,
    );
  }
}
