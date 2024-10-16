import 'package:flutter/material.dart';

class NavigatorButton extends StatefulWidget {
  const NavigatorButton({super.key, required this.icone});

  final IconData icone;

  @override
  State<NavigatorButton> createState() => _NavigatorButtonState();
}

class _NavigatorButtonState extends State<NavigatorButton> {
  @override
  Widget build(BuildContext context) {
    return Container(height: 50, width: 50, child: Icon(widget.icone));
  }
}
