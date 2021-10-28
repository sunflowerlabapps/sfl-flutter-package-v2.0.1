import 'package:flutter/material.dart';

class ScaleFromBack extends StatefulWidget {
  final Widget child;
  final Duration? duration;

  ScaleFromBack({
    required this.child,
    this.duration = const Duration(milliseconds: 3000),
  });

  @override
  _ScaleFromBackState createState() => _ScaleFromBackState();
}

class _ScaleFromBackState extends State<ScaleFromBack>
    with TickerProviderStateMixin {
  AnimationController? _animController;
  Animation<double>? _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _animController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 350));

    _scaleAnimation =
        CurvedAnimation(parent: _animController!, curve: Curves.bounceInOut);
    WidgetsBinding.instance!.addPostFrameCallback(onLayoutDone);
  }

  void onLayoutDone(Duration timeStamp) {
    _animController!.forward();
    /*_animController!.forward().whenComplete(() async {
      await Future.delayed(widget.duration ?? Duration(milliseconds: 3000), () {
        _animController!.reverse();
      });
    });*/
  }

  @override
  void dispose() {
    _animController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation!,
      child: FadeTransition(
        opacity: _animController!,
        child: widget.child,
      ),
    );
  }
}
