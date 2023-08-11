import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Addition of two numbers',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Addition of two numbers'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController firstNumber = TextEditingController();
  TextEditingController secondNumber = TextEditingController();

  int result = 0;

  void _addNumbers() {
    setState(() {
      result = int.parse(firstNumber.text) + int.parse(secondNumber.text);
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
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Text(
                    "First number: ",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                  ),
                  TextField(
                    controller: firstNumber,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'First number',
                      hintText: 'Enter a first number',
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Text(
                    "Second number: ",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                  ),
                  TextField(
                    controller: secondNumber,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Second number',
                      hintText: 'Enter a second number',
                    ),
                  ),
                ],
              ),
            ),
            Container(
                margin: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    TextButton(
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue),
                      ),
                      onPressed: _addNumbers,
                      child: const Text(
                        '+',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    )
                  ],
                )),
            Text("Result: $result",
                style: const TextStyle(
                  fontSize: 24,
                  color: Color.fromARGB(255, 57, 117, 38),
                )),
          ],
        ),
      ),
    );
  }
}
