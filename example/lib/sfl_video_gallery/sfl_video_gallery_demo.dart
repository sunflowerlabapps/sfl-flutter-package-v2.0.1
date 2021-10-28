import 'package:flutter/material.dart';
import 'package:sfl_flutter_package/sfl_flutter_package.dart';

class SFLVideoGalleryDemo extends StatefulWidget {
  static final String route = 'sfl-video-gallery-demo';

  @override
  _SFLVideoGalleryDemoState createState() => _SFLVideoGalleryDemoState();
}

class _SFLVideoGalleryDemoState extends State<SFLVideoGalleryDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SFLVideoGallery(
        //initialIndex: 2,
        defaultArrowSize: 35,
        videos: [
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
        ],
      ),
    );
  }
}
