import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sfl_flutter_package/sfl_flutter_package.dart';

class SFLToastDemo extends StatefulWidget {
  static final String route = 'sfl-toast-demo';

  @override
  _SFLToastDemoState createState() => _SFLToastDemoState();
}

class _SFLToastDemoState extends State<SFLToastDemo> {
  TextEditingController _textEditingController = TextEditingController();
  String _message;
  int _duration = 2;
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;
  bool _sendMessageOnly = false;

  final GlobalKey<FormFieldState> _inputKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SFL Toast Demo'),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                key: _inputKey,
                autovalidateMode: _autoValidateMode,
                controller: _textEditingController,
                textCapitalization: TextCapitalization.sentences,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w400,
                ),
                validator: (val) {
                  if (val.isEmpty) {
                    return "please enter a message";
                  } else {
                    return null;
                  }
                },
                onSaved: (val) {
                  _message = val;
                },
                decoration: InputDecoration(
                  labelText: 'Message',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                  hintText: 'Enter your message to toast',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Slider.adaptive(
                value: _duration.toDouble(),
                min: 0,
                max: 5,
                divisions: 5,
                label: _duration.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _duration = value.toInt();
                  });
                },
              ),
              Text(
                'Toast Duration: $_duration sec',
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: 20.0,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      'Pass Only String Message',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  Switch(
                    value: _sendMessageOnly,
                    onChanged: (val) {
                      setState(() {
                        _sendMessageOnly = val;
                      });
                    },
                  ),
                  Expanded(
                    child: Text(
                      'Pass Child Widget',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50.0,
              ),
              ElevatedButton(
                child: Text('DISPLAY TOAST FROM TOP'),
                onPressed: () {
                  _displaySFLToaster(context, fromTop: true);
                },
              ),
              ElevatedButton(
                child: Text('DISPLAY TOAST FROM BOTTOM'),
                onPressed: () {
                  _displaySFLToaster(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _displaySFLToaster(BuildContext context, {bool fromTop = false}) {
    if (_inputKey.currentState.validate()) {
      _inputKey.currentState.save();

      ///Actual Use of SFLToast.display() method
      if (!_sendMessageOnly) {
        ///Pass only String Message
        SFLToast.display(
          context: context,
          duration: Duration(milliseconds: _duration * 1000),
          direction: fromTop ? ToastDirection.top : ToastDirection.bottom,
          messageContainerColor: Colors.deepOrange,
          message: _message,
          messageStyle: TextStyle(
            fontSize: 14.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        );
      } else {
        ///Pass whole child widget to be displayed on screen
        SFLToast.display(
          context: context,
          duration: Duration(milliseconds: _duration * 1000),
          direction: fromTop ? ToastDirection.top : ToastDirection.bottom,
          child: Card(
            elevation: 3.0,
            borderOnForeground: true,
            color: Colors.black87,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 14.0,
              ),
              child: Text(
                _message,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        );
      }
    } else {
      setState(() {
        _autoValidateMode = AutovalidateMode.always;
      });
    }
  }
}
