import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: StopWatchApp()));
}

class StopWatchApp extends StatefulWidget {
  const StopWatchApp({super.key});

  @override
  State<StatefulWidget> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatchApp> {
  Timer? _timer;
  int _milliseconds = 0;
  bool _isRunning = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _runningTime(_milliseconds),
          _runningButtons(_startTimer, _isRunning),
          _labTimes(),
        ],
      ),
    );
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(milliseconds: 30), (timer) {
      setState(() {
        _milliseconds += 10;
      });
    });
    _isRunning = true;
  }

  void _stopTimer() {
    _timer?.cancel();
    _isRunning = false;
  }
}

Widget _runningTime(int ms) {
  return Text(
    _formatTime(ms),
    style: const TextStyle(
        fontSize: 48,
        fontWeight: FontWeight.bold,
        fontFeatures: [FontFeature.tabularFigures()]),
  );
}

String _formatTime(int ms) {
  final totalSeconds = (ms / 1000).floor();
  final minutes = (totalSeconds ~/ 60).toString().padLeft(2, '0');
  final seconds = (totalSeconds % 60).toString().padLeft(2, '0');
  final hundredths = ((ms % 1000) ~/ 10).toString().padLeft(2, '0');
  return '$minutes:$seconds.$hundredths';
}

Widget _runningButtons(Function start, bool isRunning) {
  return Row(children: [
    ElevatedButton(
      onPressed: () {},
      child: Text("랩"),
    ),
    ElevatedButton(
      onPressed: () {
        start();
      },
      child: Text(isRunning ? "중지" : "시작"),
    ),
  ]);
}

Widget _labTimes() {
  return Container(
    height: 200,
    color: Colors.black,
  );
}
