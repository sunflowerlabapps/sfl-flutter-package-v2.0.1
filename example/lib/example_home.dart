import 'package:example/sfl_dialog/sfl_dialog_demo.dart';
import 'package:example/sfl_otp_input/sfl_otp_input_demo.dart';
import 'package:example/sfl_textfield/sfl_textfield_demo.dart';
import 'package:example/sfl_toast/sfl_toast_demo.dart';
import 'package:example/sfl_video_gallery/sfl_video_gallery_demo.dart';
import 'package:flutter/material.dart';

import 'sfl_button/sfl_button_demo.dart';
import 'sfl_enhanced_dialog/sfl_enhanced_dialog_demo.dart';
import 'sfl_image_gallery/sfl_image_gallery_demo.dart';
import 'sfl_loader/sfl_loader_demo.dart';
import 'strings.dart';

class ExampleHome extends StatefulWidget {
  ExampleHome({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ExampleHomeState createState() => _ExampleHomeState();
}

class _ExampleHomeState extends State<ExampleHome> {
  String fullOTP;
  List<String> _samplesFor = [
    StringLabels.sflButtonHome,
    StringLabels.sflLoaders,
    StringLabels.sflTextFieldHome,
    StringLabels.sflDialog,
    StringLabels.sflEnhancedDialog,
    StringLabels.sflToast,
    // StringLabels.sflImagePicker,
    StringLabels.sflImageGalleryDemo,
    StringLabels.sflVideoPlayer,
    StringLabels.sflOtpInput,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        decoration: BoxDecoration(),
        padding: EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 12.0,
        ),
        child: ListView.separated(
          itemCount: _samplesFor.length,
          itemBuilder: (context, position) {
            String item = _samplesFor[position];
            return ListTile(
              onTap: () {
                _handleListItemOnTap(item);
              },
              title: Text(
                '$item',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: Padding(
                padding: EdgeInsets.all(4.0),
                child: Icon(
                  Icons.arrow_right,
                  size: 30.0,
                ),
              ),
            );
          },
          separatorBuilder: (context, position) {
            return Divider(
              thickness: 2.0,
            );
          },
        ),
      ),
    );
  }

  void _handleListItemOnTap(String item) {
    switch (item) {
      case StringLabels.sflButtonHome:
        Navigator.pushNamed(context, SflButtonDemo.route);
        break;
      case StringLabels.sflLoaders:
        Navigator.pushNamed(context, SFLLoaderDemo.route);
        break;
      case StringLabels.sflTextFieldHome:
        Navigator.pushNamed(context, SFLTextFieldDemo.route);
        break;
      case StringLabels.sflDialog:
        Navigator.pushNamed(context, SFLDialogDemo.route);
        break;
      case StringLabels.sflToast:
        Navigator.pushNamed(context, SFLToastDemo.route);
        break;
      // case StringLabels.sflImagePicker:
      //   Navigator.pushNamed(context, SFLImagePickerDemo.route);
      //   break;
      case StringLabels.sflImageGalleryDemo:
        Navigator.pushNamed(context, SFLImageGalleryDemo.route);
        break;
      case StringLabels.sflVideoPlayer:
        Navigator.pushNamed(context, SFLVideoGalleryDemo.route);
        break;
      case StringLabels.sflEnhancedDialog:
        Navigator.pushNamed(context, SFLEnhancedDialogDemo.route);
        break;
      case StringLabels.sflOtpInput:
        Navigator.pushNamed(context, SFLOtpInputDemo.route);
        break;
    }
  }
}
