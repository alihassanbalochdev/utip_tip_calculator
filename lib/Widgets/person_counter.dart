import 'package:flutter/material.dart';

class PersonCounter extends StatelessWidget {
  const PersonCounter({
    super.key,
    required this.theme,
    required this._personCount,
     required this.ondecrement,
     required this.onincrement,
  });

  final ThemeData theme;
  final int _personCount;
  final VoidCallback ondecrement;
  final VoidCallback onincrement;

  @override
  Widget build(BuildContext context) {
    return
     Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         Text(
        'Split',
        style: theme.textTheme.titleMedium,
       ),
        IconButton(
          color: theme.colorScheme.primary,
          onPressed: ondecrement,
           icon: const Icon(Icons.remove)
        ),
        Text(
          '$_personCount',
            style: theme.textTheme.titleMedium,
        ),
        IconButton(
          color: theme.colorScheme.primary,
          onPressed: onincrement, 
          icon: const Icon(Icons.add)
        ),
      ]
    );
  }
}