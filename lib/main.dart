import 'package:fashionapp/routers/my_routers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final MyRouter _forroute = MyRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Tenor',
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/explore',
      onGenerateRoute: _forroute.onGenerateRoute,
    );
  }
}
