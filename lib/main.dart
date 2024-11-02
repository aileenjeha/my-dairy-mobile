import 'package:flutter/material.dart';
import 'package:my_dairy_mobile/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFF3DA6BD), // Warna utama sesuai dengan hex 73DAF1
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Color(0xFF3DA6BD),
          secondary: Color(0xFF3DA6BD),
        ),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}
