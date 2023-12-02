import 'package:appleshop1/common/color.dart';
import 'package:appleshop1/common/di.dart';
import 'package:appleshop1/data/model/cart_item.dart';
import 'package:appleshop1/screens/root_screens.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Hive SetUP
  await Hive.initFlutter();
  Hive.registerAdapter(
    BasketItemAdapter(),
  );
  await Hive.openBox<BasketItem>('CartBox');
  // init getIt
  await getInit();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AppleShop',
      theme: ThemeData(scaffoldBackgroundColor: CustomColors.scaffoldColor),
      home: const RootScreens(),
    );
  }
}
