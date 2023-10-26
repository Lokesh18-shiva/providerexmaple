import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          CustomScrollView(
            slivers: <Widget>[
              const SliverAppBar(
                title: Text('Pinned Container Example'),
                floating: false,
                pinned: true,
              ),
              SliverToBoxAdapter(child: Container(height: 100,color: Colors.amber,),),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Container(
                      height: 200.0,
                      color: Colors.grey[200],
                      child: Center(
                        child: Text('Container $index'),
                      ),
                    );
                  },
                  childCount: 15,
                ),
              ),
            ],
          ),
          Positioned(
            top: kToolbarHeight*3, // Place the container just below the AppBar
            left: 0,
            right: 0,
            child: Container(
              height: 100.0, // Adjust as needed
              color: Colors.black12,
              alignment: Alignment.center,
              child: const Text(
                'Pinned Container',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
