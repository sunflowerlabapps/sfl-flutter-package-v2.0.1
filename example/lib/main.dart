import 'package:example/sfl_image_gallery/sfl_image_gallery_demo.dart';
import 'package:example/sfl_otp_input/sfl_otp_input_demo.dart';
import 'package:example/sfl_textfield/sfl_textfield_demo.dart';
import 'package:example/sfl_toast/sfl_toast_demo.dart';
import 'package:example/sfl_video_gallery/sfl_video_gallery_demo.dart';
import 'package:flutter/material.dart';

import 'example_home.dart';
import 'sfl_button/sfl_button_demo.dart';
import 'sfl_dialog/sfl_dialog_demo.dart';
import 'sfl_enhanced_dialog/sfl_enhanced_dialog_demo.dart';
import 'sfl_loader/sfl_loader_demo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SFL Flutter Package Example',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ExampleHome(title: 'SFL Flutter Package Examples'),
      routes: {
        SflButtonDemo.route: (context) => SflButtonDemo(),
        SFLLoaderDemo.route: (context) => SFLLoaderDemo(),
        SFLTextFieldDemo.route: (context) => SFLTextFieldDemo(),
        SFLDialogDemo.route: (context) => SFLDialogDemo(),
        SFLToastDemo.route: (context) => SFLToastDemo(),
        // SFLImagePickerDemo.route: (context) => SFLImagePickerDemo(),
        SFLImageGalleryDemo.route: (context) => SFLImageGalleryDemo(),
        SFLVideoGalleryDemo.route: (context) => SFLVideoGalleryDemo(),
        SFLEnhancedDialogDemo.route: (context) => SFLEnhancedDialogDemo(),
        SFLOtpInputDemo.route: (context) => SFLOtpInputDemo(),
      },
    );
  }
}
