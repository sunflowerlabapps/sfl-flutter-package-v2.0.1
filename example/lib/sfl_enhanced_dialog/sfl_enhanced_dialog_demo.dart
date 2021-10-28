import 'package:flutter/material.dart';
import 'package:sfl_flutter_package/sfl_flutter_package.dart';

class SFLEnhancedDialogDemo extends StatefulWidget {
  static final String route = 'sfl-enhanced-dialog';

  @override
  _SFLEnhancedDialogDemoState createState() => _SFLEnhancedDialogDemoState();
}

class _SFLEnhancedDialogDemoState extends State<SFLEnhancedDialogDemo> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("SFL Enhanced Dialog"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SFLButton(
                child: Text('App Alert'),
                type: SFLButtonType.outlined,
                onPress: () => _showDialog(
                    context: context, type: SFLEnhancedDialogType.alert)),
            SFLButton(
                child: Text('Confirmation Dialog'),
                type: SFLButtonType.outlined,
                onPress: () => _showDialog(
                    context: context,
                    type: SFLEnhancedDialogType.confirmation)),
            SFLButton(
              child: Text('Request Dialog'),
              type: SFLButtonType.outlined,
              onPress: () => _showDialog(
                  context: context, type: SFLEnhancedDialogType.dialog),
            ),
          ],
        ),
      ),
    );
  }

  void _showDialog({
    BuildContext context,
    SFLEnhancedDialogType type,
  }) {
    switch (type) {
      case SFLEnhancedDialogType.dialog:
        showDialog(
          context: context,
          builder: (context) => DisplayEnhancedDialog(
            context: context,
            title: 'Request Dialog',
            description:
                'Dialog to confirm before proceeding for further action.',
            type: SFLEnhancedDialogType.dialog,
            onNegativeButtonPress: _showSnackBarNegative,
            onPositiveButtonPress: _showSnackBarPositive,
            circularShapeColorDialog: Colors.orange,
          ),
        );
        break;
      case SFLEnhancedDialogType.alert:
        showDialog(
          context: context,
          builder: (context) => DisplayEnhancedDialog(
            context: context,
            title: 'App Alert',
            description: 'Displaying application alert dialog.',
            type: SFLEnhancedDialogType.alert,
          ),
        );
        break;
      case SFLEnhancedDialogType.confirmation:
        showDialog(
          context: context,
          builder: (context) => DisplayEnhancedDialog(
            context: context,
            title: 'Confirmation Dialog',
            description:
                'Displaying dialog of confirmation when things get done.',
            type: SFLEnhancedDialogType.confirmation,
            onPositiveButtonPress: _showSnackBarPositive,
            circularShapeColorConformation: Colors.green,
          ),
        );
        break;
    }
  }

  void _showSnackBarNegative() {
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Negative Response Received"),
      ),
    );
  }

  void _showSnackBarPositive() {
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Positive Response Received"),
      ),
    );
  }
}
