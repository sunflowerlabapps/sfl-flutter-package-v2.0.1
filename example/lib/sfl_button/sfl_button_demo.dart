import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sfl_flutter_package/sfl_flutter_package.dart';

class SflButtonDemo extends StatelessWidget {
  static final String route = 'sfl-button-demo';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SFL Button'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 12.0,
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// ELEVATED BUTTON
            SFLButton(
              type: SFLButtonType.elevated,
              child: Text('SFL Elevated Button'),
              clipBehavior: Clip.none,
              onPress: () {
                log('Button Clicked');
              },
            ),

            /// ELEVATED BUTTON WITH ICON
            SFLButton(
              type: SFLButtonType.elevatedIcon,
              icon: Icon(Icons.home_filled),
              label: Text('SFL Elevated Icon Button'),
              onPress: () {
                log('Button Clicked');
              },
            ),

            /// OUTLINED BUTTON
            SFLButton(
              type: SFLButtonType.outlined,
              child: Text('SFL Outlined Button'),
              onPress: () {
                log('Button Clicked');
              },
            ),

            /// OUTLINED BUTTON WITH ICON
            SFLButton(
              type: SFLButtonType.outlinedIcon,
              icon: Icon(Icons.home_filled),
              label: Text('SFL Outlined Icon Button'),
              onPress: () {
                log('Button Clicked');
              },
            ),

            /// TEXT BUTTON
            SFLButton(
              type: SFLButtonType.text,
              child: Text('SFL Text Button'),
              onPress: () {
                log('Button Clicked');
              },
            ),

            /// TEXT BUTTON WITH ICON
            SFLButton(
              type: SFLButtonType.textIcon,
              icon: Icon(Icons.home_filled),
              label: Text('SFL Text Icon Button'),
              onPress: () {
                log('Button Clicked');
              },
            ),
          ],
        ),
      ),
    );
  }
}

/*
* buttonStyle: ButtonStyle(
                overlayColor: MaterialStateProperty.all<Color>(Colors.black),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
* */
