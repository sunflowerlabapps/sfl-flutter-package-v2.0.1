import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../res/sfl_loader_res.dart';

class SFLLoader extends StatelessWidget {
  SFLLoader({
    this.loaderType = SFLLoaderTypes.circularNative,
    this.strokeWidth = 3,
    this.backgroundColor,
    this.valueColor,
    this.value,
    this.radius = 15,
    this.brightness,
  });

  /// [type] value [SFLLoaderTypes.circularNative] return a valued or an infinite [CupertinoActivityIndicator / CircularProgressIndicator] Widget based on Platform
  /// [type] value [SFLLoaderTypes.circulareHybrid] return a valued or an infinite [CircularProgressIndicator] Widget based on Platform
  /// [type] value [SFLLoaderTypes.linearNative] return a valued or an infinite [LinearProgressIndicator] Widget based on Platform
  final SFLLoaderTypes loaderType;

  ///[value] will define the value of [CircularProgressIndicator / LinearProgressIndicator / CupertinoActivityIndicator] which has been completed.
  final double? value;

  /// [strokeWidth] width of Circular/ liner bar of [CircularProgressIndicator / LinearProgressIndicator]. If not passed default value is taken as 2.
  final double strokeWidth;

  /// [backgroundColor] defined Color for android / Hybrid based [CircularProgressIndicator / LinearProgressIndicator] which will show non-valued part . If not passed theme color will be taken.
  final Color? backgroundColor;

  /// [valueColor] defined Color for android / Hybrid based [CircularProgressIndicator / LinearProgressIndicator] which will show valued part . If not passed theme color will be taken.
  final Color? valueColor;

  /// [radius] defines the radius of [CircularProgressIndicator / CupertinoActivityIndicator], default value is 15
  final double radius;

  ///  [brightness] defines theme for Cupertino Activity Indicator. Default will be taken from Theme.of(context).brightness
  final Brightness? brightness;

  @override
  Widget build(BuildContext context) {
    switch (loaderType) {
      case SFLLoaderTypes.circularNative:
        return Platform.isIOS
            ? _buildCircularNativeIos(context)
            : _buildCircularIndicator(context);

      case SFLLoaderTypes.circular:
        return _buildCircularIndicator(context);

      case SFLLoaderTypes.linear:
        return _buildLinearProgressIndicator(context);
      default:
        return Container();
    }
  }

  /// Return a Linear Progress Indicator
  Widget _buildLinearProgressIndicator(BuildContext context) {
    return LinearProgressIndicator(
      backgroundColor: backgroundColor ?? Theme.of(context).backgroundColor,
      valueColor: AlwaysStoppedAnimation<Color>(
          valueColor ?? Theme.of(context).accentColor),
      minHeight: strokeWidth,
      value: value,
    );
  }

  /// Return a Circular Progress Indicator
  Widget _buildCircularIndicator(BuildContext context) {
    return CircularProgressIndicator(
      strokeWidth: strokeWidth,
      backgroundColor: backgroundColor ?? Theme.of(context).backgroundColor,
      valueColor: AlwaysStoppedAnimation<Color>(
          valueColor ?? Theme.of(context).accentColor),
      value: value,
    );
  }

  /// Return a Cupertino Activity Indicator
  Widget _buildCircularNativeIos(BuildContext context) {
    return Theme(
      data: ThemeData(
        cupertinoOverrideTheme: CupertinoThemeData(
          brightness: brightness ?? Theme.of(context).brightness,
        ),
      ),
      child: value != null && value != 0.0
          ? CupertinoActivityIndicator.partiallyRevealed(
              radius: radius,
              progress: value ?? 1.0,
            )
          : CupertinoActivityIndicator(
              animating: true,
              radius: radius,
            ),
    );
  }
}
