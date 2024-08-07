import 'package:flutter/material.dart';
import 'package:news_app/di/configure_di.dart';
import 'package:news_app/presentation/screens/news_list_screen/screen/news_list_screen.dart';

void main() {
  setup();
  runApp(const App());
  WidgetsFlutterBinding.ensureInitialized();
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const NewsListScreen(),
    );
  }
}

