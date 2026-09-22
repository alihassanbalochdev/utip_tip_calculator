import 'package:flutter/material.dart';
import 'package:utip/Widgets/bill_amount_field.dart';
import 'package:utip/Widgets/person_counter.dart';
import 'package:utip/Widgets/tip_row.dart';
import 'package:utip/Widgets/tip_silder.dart';
import 'package:utip/Widgets/total_per_peson.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UTip App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const UTip(),
    );
  }
}

class UTip extends StatefulWidget {
  const UTip({super.key});

  @override
  State<UTip> createState() => _UTipState();
}

class _UTipState extends State<UTip> {
  int _personCount = 1;
 double _tipPercentage = 0.1;
 double _billTotal = 0.0;

 double totalPerPerson() {
    final totalTip = _billTotal * _tipPercentage;
    final total = _billTotal + totalTip;
    return total / _personCount;
  }

  double totalTipAmount() {
    return _billTotal * _tipPercentage;
  }

  // Method
  void increment() {
    setState(() {
      _personCount = _personCount + 1;
    });
  }
  void decrement() {
    setState(() {
      if (_personCount > 1) {
        _personCount = _personCount - 1;
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    double total = totalPerPerson();
    double totalTip = totalTipAmount();
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium?.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('UTip App'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TotalPerPerson(total: total, style: style, theme: theme),
          // Form
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: theme.colorScheme.primary,
                  width: 2,
                ),
              ),
              child: Column(
                children: [
                  BillAmountField(
                    billAmount: _billTotal.toString(), 
                    onChanged: (String value) {
                      setState(() {
                        _billTotal = double.parse(value);
                      }); 
                   },),
                  // Split Bill Area
                  PersonCounter(
                    theme: theme,
                    personCount: _personCount,
                    ondecrement: decrement,
                    onincrement: increment),
               TipRow(theme: theme, totalTip: totalTip),
                  // slider
                  Text('${(_tipPercentage * 100).round()} %', style: theme.textTheme.titleMedium),
                  // slider
                  TipSlider(
                    tipPercentage: _tipPercentage,
                    onChanged: (double value) {
                    setState(() {
                      _tipPercentage = value;
                    });
                    },),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}






