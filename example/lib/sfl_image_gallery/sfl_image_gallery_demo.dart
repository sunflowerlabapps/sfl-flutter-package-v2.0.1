import 'package:flutter/material.dart';
import 'package:sfl_flutter_package/sfl_flutter_package.dart';

class SFLImageGalleryDemo extends StatefulWidget {
  static final String route = 'sfl-image-gallery-demo';

  @override
  _SFLImageGalleryDemoState createState() => _SFLImageGalleryDemoState();
}

class _SFLImageGalleryDemoState extends State<SFLImageGalleryDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SFLImageGallery(
        initialIndex: 2,
        defaultArrowSize: 35,
        images: [
          "https://homepages.cae.wisc.edu/~ece533/images/airplane.png",
          "https://homepages.cae.wisc.edu/~ece533/images/arctichare.png",
          "https://homepages.cae.wisc.edu/~ece533/images/fruits.png",
          "https://homepages.cae.wisc.edu/~ece533/images/frymire.png",
        ],
      ),
    );
  }
}
