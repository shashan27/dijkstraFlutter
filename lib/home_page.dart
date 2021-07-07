import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:short_way/visualizer_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool finished = true;
  Future<bool> initialLaunch = _getLaunchState();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => OperationCountModel(), child: Visualizer());
  }
}

_setLaunchState() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('initialLaunch', false);
}

Future<bool> _getLaunchState() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return (prefs.getBool('initialLaunch') ?? true);
}
