import 'package:flutter/material.dart';
import 'package:sfl_flutter_package/src/sfl_button/res/sfl_button_res.dart';

/// A General SFL Button Widget to return specific Button Widget based on passed
/// [type] value. If not passed [TextButton] will be return by default.
class SFLButton extends StatelessWidget {
  SFLButton({
    required this.onPress,
    this.child,
    this.type = SFLButtonType.text,
    this.style,
    this.focusNode,
    this.icon,
    this.label,
    this.onLongPress,
    this.autoFocus = false,
    this.clipBehavior = Clip.none,
  }) : assert(
            ((type == SFLButtonType.text ||
                        type == SFLButtonType.elevated ||
                        type == SFLButtonType.outlined) &&
                    child != null &&
                    icon == null &&
                    label == null) ||
                ((type == SFLButtonType.elevatedIcon ||
                        type == SFLButtonType.textIcon ||
                        type == SFLButtonType.outlinedIcon) &&
                    child == null &&
                    label != null &&
                    icon != null),
            'For icon button label & icon must be provided and For button only buttonChild must be provided');

  /// [type] value [SFLButtonType.text] return a [TextButton] Widget
  /// [type] value [SFLButtonType.textIcon] return a [TextButton.icon] Widget
  /// [type] value [SFLButtonType.elevated] return a [ElevatedButton] Widget
  /// [type] value [SFLButtonType.elevatedIcon] return a [ElevatedButton.icon] Widget
  /// [type] value [SFLButtonType.outlined] return a [OutlinedButton] Widget
  /// [type] value [SFLButtonType.outlinedIcon] return a [OutlinedButton.icon] Widget
  final SFLButtonType type;

  /// [child] value is required to display a child widget for [SFLButtonType.text],
  /// [SFLButtonType.outlined], [SFLButtonType.elevated]
  final Widget? child;

  /// [onPress] defined callback for button press. If not passed button will be disabled
  final VoidCallback? onPress;

  /// [onLongPress] defined callback for button long press. It's an optional parameter.
  final VoidCallback? onLongPress;

  /// [style] defined styling for displayed button using [ButtonStyle] class
  final ButtonStyle? style;

  /// [focusNode] defined a FocusNode to be used to get Focus
  final FocusNode? focusNode;

  /// [icon] is required & used to display icon when [type] is having one of [SFLButtonType.textIcon],
  /// [SFLButtonType.outlinedIcon] & [SFLButtonType.outlinedIcon] values
  final Widget? icon;

  /// [label] is required & used to display text on right of icon when [type] is
  /// having one of [SFLButtonType.textIcon], [SFLButtonType.outlinedIcon] &
  /// [SFLButtonType.outlinedIcon] values.
  final Widget? label;

  /// Defined to enable AutoFocus or not. Default to false
  final bool autoFocus;

  /// Defaults to [Clip.none], and must not be null.
  final Clip clipBehavior;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case SFLButtonType.text:
        return TextButton(
          child: child!,
          onPressed: onPress,
          onLongPress: onLongPress,
          style: style,
          focusNode: focusNode,
          autofocus: autoFocus,
          clipBehavior: clipBehavior,
        );
      case SFLButtonType.textIcon:
        return TextButton.icon(
          icon: icon!,
          label: label!,
          onPressed: onPress,
          onLongPress: onLongPress,
          style: style,
          focusNode: focusNode,
          autofocus: autoFocus,
          clipBehavior: clipBehavior,
        );

      case SFLButtonType.elevated:
        return ElevatedButton(
          child: child,
          onPressed: onPress,
          onLongPress: onLongPress,
          style: style,
          focusNode: focusNode,
          autofocus: autoFocus,
          clipBehavior: clipBehavior,
        );
      case SFLButtonType.elevatedIcon:
        return ElevatedButton.icon(
          icon: icon!,
          label: label!,
          onPressed: onPress,
          onLongPress: onLongPress,
          style: style,
          focusNode: focusNode,
          autofocus: autoFocus,
          clipBehavior: clipBehavior,
        );

      case SFLButtonType.outlined:
        return OutlinedButton(
          child: child!,
          onPressed: onPress,
          onLongPress: onLongPress,
          style: style,
          focusNode: focusNode,
          autofocus: autoFocus,
          clipBehavior: clipBehavior,
        );
      case SFLButtonType.outlinedIcon:
        return OutlinedButton.icon(
          icon: icon!,
          label: label!,
          onPressed: onPress,
          onLongPress: onLongPress,
          style: style,
          focusNode: focusNode,
          autofocus: autoFocus,
          clipBehavior: clipBehavior,
        );
      default:
        return SizedBox();
    }
  }
}
