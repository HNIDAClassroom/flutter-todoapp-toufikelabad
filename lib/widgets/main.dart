import 'package:flutter/material.dart';
import 'package:tp3/widgets/tasks.dart';
import 'package:tp3/widgets/login.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(elevation: 0),
        useMaterial3: true,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blueGrey)
            .copyWith(background: Colors.white),
        scaffoldBackgroundColor: Colors.grey[200],
      ),
      initialRoute: '/', // Définir la route initiale
      routes: {
        '/': (context) => Login(), // Page de connexion
        '/tasks': (context) => Tasks(), // Page de liste des tâches
      },
    ),
  );
}
