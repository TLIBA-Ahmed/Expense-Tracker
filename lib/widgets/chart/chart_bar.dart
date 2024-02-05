import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar({super.key, required this.fill});
  final double fill;
  @override
  Widget build(BuildContext context) {
    final bool isdarkmode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Expanded(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: //Container(color: isdarkmode? Theme.of(context).colorScheme.primary: const Color.fromARGB(255, 7, 91, 42)),
              FractionallySizedBox(
            heightFactor: fill,
            child: DecoratedBox(
                decoration: BoxDecoration(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(7)),
                    color: isdarkmode
                        ? Theme.of(context).colorScheme.primary
                        : const Color.fromARGB(255, 7, 91, 42))),
          )),
    );
  }
}
