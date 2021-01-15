import 'package:enerren/util/NavigationUtil.dart';
import 'package:enerren/util/SystemUtil.dart';
import 'package:flutter/material.dart';

class HeroComponent extends StatelessWidget {
  final String pathImage;
  final String tagImage;
  final Color backgroundColor;
  HeroComponent({
    this.pathImage,
    this.tagImage,
    this.backgroundColor,
  });
  @override
  Widget build(BuildContext context) {
    System.data.routes.routeHistory.add(RouteHistory(
      routeName: "hero",
    ));
    return Scaffold(
      backgroundColor: backgroundColor,
      body: GestureDetector(
        child: Center(
          child: Hero(
            tag: '$tagImage',
            child: Image.network(
              '$pathImage',
            ),
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
