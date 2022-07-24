import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/game_setting.dart';
import 'package:flutter_application_1/state/game_parameter.dart';
import 'package:flutter_application_1/pages/top.dart';
import 'package:flutter_application_1/pages/game_app.dart';

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
      initialRoute: "/",
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Top());
      case '/game':
        return MaterialPageRoute(
          builder: (_) => GameApp(args: args is! GameParameter  ? const GameParameter() : args),
        );
      case '/set':
        return MaterialPageRoute(builder: (_) => const GameSetting());
      default :
        return MaterialPageRoute(builder: (_) => Top());
    }
  }
}


