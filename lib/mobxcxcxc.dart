import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
part 'mobxcxcxc.g.dart';

class Counter = CounterBase with _$Counter;

abstract class CounterBase with Store {
  @observable
  int value = 0;
  @action
  void increment() {
    value++;
  }
}

class CounterExample extends StatefulWidget {
  const CounterExample({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _CounterExampleState createState() => _CounterExampleState();
}

class _CounterExampleState extends State<CounterExample> {
  final _counter = Counter();
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Counter'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              
              Observer(builder: (_) {
                  reaction((_) {
                  return _counter.value;
                }, (_) {
                  // print('Counter changed to ${_counter.value}');
                });
                return Text(
                  '${_counter.value}',
                  style: const TextStyle(fontSize: 20),
                );
              
              }),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _counter.increment,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      );
}
