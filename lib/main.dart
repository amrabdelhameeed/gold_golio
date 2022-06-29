import 'package:flutter/material.dart';
import 'package:gold_golio/core/network_manager.dart';
import 'package:gold_golio/features/choosing_categories/choosing_talents_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NetworkManager.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Gold Golio', home: ChoosingTalentsScreen());
  }
}
