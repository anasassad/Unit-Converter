import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  late double _numberFrom;

  @override
  void initState() {
    _numberFrom = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Measures Converter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Measures Converter'),
          backgroundColor: Colors.cyan,
        ),
        body: Center(
            child: Column(
          children: [
            TextField(
              onChanged: (text) {
                var v = double.tryParse(text);
                if (v != null) {
                  setState(() {
                    _numberFrom = v;
                  });
                }
              },
            ),
            Text((_numberFrom == null) ? '' : _numberFrom.toString())
          ],
        )),
      ),
    );
  }
}
