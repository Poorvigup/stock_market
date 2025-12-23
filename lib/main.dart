import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auravest/src/core/app_theme.dart';
import 'package:auravest/src/presentation/screens/home_screen.dart';

void main() {
  runApp(const ProviderScope(child: AuraVestApp()));
}

class AuraVestApp extends StatelessWidget {
  // Add this const constructor
  const AuraVestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Predicto',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: HomeScreen(), // HomeScreen does not need to be const here
    );
  }
}