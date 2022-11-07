import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

const duration = Duration(milliseconds: 250);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Implicit Animations',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const ExampleWidget(),
    );
  }
}

class ExampleWidget extends StatefulWidget {
  const ExampleWidget({super.key});

  @override
  State<ExampleWidget> createState() => _ExampleWidgetState();
}

class _ExampleWidgetState extends State<ExampleWidget> {
  bool toggle = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Implicit Animations'),
      ),
      body: Center(
        child: Container(
          color: Colors.black,
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //ContainerExample(toggle: toggle),
              AnimatedContainerExample(toggle: toggle),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            toggle = !toggle;
          });
        },
        backgroundColor: Colors.deepOrange,
        // foregroundColor: Colo,
        child: const Icon(Icons.play_arrow_outlined),
      ),
    );
  }
}

class ContainerExample extends StatelessWidget {
  final bool toggle;

  const ContainerExample({super.key, required this.toggle});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: toggle ? Colors.cyan : Colors.lightGreen,
      padding: toggle ? const EdgeInsets.all(40) : const EdgeInsets.all(80),
      width: toggle ? 100 : 400,
      child: Container(
        width: 50,
        height: 50,
        color: Colors.deepOrange,
      ),
    );
  }
}

class AnimatedContainerExample extends StatelessWidget {
  final bool toggle;

  const AnimatedContainerExample({super.key, required this.toggle});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: duration,
      color: toggle ? Colors.cyan : Colors.lightGreen,
      padding: toggle ? const EdgeInsets.all(40) : const EdgeInsets.all(80),
      width: toggle ? 100 : 400,
      child: Container(
        width: 50,
        height: 50,
        color: Colors.deepOrange,
      ),
    );
  }
}
