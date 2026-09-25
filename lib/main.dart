import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utip/Providers/TipCalculatorModel.dart';
import 'package:utip/Widgets/bill_amount_field.dart';
import 'package:utip/Widgets/person_counter.dart';
import 'package:utip/Widgets/tip_row.dart';
import 'package:utip/Widgets/tip_silder.dart';
import 'package:utip/Widgets/total_per_peson.dart';


void main() {
  runApp(ChangeNotifierProvider(create: (context) => TipCalculatorModel(),  
  child: const MyApp()));
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
  @override
  Widget build(BuildContext context) {
        final model =Provider.of<TipCalculatorModel>(context);
   
    // Add Style
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
          TotalPerPerson(total: model.totalPerPerson, style: style, theme: theme),
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
                    billAmount: model.billTotal.toString(), 
                    onChanged: (String value) {
                      model.updateBillTotal(double.parse(value));
                   },),
                  // Split Bill Area
                  PersonCounter(
                    theme: theme,
                    personCount: model.personCount,
                    ondecrement: () {
                      if (model.personCount > 1){
                          model.updatePersonCount(model.personCount - 1);
                      }
                    },
                    onincrement: () {
                        model.updatePersonCount(model.personCount + 1);
                    }
                    ),
               TipRow(
                theme: theme,
                billTotal: model.billTotal,
                percentage: model.tipPercentage,
                ),
                  // slider
                  Text('${(model.tipPercentage * 100).round()} %', style: theme.textTheme.titleMedium),
                  // slider
                  TipSlider(
                    tipPercentage: model.tipPercentage,
                    onChanged: (double value) {
                      model.updateTipPercentage(value);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}






