// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';

import 'package:firebase_core/firebase_core.dart';

import './firebase_options.dart';
import './pages/input_page.dart';
import './pages/view_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'Online Word Wall',
      routes: {
        '/': (ctx) => InputPage(),
        '/view': (ctx) => ViewPage(),
      },
    );
  }
}
