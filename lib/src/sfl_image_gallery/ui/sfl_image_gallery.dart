import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:sfl_flutter_package/src/sfl_loader/res/sfl_loader_res.dart';
import 'package:sfl_flutter_package/src/sfl_loader/ui/sfl_loader.dart';

const String constPrev = "Prev";
const String constNext = "Next";

/// A Widget that accepts [images] as List<String> which should contain URLs for
/// [NetworkImages] where [isLocal] parameter is false by default. If local images
/// are being used then keep [isLocal] true.
///
/// This widget display GalleryView using [PhotoView]

class SFLImageGallery extends StatefulWidget {
  SFLImageGallery({
    Key? key,
    required this.images,
    this.isLocal = false,
    this.initialIndex = 0,
    this.displayLabel = true,
    this.prevLabel = constPrev,
    this.nextLabel = constNext,
    this.backWidget,
    this.nextWidget,
    this.prevWidget,
    this.defaultArrowSize = 40.0,
    this.controllerBackgroundColor = Colors.black38,
  }) : super(key: key);

  /// List of URLs or local images location in case of [isLocal] false & true respectively
  final List<String>? images;

  /// specify weather we're displaying images from network or local
  final bool isLocal;

  /// Pass initial index of Image to be displayed
  final int initialIndex;

  /// Text label to be displayed in place of 'Prev' label. If not specified 'Prev'
  /// will be displayed by default.
  final String prevLabel;

  /// Text label to be displayed in place of 'Next' label. If not specified 'Next'
  /// will be displayed by default.
  final String nextLabel;

  /// boolean value specifying weather label should be displayed or not. By
  /// default it's true.
  final bool displayLabel;

  /// Flutter widget to be displayed in place of back icon. If not specified
  /// platform specific [arrow_back] and [arrow_back_ios] will  be displayed.
  final Widget? backWidget;

  /// Replacement widget for move to next image.
  final Widget? nextWidget;

  /// Replacement widget for move to previous image.
  final Widget? prevWidget;

  /// Specify arrow size displayed besides [Next] and [Prev] label.
  /// Default size is [40.0]
  final double defaultArrowSize;

  /// Color value to be used as background color of controls displayed on the screen.
  final Color controllerBackgroundColor;

  @override
  _SFLImageGalleryState createState() => _SFLImageGalleryState();
}

class _SFLImageGalleryState extends State<SFLImageGallery> {
  PageController? _controller;
  bool? _controlVisibility;
  int? _currentPageIndex;

  @override
  void initState() {
    super.initState();
    log("Length ${widget.images!.length}");
    assert(widget.initialIndex >= 0, "Initial index must be >= 0");
    assert(widget.initialIndex <= widget.images!.length - 1,
        "Initial index value must be in range of 0-${widget.images!.length - 1}");
    _controller = PageController(initialPage: widget.initialIndex);
    _currentPageIndex = widget.initialIndex;
    _controlVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      clipBehavior: Clip.hardEdge,
      children: <Widget>[
        ///Photo View - with the use of PageView
        _getPhotoView(),

        ///Top Container Section
        _getTopControlView(),

        ///Bottom Container Section
        _getBottomControlView(),
      ],
    );
  }

  ///Photo View
  Widget _getPhotoView() {
    return PageView(
      controller: _controller,
      onPageChanged: _onPageUpdated,
      children: widget.images!.map((singleImage) {
        return InkWell(
          onTap: () {
            setState(() {
              _controlVisibility = !_controlVisibility!;
            });
          },
          child: _getImageView(isLocal: widget.isLocal, imageUrl: singleImage),
        );
      }).toList(),
    );
  }

  Widget? _getImageView({bool isLocal = false, String? imageUrl}) {
    return isLocal
        ? PhotoView(
            backgroundDecoration: BoxDecoration(
              color: Colors.black38,
            ),
            loadingBuilder: (context, event) => Center(
              child: SFLLoader(
                loaderType: SFLLoaderTypes.circular,
              ),
            ),
            imageProvider: AssetImage(imageUrl!),
          )
        : PhotoView(
            backgroundDecoration: BoxDecoration(
              color: Colors.black38,
            ),
            loadingBuilder: (context, event) => Center(
              child: SFLLoader(
                loaderType: SFLLoaderTypes.circular,
              ),
            ),
            imageProvider: NetworkImage(imageUrl!),
          );
  }

  void _onPageUpdated(int value) {
    setState(() {
      _currentPageIndex = value;
    });
  }

  ///Top Control View
  Widget _getTopControlView() {
    return Positioned(
      top: 0.0,
      child: AnimatedOpacity(
        opacity: _controlVisibility! ? 1 : 0,
        duration: Duration(milliseconds: 150),
        curve: _controlVisibility! ? Curves.easeOut : Curves.easeIn,
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaY: 4, sigmaX: 4),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.115,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.bottomCenter,
              color: widget.controllerBackgroundColor.withOpacity(0.7),
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 18.0),
              child: IgnorePointer(
                ignoring: !_controlVisibility!,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                      child: widget.backWidget ??
                          Icon(
                            Platform.isAndroid
                                ? Icons.arrow_back
                                : Icons.arrow_back_ios,
                            color: Colors.white,
                            size: 26,
                          ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  ///Bottom Control View
  Widget _getBottomControlView() {
    return Positioned(
      bottom: 0.0,
      child: AnimatedOpacity(
        opacity: _controlVisibility! ? 1 : 0,
        duration: Duration(milliseconds: 150),
        curve: _controlVisibility! ? Curves.easeOut : Curves.easeIn,
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width,
              color: widget.controllerBackgroundColor.withOpacity(0.7),
              padding: EdgeInsets.symmetric(horizontal: 50.0),
              child: IgnorePointer(
                ignoring: !_controlVisibility!,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Visibility(
                      visible: _currentPageIndex != 0,
                      child: InkWell(
                        onTap: () {
                          _controller!.previousPage(
                            duration: Duration(milliseconds: 350),
                            curve: Curves.bounceInOut,
                          );
                        },
                        splashColor: Colors.black12,
                        child: Row(
                          children: <Widget>[
                            widget.prevWidget ??
                                Icon(
                                  Icons.arrow_left,
                                  size: widget.defaultArrowSize,
                                  color: Colors.white,
                                ),
                            Visibility(
                              visible: widget.displayLabel,
                              child: Text(
                                widget.prevLabel,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                      visible: _currentPageIndex != widget.images!.length - 1,
                      child: InkWell(
                        onTap: () {
                          _controller!.nextPage(
                            duration: Duration(milliseconds: 350),
                            curve: Curves.bounceInOut,
                          );
                        },
                        child: Row(
                          children: <Widget>[
                            Visibility(
                              visible: widget.displayLabel,
                              child: Text(
                                widget.nextLabel,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                            widget.nextWidget ??
                                Icon(
                                  Icons.arrow_right,
                                  size: widget.defaultArrowSize,
                                  color: Colors.white,
                                ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  ///Platform specific Loader
  Widget apiLoadingIndicator() {
    return Platform.isAndroid
        ? CircularProgressIndicator()
        : CupertinoActivityIndicator(
            animating: true,
            radius: 20,
          );
  }
}
