import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sfl_flutter_package/sfl_flutter_package.dart';

class SFLDialogDemo extends StatefulWidget {
  static final String route = 'sfl-dialog-demo';
  @override
  _SFLDialogDemoState createState() => _SFLDialogDemoState();
}

class _SFLDialogDemoState extends State<SFLDialogDemo> {
  void _displayDialog(BuildContext context,
      {SFLDialogType dialogType = SFLDialogType.Default}) {
    if (dialogType == SFLDialogType.PlatformSpecific) {
      SFLDialog.display(
        type: dialogType,
        context: context,
        message: "SFL Platform Specific Dialog",
        title: "Title",
        positiveButtonText: "Ok",
        negativeButtonText: "Cancel",
        negativeButtonCallBack: () {
          Navigator.pop(context);
        },
        positiveButtonCallBack: () {
          Navigator.pop(context);
        },
      );
    } else {
      SFLDialog.display(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        context: context,
        message: "SFL Default Dialog",
        title: "Title",
        positiveButtonText: "Yes",
        negativeButtonText: "No",
        negativeButtonCallBack: () {
          Navigator.pop(context);
        },
        positiveButtonCallBack: () {
          Navigator.pop(context);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SFL Dialog Demo"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SFLButton(
              type: SFLButtonType.outlined,
              child: Text('SFL Platform Specific Dialog Button'),
              onPress: () {
                _displayDialog(context,
                    dialogType: SFLDialogType.PlatformSpecific);
              },
            ),
            SizedBox(
              height: 10,
            ),
            SFLButton(
              type: SFLButtonType.outlined,
              child: Text('SFL Default Dialog Button'),
              onPress: () {
                _displayDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
