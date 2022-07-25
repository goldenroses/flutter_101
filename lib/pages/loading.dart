import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = "Loading..";

  void setupWorldTime() async {
    WorldTime wt = WorldTime(
        location: 'Africa/Nairobi', flag: 'kenya.png', url: 'Africa/Nairobi');
    await wt.getTime();
    Navigator.pushReplacementNamed(context, '/home',
        arguments: {'location': wt.location, 'time': wt.time, 'flag': wt.flag, 'isDaytime': wt.isDaytime});
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SpinKitSpinningLines(
        color: Colors.amber,
        size: 50.0,
      ),
    ));
  }
}
