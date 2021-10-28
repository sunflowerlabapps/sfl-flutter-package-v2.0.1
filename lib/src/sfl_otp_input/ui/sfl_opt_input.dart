import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:sfl_flutter_package/sfl_flutter_package.dart';

// ignore: must_be_immutable
class SFLOtpInput extends StatefulWidget {
  /// [numberOfInputs] decides how many digits are there in your OTP.
  final int numberOfInputs;

  /// [obscuringCharacter] decides Numbers you enter are hidden or not.
  bool isObscureText;

  ///[obscuringCharacter] decides which character will be displayed as place holder while input is hidden.
  ///if not provided [*] will be taken as default.
  final String obscuringCharacter;

  /// [otpTextFieldHeight] will decide height of the input TextField.
  /// if not given 50 will be default value.
  final double otpTextFieldHeight;

  /// [otpTextFieldWidth] will decide width of the input TextField.
  /// if not given 50 will be default value.
  final double otpTextFieldWidth;

  /// [otpInputType] value [SFLOtpInputTypes.square] return a [Square TextField] for OTP input.
  /// [otpInputType] value [SFLOtpInputTypes.circular] return a [circular TextField] for OTP input.
  /// [otpInputType] value [SFLOtpInputTypes.underlined] return a [underlined TextField] for OTP input.
  /// if [otpInputType] is not given [SFLOtpInputTypes.underlined] will be default value.
  final SFLOtpInputTypes otpInputType;

  /// [onSubmitOtp] will work as call back function on submit button press.
  final Function? onSubmitOtp;

  /// bool value deciding display of cursor in TextField inputs
  /// default value is false
  final bool displayCursor;

  /// [normalBorderColor] will decide border color of the input TextFields while selected.
  Color? normalBorderColor;

  /// [normalBorderColor] will decide border color of the input TextFields while selected.
  Color? focusedBorderColor;

  ///
  final bool autoFocus;

  SFLOtpInput({
    @required this.onSubmitOtp,
    this.numberOfInputs = 3,
    this.obscuringCharacter = '*',
    this.otpTextFieldHeight = 50,
    this.otpTextFieldWidth = 50,
    this.otpInputType = SFLOtpInputTypes.underlined,
    this.isObscureText = true,
    this.normalBorderColor,
    this.focusedBorderColor,
    this.displayCursor = false,
    this.autoFocus = false,
  })  : assert(onSubmitOtp != null,
            "Missing function value for onSubmitOtp parameter "),
        assert(numberOfInputs > 2,
            "Number of Input is very less. Valid values are 3 or more.");
  @override
  _SFLOtpInputState createState() => _SFLOtpInputState();
}

class _SFLOtpInputState extends State<SFLOtpInput> {
  List<TextEditingController>? _otpInputControllers;
  List<FocusNode>? _otpFocusNodes;
  List<String?>? _enteredData;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _enteredOtp;

  @override
  void initState() {
    super.initState();
    _otpInputControllers =
        List.generate(widget.numberOfInputs, (i) => TextEditingController());
    _otpFocusNodes = List.generate(widget.numberOfInputs, (i) => FocusNode());
    _enteredData = List.generate(widget.numberOfInputs, (i) => "");
    if (widget.autoFocus) {
      WidgetsBinding.instance!.addPostFrameCallback(onLayoutDone);
    }
  }

  /// post frame build call
  void onLayoutDone(Duration timeStamp) {
    _otpFocusNodes![0].requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    widget.normalBorderColor = Theme.of(context).primaryColor;
    widget.focusedBorderColor = Theme.of(context).primaryColorDark;
    return Form(
      autovalidateMode: AutovalidateMode.always,
      key: _formKey,
      child: _buildTextInputs(),
    );
  }

  Widget _buildTextInputs() {
    return Container(
      height: widget.otpTextFieldHeight + 10,
      padding: EdgeInsets.symmetric(
        horizontal: 4,
        vertical: 1,
      ),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: NeverScrollableScrollPhysics(),
        itemCount: widget.numberOfInputs,
        itemBuilder: (context, index) {
          return Container(
            height: widget.otpTextFieldHeight,
            width: widget.otpTextFieldWidth,
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 8.0,
            ),
            child: TextFormField(
              controller: _otpInputControllers![index],
              focusNode: _otpFocusNodes![index],
              textAlign: TextAlign.center,
              textAlignVertical: TextAlignVertical.center,
              obscureText: widget.isObscureText,
              obscuringCharacter: widget.obscuringCharacter,
              keyboardType: TextInputType.number,
              showCursor: widget.displayCursor,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(1),
              ],
              decoration: _getInputDecorationType(
                widget.otpInputType,
              ),
              onSaved: (val) {
                setState(() {
                  _enteredData![index] = val;
                });
              },
              onChanged: (value) {
                if (value.length == 1 && index < widget.numberOfInputs - 1) {
                  _otpFocusNodes![index + 1].requestFocus();
                }
                if (value.length == 0 && index > 0) {
                  _otpFocusNodes![index - 1].requestFocus();
                }
                if (value.length != 0 && index == widget.numberOfInputs - 1) {
                  FocusScope.of(context).unfocus();
                  _formKey.currentState!.save();
                  setState(() {
                    _enteredOtp = _enteredData!.join();
                  });
                  widget.onSubmitOtp!(_enteredOtp);
                }
              },
            ),
          );
        },
      ),
    );
  }

  /// Get TextField decoration based on value of [SFLOtpInputTypes]
  InputDecoration _getInputDecorationType(SFLOtpInputTypes type) {
    switch (type) {
      case SFLOtpInputTypes.underlined:
        return InputDecoration(
          counter: Offstage(),
          contentPadding: EdgeInsets.only(bottom: 8),
          border: _getUnderlinedShapeBorder(),
          enabledBorder: _getUnderlinedShapeBorder(),
          focusedBorder: _getUnderlinedShapeBorder(isFocused: true),
        );
      case SFLOtpInputTypes.square:
        return InputDecoration(
          contentPadding: EdgeInsets.all(0),
          border: _getSquareShapeBorder(),
          enabledBorder: _getSquareShapeBorder(),
          focusedBorder: _getSquareShapeBorder(isFocused: true),
        );
      case SFLOtpInputTypes.circular:
        return InputDecoration(
          counter: Offstage(),
          contentPadding: EdgeInsets.all(0),
          border: _getCircularShapeBorder(),
          enabledBorder: _getCircularShapeBorder(),
          focusedBorder: _getCircularShapeBorder(isFocused: true),
        );
      default:
        return InputDecoration();
    }
  }

  /// Return border when SFLOtpInputTypes is [SFLOtpInputTypes.underlined]
  InputBorder _getUnderlinedShapeBorder({isFocused = false}) {
    return UnderlineInputBorder(
      borderSide: BorderSide(
        color:
            isFocused ? widget.focusedBorderColor! : widget.normalBorderColor!,
        width: isFocused ? 2.0 : 1.0,
      ),
    );
  }

  /// Return border when SFLOtpInputTypes is [SFLOtpInputTypes.square]
  InputBorder _getSquareShapeBorder({isFocused = false}) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color:
            isFocused ? widget.focusedBorderColor! : widget.focusedBorderColor!,
        width: isFocused ? 2.0 : 1.0,
      ),
    );
  }

  /// Return border when SFLOtpInputTypes is [SFLOtpInputTypes.circular]
  InputBorder _getCircularShapeBorder({isFocused = false}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.otpTextFieldHeight / 2),
      borderSide: BorderSide(
        color:
            isFocused ? widget.focusedBorderColor! : widget.normalBorderColor!,
        width: isFocused ? 2.0 : 1.0,
      ),
    );
  }
}
