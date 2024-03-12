import 'package:flutter/material.dart';
import 'package:analog_clock/analog_clock.dart';
import 'package:flutter_emoji_feedback/flutter_emoji_feedback.dart';

class EjemploDependencia extends StatefulWidget {
  const EjemploDependencia({super.key});

  @override
  State<EjemploDependencia> createState() => _EjemploDependenciaState();
}

class _EjemploDependenciaState extends State<EjemploDependencia>{

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [
          AnalogClock(),
          
          SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EmojiFeedback(
                onChanged: (value) {
                  print(value);
                },
              )
            ],
          ),
        ),
      ),
          
        ]
      ),
    );
  }
}