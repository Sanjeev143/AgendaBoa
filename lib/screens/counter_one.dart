// Created by Sanjeev Sangral on 30/11/21.
import 'package:agenda_boa/provider/counter_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class CounterOne extends StatelessWidget {
  const CounterOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text('Counter One', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0)),
            Text('You have pushed the button this many times:'),
            Count(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        key: const Key('increment_floatingActionButton'),
        /// Calls `context.read` instead of `context.watch` so that it does not rebuild
        /// when [Counter] changes.
        onPressed: () => context.read<CounterProvider>().incrementCounterOne(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Count extends StatelessWidget {
  const Count({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*Getting counter1 value from firebase*/
    Future.delayed(const Duration(seconds: 1),(){
      context.read<CounterProvider>().getCounterOneVal();
    });
    /*-----------------End------------------*/
    return Text(

      /// Calls `context.watch` to make [Count] rebuild when [Counter] changes.
        '${context.watch<CounterProvider>().count1}',
        key: const Key('counterState'),
        style: Theme.of(context).textTheme.headline4);
  }
}
