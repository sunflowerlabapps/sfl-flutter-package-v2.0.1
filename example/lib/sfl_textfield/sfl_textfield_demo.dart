import 'package:flutter/material.dart';
import 'package:sfl_flutter_package/sfl_flutter_package.dart';

class SFLTextFieldDemo extends StatefulWidget {
  static final String route = 'sfl-text_field-demo';
  @override
  _SFLTextFieldDemoState createState() => _SFLTextFieldDemoState();
}

class _SFLTextFieldDemoState extends State<SFLTextFieldDemo> {
  final FocusNode _textFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _numberFocus = FocusNode();
  final FocusNode _phoneNumberFocus = FocusNode();
  final FocusNode _multiLineFocus = FocusNode();

  TextEditingController _textController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _numberController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _multiLineController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SFL TextField'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SFLTextField(
                  decorationType: SFLTextFieldDecorationType.filled,
                  textInputType: TextInputType.text,
                  controller: _textController,
                  filledBackgroundColor: Colors.grey[300],
                  label: "Simple Text",
                  hint: "Enter Text",
                  focusNode: _textFocus,
                  nextNode: _emailFocus,
                  onSaved: (term) {
                    print("$term");
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SFLTextField(
                  decorationType: SFLTextFieldDecorationType.outlined,
                  textInputType: TextInputType.emailAddress,
                  filledBackgroundColor: Colors.red,
                  controller: _emailController,
                  borderColor: Colors.black,
                  label: "Email",
                  hint: "Enter Email",
                  validatorFunction: (term) {
                    print("$term");
                  },
                  suffixIcon: IconButton(
                    icon: Icon(Icons.mail),
                    onPressed: () {},
                  ),
                  focusNode: _emailFocus,
                  nextNode: _passwordFocus,
                  onSaved: (term) {
                    print("$term");
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SFLTextField(
                  textInputType: TextInputType.visiblePassword,
                  controller: _passwordController,
                  label: "Password",
                  hint: "Enter Password",
                  focusNode: _passwordFocus,
                  nextNode: _numberFocus,
                  onSaved: (term) {
                    print("$term");
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SFLTextField(
                  decorationType: SFLTextFieldDecorationType.filledOutlined,
                  textInputType: TextInputType.number,
                  controller: _numberController,
                  prefixIcon: Icon(Icons.confirmation_number),
                  label: "Number",
                  hint: "Enter Number",
                  focusNode: _numberFocus,
                  nextNode: _phoneNumberFocus,
                  onSaved: (term) {
                    print("$term");
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SFLTextField(
                  decorationType: SFLTextFieldDecorationType.filledOutlined,
                  filledBackgroundColor: Colors.teal[400],
                  prefixIcon: IconButton(
                    icon: Icon(Icons.phone),
                    onPressed: () {},
                  ),
                  validLength: 10,
                  textInputType: TextInputType.phone,
                  controller: _phoneNumberController,
                  label: "Phone Number",
                  labelColor: Colors.black,
                  borderColor: Colors.blueGrey[700],
                  hint: "Enter Phone Number",
                  focusNode: _phoneNumberFocus,
                  nextNode: _multiLineFocus,
                  onSaved: (term) {
                    print("$term");
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SFLTextField(
                  decorationType: SFLTextFieldDecorationType.filledOutlined,
                  filledBackgroundColor: Colors.white,
                  textInputType: TextInputType.multiline,
                  controller: _multiLineController,
                  label: "Multiline Comment",
                  hint: "Enter Multiline",
                  focusNode: _multiLineFocus,
                  nextNode: null,
                  borderColor: Colors.red,
                  onSaved: (term) {
                    print("$term");
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
