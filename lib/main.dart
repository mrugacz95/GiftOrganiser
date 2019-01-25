import 'package:flutter/material.dart';
import 'package:gift_organiser/screens/home_screen.dart';
import 'package:gift_organiser/screens/intro_screen.dart';
import 'package:gift_organiser/screens/login_screen.dart';

void main() =>
    runApp(
//  MyApp()
        new MaterialApp(
          home: IntroScreen(),
          routes: {
            '/intro': (context) => IntroScreen(),
            '/home': (context) => HomeScreen(),
            '/login': (context) => LoginScreen(),
          },
        )
    );
