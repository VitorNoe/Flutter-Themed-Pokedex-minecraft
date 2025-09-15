import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:minecraft_manager/providers/item_provider.dart';
import 'package:minecraft_manager/screens/home_screen.dart';
import 'package:minecraft_manager/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ItemProvider(),
      child: MaterialApp(
        title: 'Minecraft Manager',
        theme: AppTheme.pixelatedTheme,
        home: const HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

