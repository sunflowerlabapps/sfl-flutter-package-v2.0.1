import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:sfl_flutter_package/sfl_flutter_package.dart';

/// A General SFL TextFormField Widget to return specific TextFormField Widget based on passed
/// [decorationType] value. If not passed [TextFormField] will be return by default.
class SFLTextField extends StatefulWidget {
  SFLTextField({
    @required this.controller,
    @required this.label,
    @required this.hint,
    this.autoValidateMode,
    this.focusNode,
    this.nextNode,
    this.onSaved,
    this.onChanged,
    this.validatorFunction,
    this.labelColor,
    this.hintColor,
    this.inputTextColor,
    this.borderColor = Colors.black,
    this.focusBorderColor = Colors.black,
    this.decorationType = SFLTextFieldDecorationType.filled,
    this.filledBackgroundColor,
    this.textCapitalization = TextCapitalization.words,
    this.inputAction = TextInputAction.next,
    this.editable = true,
    this.validLength = 255,
    this.prefixIcon,
    this.suffixIcon,
    this.autoCorrect = true,
    this.cursorRadius,
    this.cursorColor,
    this.cursorWidth = 2.0,
    this.textInputType,
  });

  /// AutovalidateMode if used without Form widget
  final AutovalidateMode? autoValidateMode;

  /// [decorationType] value [SflTextFieldDecorationType.filled] return a [TextFormField] Widget with filled background and without border
  /// [decorationType] value [SflTextFieldDecorationType.filledOutlined] return a [TextFormField] Widget with filled background and with border
  /// [decorationType] value [SflTextFieldDecorationType.outlined] return a [TextFormField] Widget with border
  final SFLTextFieldDecorationType decorationType;

  /// Defined for Users Who want to create their own validations.
  final Function? validatorFunction;

  /// Defined for the field background color.
  final Color? filledBackgroundColor;

  /// Defined for the label text color.
  final Color? labelColor;

  /// Defined for the hint text color.
  final Color? hintColor;

  /// Defined for the text input color.
  final Color? inputTextColor;

  /// Defined for the border color.
  final Color? borderColor;

  /// Defined for the focused border color.
  final Color? focusBorderColor;

  ///When the input field is empty and unfocused, the label is displayed on top of the input field.
  final String? label;

  /// Displayed on top of the [InputDecorator.child] (i.e., at the same location
  /// on the screen where text may be entered in the [InputDecorator.child])
  final String? hint;

  /// Controls the text being edited.
  /// If null, this widget will create its own [TextEditingController] and
  /// initialize its [TextEditingController.text] with [initialValue].
  final TextEditingController? controller;
  final TextInputAction inputAction;

  /// Defined for the current focus.
  final FocusNode? focusNode;

  /// Defined for the next focus in the field. If there is no next field set to null.
  final FocusNode? nextNode;

  /// This is optional block of code can be used to run code when the user saves the form.
  final Function? onSaved;

  /// Called when the user initiates a change to the TextFormField's value.
  final Function? onChanged;

  /// Defines the Input Type of the text
  final TextInputType? textInputType;

  /// Configures how the platform keyboard will select an uppercase or lowercase keyboard.
  final TextCapitalization textCapitalization;

  /// Configures that whether the TextFormField is Editable or readonly.
  final bool editable;

  /// This is the length that should be accepted by the TextFormField.
  final int validLength;

  /// It will place the icon at the end of the TextFormField.
  final Widget? suffixIcon;

  /// It will place the icon at the starting of the TextFormField.
  final Widget? prefixIcon;

  /// Defined for Auto Correcting the words.
  final bool autoCorrect;

  /// Cursor Properties for changing the color, radius and width of the Cursor.
  final Color? cursorColor;
  final Radius? cursorRadius;
  final double? cursorWidth;

  @override
  _SFLTextFieldState createState() => _SFLTextFieldState();
}

class _SFLTextFieldState extends State<SFLTextField> {
  bool _isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: widget.autoCorrect,
      autovalidateMode: widget.autoValidateMode,
      obscureText: (widget.textInputType == TextInputType.visiblePassword)
          ? _isObscureText
          : false,
      controller: widget.controller,
      focusNode: widget.focusNode,
      cursorColor: widget.cursorColor ?? widget.inputTextColor,
      cursorRadius: widget.cursorRadius,
      cursorWidth: widget.cursorWidth!,
      validator: (val) => widget.validatorFunction!(val),
      onSaved: (val) => widget.onSaved!(val),
      keyboardType: widget.textInputType,
      minLines: (widget.textInputType == TextInputType.multiline) ? 5 : 1,
      maxLines: (widget.textInputType == TextInputType.multiline) ? 5 : 1,
      keyboardAppearance: Theme.of(context).brightness,
      style: Theme.of(context).textTheme.headline6!.copyWith(
            color: widget.inputTextColor,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
      enabled: widget.editable,
      textCapitalization: widget.textCapitalization,
      textInputAction: widget.inputAction,
      onFieldSubmitted: (term) {
        _fieldFocusChange(context, widget.focusNode!, widget.nextNode!);
      },
      onChanged: (val) => widget.onChanged!(val),
      inputFormatters: (widget.textInputType == TextInputType.number)
          ? [FilteringTextInputFormatter.digitsOnly]
          : [LengthLimitingTextInputFormatter(widget.validLength)],
      decoration: InputDecoration(
        alignLabelWithHint: widget.prefixIcon != null ? false : true,
        suffixIcon: (widget.textInputType == TextInputType.visiblePassword)
            ? IconButton(
                icon: Icon(
                    _isObscureText ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    _isObscureText = !_isObscureText;
                  });
                },
              )
            : widget.suffixIcon,
        prefixIcon: widget.prefixIcon ?? null,
        filled: (widget.decorationType == SFLTextFieldDecorationType.outlined)
            ? false
            : true,
        fillColor: widget.filledBackgroundColor,
        contentPadding:
            (widget.decorationType == SFLTextFieldDecorationType.filled)
                ? EdgeInsets.symmetric(vertical: 10, horizontal: 16)
                : EdgeInsets.fromLTRB(16, 16, 16, 16),
        labelText:
            (widget.decorationType == SFLTextFieldDecorationType.filledOutlined)
                ? null
                : widget.label,
        labelStyle: Theme.of(context).textTheme.headline6!.copyWith(
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              color: widget.labelColor,
            ),
        hintText: widget.hint,
        hintStyle: Theme.of(context).textTheme.headline6!.copyWith(
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            color: widget.hintColor),
        focusedBorder:
            (widget.decorationType == SFLTextFieldDecorationType.filled)
                ? null
                : OutlineInputBorder(
                    borderSide: BorderSide(color: widget.focusBorderColor!),
                    borderRadius: BorderRadius.circular(10),
                  ),
        enabledBorder:
            (widget.decorationType == SFLTextFieldDecorationType.filled)
                ? null
                : OutlineInputBorder(
                    borderSide: BorderSide(color: widget.borderColor!),
                    borderRadius: BorderRadius.circular(10),
                  ),
        border: (widget.decorationType == SFLTextFieldDecorationType.filled)
            ? null
            : OutlineInputBorder(
                borderSide: BorderSide(color: widget.borderColor!),
                borderRadius: BorderRadius.circular(10),
              ),
        //errorText: _validator(widget.controller.text),
        errorStyle: TextStyle(
          fontSize: 12.0,
          color: Theme.of(context)
              .errorColor
              .withOpacity(0.7), // or any other color
        ),
      ),
    );
  }

  /// Function to change from current focus to the next focus for TextFormFields.
  _fieldFocusChange(
      BuildContext context, FocusNode? currentFocus, FocusNode? nextFocus) {
    if (nextFocus != null) {
      currentFocus!.unfocus();
      FocusScope.of(context).requestFocus(nextFocus);
    } else {
      FocusScope.of(context).requestFocus(FocusNode());
    }
  }
}
