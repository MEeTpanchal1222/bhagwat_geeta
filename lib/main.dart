import 'package:bhagwat_geeta/viewscreen/adhyaylist.dart';
import 'package:bhagwat_geeta/viewscreen/arthi_gita.dart';
import 'package:bhagwat_geeta/viewscreen/gita_mahthyay.dart';
import 'package:bhagwat_geeta/viewscreen/gita_saar.dart';
import 'package:bhagwat_geeta/viewscreen/homescren.dart';
import 'package:bhagwat_geeta/viewscreen/sholklist.dart';
import 'package:bhagwat_geeta/viewscreen/slashscreen.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //routes
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const HomeScreen(),
        '/chapters': (context) => const ChaptersList(),
        '/shloks': (context) => const ShlokList(),
        '/saar': (context) => const GitaSaar(),
        '/maahaatmy': (context) => const Maahaatmy(),
        '/aaratee': (context) => const Aaratee(),
      },
    );
  }
}