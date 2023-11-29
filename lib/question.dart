import 'package:flutter/material.dart';

class question extends StatefulWidget {
  const question({super.key, required this.title});

  final String title;

  @override
  State<question> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<question> {
  int _counter = 0;

  get onPressed => null;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Text("salut", style: TextStyle(fontSize: 80)),
      ),
    );
  }
}
