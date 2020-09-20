import 'dart:io';
import 'package:expay/screens/home/home.dart';
import 'package:expay/screens/login/login.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'models/event.dart';
import 'models/pdv.dart';
import 'models/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory document = await getApplicationDocumentsDirectory();
  Hive.init(document.path);
  Hive.registerAdapter(EventAdapter());
  Hive.registerAdapter(PDVAdapter());
  Hive.registerAdapter(UserAdapter());
  await Hive.openBox<Event>('event');
  runApp(AppRouter());
}

class AppRouter extends StatefulWidget {
  @override
  _AppRouterState createState() => _AppRouterState();
}

class _AppRouterState extends State<AppRouter> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Captis',
      home: Login(),
      initialRoute: '/login',
      routes: {
        '/login': (context) => Login(),
        '/home': (context) => Home(),
      },
    );
  }
}
