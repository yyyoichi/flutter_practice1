import 'package:flutter/material.dart';
import 'package:flutter_application_1/top.dart';
import 'package:flutter_application_1/game_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.blueGrey, backgroundColor: Colors.amber),
        // textTheme: const TextTheme(bodyText2: TextStyle(color: Colors.purple)),
      ),
      // theme: ThemeData.from(colorScheme: ColorScheme.fromSwatch(
      //   primarySwatch: Colors.brown,
      // )),
      // home: const GameSettingApp(),
      initialRoute: "/",
      routes: {
        "/game" : (context) => const GameApp(),
        "/": (context) => Top()
      }
    );
  }
}
