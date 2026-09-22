import 'package:flutter/material.dart';

class TotalPerPerson extends StatelessWidget {
  const TotalPerPerson({
    super.key,
    required this.total,
    required this.style,
    required this.theme,
  });

  final double total;
  final TextStyle? style;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            const Text(
              'Total Per Person',
              style: TextStyle(fontSize: 34),
            ),
            Text(
              total.toStringAsFixed(2),
              style: style?.copyWith(
                fontSize: theme.textTheme.displaySmall?.fontSize ?? 32,
              ) ??
                  const TextStyle(fontSize: 32),
            ),
          ],
        ),
      ),
    );
  }
}