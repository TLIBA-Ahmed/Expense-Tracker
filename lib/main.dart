//import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_3/widgets/expenses.dart';

void main() {
  runApp(const MyApp());
}

var mycolorscheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 59, 96, 179));

var mydarkcolorscheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 59, 96, 179));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      //themeMode:   ,
      theme: ThemeData().copyWith(
          colorScheme: mycolorscheme,
          // useMaterial3: true   maghir ma nktbha tawa khtr fil version hdhi mawjouda par defaut true
          appBarTheme: const AppBarTheme().copyWith(
              backgroundColor: mycolorscheme.onPrimaryContainer,
              foregroundColor: mycolorscheme.primaryContainer),
          cardTheme: const CardTheme().copyWith(
              color: mycolorscheme.secondaryContainer,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor: mycolorscheme.primaryContainer)),
          textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: mycolorscheme.onSecondaryContainer,
                  fontSize: 17))),
      darkTheme: ThemeData.dark().copyWith(
          colorScheme: mycolorscheme,
          // useMaterial3: true   maghir ma nktbha tawa khtr fil version hdhi mawjouda par defaut true
          bottomSheetTheme: const BottomSheetThemeData()
              .copyWith(backgroundColor: mydarkcolorscheme.onPrimaryContainer),
          appBarTheme: const AppBarTheme().copyWith(
              backgroundColor: mydarkcolorscheme.onPrimaryContainer,
              foregroundColor: mydarkcolorscheme.primaryContainer),
          cardTheme: const CardTheme().copyWith(
              color: mydarkcolorscheme.secondaryContainer,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: mydarkcolorscheme.onPrimaryContainer,
                foregroundColor: mydarkcolorscheme.primaryContainer),
          ),
          textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: mydarkcolorscheme.onSecondaryContainer,
                  fontSize: 17))),
      home: const Expenses(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: Text(widget.title),
    ));
  }
}
