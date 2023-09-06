import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class Traslation {
  int value;
  Traslation({required this.value});
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter = 0;
  increment() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    

    return MultiProvider(
      providers: [
        ProxyProvider0<int>(update: (_,context) => counter),
        ProxyProvider<int, Traslation>(
            update: (_, count, __) => Traslation( value:counter))
      ],
      child: Builder(
        builder: (context) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(onPressed: increment),
            body: Center(
              child: Text(Provider.of<Traslation>(context).value.toString()),
            ),
          );
        }
      ),
    );
  }
}
