import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twittercopy/home/tabbar_view.dart';
import 'package:twittercopy/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Material App",
      theme: ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        tabBarTheme: TabBarTheme(
          labelColor: CupertinoColors.activeBlue,
          unselectedLabelColor: CupertinoColors.inactiveGray,
        )
      ),
      home: const TwitterTabBarView(),
    );
  }
}
