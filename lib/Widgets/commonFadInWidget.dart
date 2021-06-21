import 'package:flutter/material.dart';

class FadeInWidget extends StatefulWidget {
  final double delay;
  final Widget properties;

  FadeInWidget({Key? key, required this.properties, required this.delay})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => FadeInWidgetState();
}

class FadeInWidgetState extends State<FadeInWidget>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> position;
  late Animation<double> opacity;

  final alphaTween = new Tween(begin: 0.0, end: 1.0);

  @override
  initState() {
    super.initState();
    _startAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: position,
      child: FadeTransition(
        opacity: opacity,
        child: widget.properties,
      ),
    );
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }

  void _startAnimation() {
    controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);

    position = new Tween<Offset>(
      begin: new Offset(widget.delay, 0.0),
      end: new Offset(0.0, 0.0),
    ).animate(
        new CurvedAnimation(parent: controller, curve: Curves.decelerate));

    opacity = alphaTween.animate(controller);

    controller.forward();
  }
}
