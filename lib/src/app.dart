import 'package:flutter/material.dart';
import 'package:user_ms_ui/src/routing/page_routes.dart';
import 'package:user_ms_ui/src/routing/routing.dart';
import 'package:user_ms_ui/src/views/home/home.dart';

class App extends StatelessWidget {
  const App({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();
    return MaterialApp(
      title: 'user_ms',
      theme:  ThemeData(
        primarySwatch: Colors.blue,
        textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Open Sans'),
      ),
      navigatorKey: navigatorKey,
      onGenerateRoute: generateRoute,
      initialRoute: signupRoute,
      builder: (context,child){
        return child!;
      },
    );
  }
}