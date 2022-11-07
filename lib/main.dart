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
      body: SafeArea(
        child: Center(
          child: Container(
            color: Colors.black,
            padding: const EdgeInsets.all(40),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //ContainerExample(toggle: toggle),
                //AnimatedContainerExample(toggle: toggle),
                //AnimatedDefaultTextStyleExample(toggle: toggle),
                //AnimatedAlignExample(toggle: toggle),
                // AnimatedCrossFadeExample(toggle: toggle),
                AnimatedOpacityExample(toggle: toggle),
              ],
            ),
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

class AnimatedDefaultTextStyleExample extends StatelessWidget {
  const AnimatedDefaultTextStyleExample({super.key, required this.toggle});
  final bool toggle;
  static const styleOne = TextStyle(fontSize: 15, color: Colors.deepOrange);
  static const styleTwo = TextStyle(fontSize: 30, color: Colors.lightGreen);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: AnimatedDefaultTextStyle(
        duration: duration,
        style: toggle ? styleOne : styleTwo,
        child: const Text('Hello, Flutter'),
      ),
    );
  }
}

class AnimatedAlignExample extends StatelessWidget {
  const AnimatedAlignExample({super.key, required this.toggle});
  final bool toggle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: AnimatedAlign(
        alignment: toggle ? Alignment.bottomLeft : Alignment.topRight,
        duration: duration,
        child: Container(
          color: Colors.deepOrange,
          width: 50,
          height: 50,
        ),
      ),
    );
  }
}

class AnimatedCrossFadeExample extends StatelessWidget {
  final bool toggle;
  const AnimatedCrossFadeExample({
    Key? key,
    required this.toggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      duration: duration,
      crossFadeState:
          toggle ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      firstChild: Container(
        width: 50,
        height: 50,
        color: Colors.red,
      ),
      secondChild: Container(
        width: 150,
        height: 150,
        color: Colors.green,
      ),
    );
  }
}

class AnimatedOpacityExample extends StatelessWidget {
  final bool toggle;
  const AnimatedOpacityExample({Key? key, required this.toggle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: duration,
      opacity: toggle ? 1 : 0.5,
      child: Container(
        width: 50,
        height: 50,
        color: Colors.red,
      ),
    );
  }
}
