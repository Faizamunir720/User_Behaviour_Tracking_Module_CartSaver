import 'package:flutter/material.dart';
import 'PageViewTracking.dart';
import 'TimeSpentPage.dart';
import 'TrackingOverview.dart';
import 'CartActionsPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Behavior Tracking',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => TrackingOverview(),
        '/page-view-tracking': (context) => PageViewTracking(),
        '/time-spent-page': (context) => TimeSpentPage(),
        '/cart-actions': (context) => CartActionsPage(),

      },
    );
  }
}



