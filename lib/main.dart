import 'package:appleshop1/common/color.dart';
import 'package:appleshop1/di/di.dart';
import 'package:appleshop1/screens/root_screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// init get it
  await getItInit();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale('fa'),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('fa'), // farsi
      ],
      debugShowCheckedModeBanner: false,
      title: 'AppleShop',
      theme: ThemeData(
        fontFamily: 'SM',
        scaffoldBackgroundColor: CustomColors.scaffoldColor,
      ),
      home: const RootScreens(),
    );
  }
}
