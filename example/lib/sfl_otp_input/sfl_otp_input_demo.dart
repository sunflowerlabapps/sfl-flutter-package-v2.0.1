import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sfl_flutter_package/sfl_flutter_package.dart';

class SFLOtpInputDemo extends StatefulWidget {
  static final String route = 'sfl-otp-input-demo';

  const SFLOtpInputDemo({Key key}) : super(key: key);

  @override
  _SFLOtpInputDemoState createState() => _SFLOtpInputDemoState();
}

class _SFLOtpInputDemoState extends State<SFLOtpInputDemo> {
  bool _isObscureText = false;
  String _enteredOtp;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: _scaffoldKey,
      appBar: AppBar(
        title: Text('SFL OTP Input Demo'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SFLOtpInput(
              numberOfInputs: 4,
              isObscureText: _isObscureText,
              onSubmitOtp: onReceivedOtp,
              displayCursor: true,
              otpInputType: SFLOtpInputTypes.circular,
            ),
            TextButton.icon(
              onPressed: () {
                setState(() {
                  _isObscureText = !_isObscureText;
                });
              },
              icon: Icon(_isObscureText
                  ? Icons.remove_red_eye_outlined
                  : Icons.remove_red_eye),
              label: Text(_isObscureText ? 'view' : 'hide'),
            ),
            Visibility(
              visible: _enteredOtp != null,
              child: Text('$_enteredOtp'),
            ),
          ],
        ),
      ),
    );
  }

  void onReceivedOtp(String otp) {
    log('Entered OTP: $otp');
    setState(() {
      _enteredOtp = otp;
    });
  }
}
