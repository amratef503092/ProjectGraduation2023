import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
class AnimationListView extends StatelessWidget {
  const AnimationListView(
      {super.key, required this.widget, required this.index});

  final int index;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: index,
      duration: const Duration(seconds: 2),
      child: SlideAnimation(
        verticalOffset: 50.0,
        child: FadeInAnimation(duration: Duration(seconds: 4), child: widget),
      ),
    );
  }
}