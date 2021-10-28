import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sfl_flutter_package/src/sfl_loader/res/sfl_loader_res.dart';
import 'package:sfl_flutter_package/src/sfl_loader/ui/sfl_loader.dart';
import 'package:video_player/video_player.dart';

class SFLVideoGallery extends StatefulWidget {
  /// List of URLs or local videos location in case of [isLocal] false & true respectively
  final List<String> videos;

  /// specify weather we're displaying images from network or local
  final bool isLocal;

  /// Pass initial index of Image to be displayed
  final int initialIndex;

  /// Flutter widget to be displayed in place of back icon. If not specified
  /// platform specific [arrow_back] and [arrow_back_ios] will  be displayed.
  final Widget? backWidget;

  /// Replacement widget for move to next video.
  final Widget? nextWidget;

  /// Replacement widget for move to previous video.
  final Widget? prevWidget;

  /// Specify arrow size displayed besides [Next] and [Prev] label.
  /// Default size is [40.0]
  final double defaultArrowSize;

  /// Color value to be used as background color of controls displayed on the screen.
  final Color controllerBackgroundColor;

  SFLVideoGallery({
    Key? key,
    required this.videos,
    this.isLocal = false,
    this.initialIndex = 0,
    this.backWidget,
    this.nextWidget,
    this.prevWidget,
    this.defaultArrowSize = 40.0,
    this.controllerBackgroundColor = Colors.black38,
  }) : super(key: key);

  @override
  _SFLVideoGalleryState createState() => _SFLVideoGalleryState();
}

class _SFLVideoGalleryState extends State<SFLVideoGallery> {
  PageController? _controller;
  bool _controlVisibility = true;
  int? _currentPageIndex;
  Duration? _videoPosition;
  Duration? _videoTotalDuration;
  double? _videoProgress;
  VideoPlayerController? _videoPlayerController;
  Future<void>? _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _currentPageIndex = widget.initialIndex;
    _controller = PageController(initialPage: widget.initialIndex);
    _videoProgress = 0;
    initVideo(_currentPageIndex!);
  }

  void initVideo(int _currentPageIndex) {
    if (_videoPlayerController == null) {
      _videoPlayerController = widget.isLocal
          ? VideoPlayerController.file(
              File(widget.videos[_currentPageIndex]),
            )
          : VideoPlayerController.network(widget.videos[_currentPageIndex])
        ..addListener(videoListener)
        ..setVolume(1.0);
      _initializeVideoPlayerFuture =
          _videoPlayerController!.initialize().then((_) {
        setState(() {});
      });
    }
  }

  void videoListener() {
    if (_videoPlayerController != null) {
      setState(() {
        _videoTotalDuration = _videoPlayerController!.value.duration;
        _videoPosition = _videoPlayerController!.value.position;
        _videoProgress = _videoPlayerController!.value.position.inMilliseconds /
            _videoPlayerController!.value.duration.inMilliseconds;
      });
    }
  }

  @override
  void dispose() {
    if (_videoPlayerController != null) {
      _videoPlayerController!.removeListener(videoListener);
      _videoPlayerController!.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ///Video View -> With the use of PageView
          _getVideoView(),

          ///Top Container Section
          _getTopControlView(),

          ///Center Container Section
          _getCenterControlView(),
        ],
      ),
    );
  }

  ///Video View
  Widget _getVideoView() {
    return PageView(
      controller: _controller,
      onPageChanged: _onPageUpdated,
      children: widget.videos.map((singleVideo) {
        return InkWell(
          onTap: () {
            setState(() {
              _controlVisibility = !_controlVisibility;
            });
          },
          child: FutureBuilder(
            future: _initializeVideoPlayerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    AspectRatio(
                      aspectRatio: _videoPlayerController!.value.aspectRatio,
                      child: VideoPlayer(_videoPlayerController!),
                    ),
                    Visibility(
                      visible: _controlVisibility,
                      child: Positioned(
                        left: 0.0,
                        right: 0.0,
                        bottom: 0.0,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 4.0,
                            vertical: MediaQuery.of(context).padding.bottom,
                          ),
                          decoration: BoxDecoration(
                              color: widget.controllerBackgroundColor
                                  .withOpacity(0.8)),
                          child: Row(
                            children: <Widget>[
                              IconButton(
                                padding: EdgeInsets.all(2.0),
                                icon: Icon(
                                  _videoPlayerController!.value.isPlaying
                                      ? Icons.pause
                                      : Icons.play_arrow,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  _handleButtonTap();
                                },
                              ),
                              Expanded(
                                child: LinearProgressIndicator(
                                  value: _videoProgress,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white),
                                  backgroundColor: Colors.black54,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.0),
                                child: Text(
                                  _videoPosition != null
                                      ? '${_videoPosition.toString().substring(2, 7)}'
                                      : '',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4!
                                      .copyWith(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return Center(
                  child: SFLLoader(
                    loaderType: SFLLoaderTypes.circular,
                  ),
                );
              }
            },
          ),
        );
      }).toList(),
    );
  }

  void _handleButtonTap() {
    if (_videoPlayerController!.value.isPlaying) {
      _videoPlayerController!.pause();
    } else {
      _controlVisibility = false;
      if (_videoPlayerController!.value.position >= _videoTotalDuration!) {
        _videoPlayerController!.initialize();
      }
      _videoPlayerController!.play();
    }
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

  void _onPageUpdated(int value) {
    setState(() {
      _currentPageIndex = value;
      print(_currentPageIndex);
      _videoPlayerController = widget.isLocal
          ? VideoPlayerController.file(
              File(widget.videos[_currentPageIndex!]),
            )
          : VideoPlayerController.network(widget.videos[_currentPageIndex!])
        ..addListener(videoListener)
        ..setVolume(1.0);
      _initializeVideoPlayerFuture =
          _videoPlayerController!.initialize().then((_) {
        setState(() {});
      });
    });
  }

  ///Top Control View
  Widget _getTopControlView() {
    return Positioned(
      top: 0.0,
      child: AnimatedOpacity(
        opacity: _controlVisibility ? 1 : 0,
        duration: Duration(milliseconds: 150),
        curve: _controlVisibility ? Curves.easeOut : Curves.easeIn,
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaY: 4, sigmaX: 4),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.115,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.bottomCenter,
              color: widget.controllerBackgroundColor.withOpacity(0.7),
              padding: EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 18.0,
              ),
              child: IgnorePointer(
                ignoring: !_controlVisibility,
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

  ///Center Control View
  Widget _getCenterControlView() {
    return Align(
      alignment: Alignment.center,
      child: AnimatedOpacity(
        opacity: _controlVisibility ? 1 : 0,
        duration: Duration(milliseconds: 150),
        curve: _controlVisibility ? Curves.easeOut : Curves.easeIn,
        child: ClipRect(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: IgnorePointer(
              ignoring: !_controlVisibility,
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
                      child: CircleAvatar(
                        backgroundColor:
                            widget.controllerBackgroundColor.withOpacity(0.7),
                        child: widget.prevWidget ??
                            Icon(
                              Icons.arrow_left,
                              size: widget.defaultArrowSize,
                              color: Colors.white,
                            ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: _currentPageIndex != widget.videos.length - 1,
                    child: InkWell(
                      onTap: () {
                        _controller!.nextPage(
                          duration: Duration(milliseconds: 350),
                          curve: Curves.bounceInOut,
                        );
                      },
                      child: CircleAvatar(
                        backgroundColor:
                            widget.controllerBackgroundColor.withOpacity(0.7),
                        child: widget.nextWidget ??
                            Icon(
                              Icons.arrow_right,
                              size: widget.defaultArrowSize,
                              color: Colors.white,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
