import 'package:flutter/material.dart';

class TipSlider extends StatelessWidget {
  const TipSlider({
    super.key,
    required this._tipPercentage,
   required this.onChanged,
  });

  final double _tipPercentage;
  final ValueChanged<double> onChanged;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _tipPercentage,
      onChanged: onChanged,
      min : 0,
      max: 0.5,
      divisions: 5,
    );
  }
}
