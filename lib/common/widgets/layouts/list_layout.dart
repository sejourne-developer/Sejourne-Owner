import 'package:flutter/material.dart';

class ListLayout extends StatelessWidget {
  const ListLayout(
      {super.key,
      required this.itemBuilder,
      this.padding,
      required this.itemCount,
      this.separatorHeight = 0,
      this.separatorWidth = 0,
      this.scrollDirection = Axis.vertical,
      this.physics, this.scrollController});

  final Widget? Function(BuildContext, int) itemBuilder;
  final EdgeInsetsGeometry? padding;
  final int itemCount;
  final double separatorHeight, separatorWidth;
  final Axis scrollDirection;
  final ScrollPhysics? physics;
  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints:
          const BoxConstraints(maxHeight: double.infinity, minHeight: 56.0,minWidth: 56,maxWidth: double.infinity),
      child: ListView.separated(
        itemCount: itemCount,
        controller: scrollController,
        shrinkWrap: true,
        physics: physics ?? const NeverScrollableScrollPhysics(),
        padding: padding,
        scrollDirection: scrollDirection,
        itemBuilder: itemBuilder,
        separatorBuilder: (_, index) => SizedBox(
          width: separatorWidth,
          height: separatorHeight,
        ),
      ),
    );
  }
}
