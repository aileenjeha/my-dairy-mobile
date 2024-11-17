import 'package:flutter/material.dart';
import 'package:my_dairy_mobile/screens/login.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
        title: 'MyDairy',
        theme: ThemeData(
          primaryColor: Color(0xFF3DA6BD), 
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Color(0xFF3DA6BD),
            secondary: Color(0xFF3DA6BD),
          ),
          useMaterial3: true,
        ),
        home: const LoginPage(),
      )
    );
  }
}
