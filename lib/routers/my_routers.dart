import 'package:fashionapp/screens/pages/detail_page.dart';
import 'package:fashionapp/screens/pages/explore_page.dart';
import 'package:fashionapp/screens/pages/home_page.dart';
import 'package:flutter/material.dart';

class MyRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    var args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => MyHomePage(),
        );
      case '/explore':
        return MaterialPageRoute(
          builder: (_) => ExplorePage(),
        );
      case '/detail':
        return MaterialPageRoute(
          builder: (_) => DetailPage(data: args),
        );
    }
  }
}
