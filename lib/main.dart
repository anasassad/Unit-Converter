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

  String _startMeasure = 'meters';
  String _convertedMeasure = 'grams';

  final List<String> _measures = [
    'meters',
    'kilometers',
    'grams',
    'kilograms',
    'feet',
    'miles',
    'pounds (lbs)',
    'ounces'
  ];

  @override
  void initState() {
    _numberFrom = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle inputStyle = TextStyle(
      fontSize: 20,
      color: Colors.blueAccent,
    );

    final TextStyle labelStyle = TextStyle(
      fontSize: 24,
      color: Colors.blueGrey,
    );

    return MaterialApp(
      title: 'Measures Converter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Measures Converter'),
          backgroundColor: Colors.cyan,
        ),
        body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const Spacer(),
                Text(
                  'Value',
                  style: labelStyle,
                ),
                const Spacer(),
                TextField(
                  style: inputStyle,
                  decoration: const InputDecoration(
                    hintText: 'Please insert the measure to be converted',
                  ),
                  onChanged: (text) {
                    var v = double.tryParse(text);
                    if (v != null) {
                      setState(() {
                        _numberFrom = v;
                      });
                    }
                  },
                ),
                const Spacer(),
                Text(
                  'From',
                  style: labelStyle,
                ),
                const Spacer(),
                DropdownButton(
                    isExpanded: true,
                    value: _startMeasure,
                    items: _measures.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    style: inputStyle,
                    onChanged: (value) {
                      setState(() {
                        _startMeasure = value!;
                      });
                    }),
                const Spacer(),
                Text(
                  'To',
                  style: labelStyle,
                ),
                const Spacer(),
                DropdownButton(
                    isExpanded: true,
                    value: _convertedMeasure,
                    items: _measures.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    style: inputStyle,
                    onChanged: (value) {
                      setState(() {
                        _convertedMeasure = value!;
                      });
                    }),
                const Spacer(
                  flex: 2,
                ),
                TextButton(
                    onPressed: () => true,
                    child: Text(
                      'Convert',
                      style: inputStyle,
                    )),
                const Spacer(
                  flex: 2,
                ),
                Text(
                  (_numberFrom == null) ? '' : _numberFrom.toString(),
                  style: labelStyle,
                ),
                const Spacer(
                  flex: 8,
                ),
              ],
            )),
      ),
    );
  }
}
