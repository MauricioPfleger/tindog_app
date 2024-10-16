import 'package:flutter/material.dart';
import 'package:tindog_app/widget/navigatorButton.dart';

class BottonNavigation extends StatelessWidget {
  const BottonNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(color: Theme.of(context).colorScheme.inversePrimary),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NavigatorButton(icone: Icons.home),
            NavigatorButton(icone: Icons.search),
            NavigatorButton(icone: Icons.settings),
          ],
        ),
      ),
    );
  }
}
