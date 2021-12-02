// Created by Sanjeev Sangral on 30/11/21.
import 'package:agenda_boa/provider/counter_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class CounterTwo extends StatelessWidget {
  const CounterTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text('Counter Two',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0)),
            Text('You have pushed the button this many times:'),
            Count(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        key: const Key('increment_floatingActionButton'),
        onPressed: () => context.read<CounterProvider>().incrementCounterTwo(),
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
    /*Getting counter2 value from firebase*/
    Future.delayed(const Duration(seconds: 1),(){
      context.read<CounterProvider>().getCounterTwoVal();
    });
    /*-----------------End------------------*/
    return Text(
      /// Calls `context.watch` to make [Count] rebuild when [Counter] changes.
        '${context.watch<CounterProvider>().count2}',
        key: const Key('counterState'),
        style: Theme.of(context).textTheme.headline4);
  }
}
