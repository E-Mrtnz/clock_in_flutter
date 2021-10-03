import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:countdown_app/providers/countdown_provider.dart';

import 'package:countdown_app/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Countdown(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: HomePage(),
      ),
    );
  }
}
