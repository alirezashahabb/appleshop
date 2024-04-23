import 'dart:ui';

import 'package:appleshop1/common/color.dart';
import 'package:appleshop1/screens/cart_screen.dart';
import 'package:appleshop1/screens/category_screens.dart';
import 'package:appleshop1/screens/home_screens.dart';
import 'package:appleshop1/screens/profile_screens.dart';
import 'package:flutter/material.dart';

class RootScreens extends StatefulWidget {
  const RootScreens({super.key});

  @override
  State<RootScreens> createState() => _RootScreensState();
}

class _RootScreensState extends State<RootScreens> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: getLayOut(),
      ),
      bottomNavigationBar: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
          child: BottomNavigationBar(
            onTap: (value) {
              setState(() {
                selectedIndex = value;
              });
            },
            currentIndex: selectedIndex,
            selectedLabelStyle: const TextStyle(
                fontSize: 12, color: CustomColors.mainColor, fontFamily: 'Sb'),
            unselectedLabelStyle: const TextStyle(
                fontSize: 12,
                color: CustomColors.mainTextcolor,
                fontFamily: 'Sb'),
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent,
            elevation: 0,
            items: [
              BottomNavigationBarItem(
                  activeIcon: Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Container(
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 20,
                            color: CustomColors.mainColor,
                            spreadRadius: -7,
                            offset: Offset(0, 13),
                          )
                        ],
                      ),
                      child: Image.asset('assets/images/icon_home_active.png'),
                    ),
                  ),
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Container(
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 20,
                            color: CustomColors.mainColor,
                            spreadRadius: -7,
                            offset: Offset(0, 13),
                          )
                        ],
                      ),
                      child: Image.asset('assets/images/icon_home.png'),
                    ),
                  ),
                  label: 'خانه'),
              BottomNavigationBarItem(
                  activeIcon: Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Container(
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 20,
                            color: CustomColors.mainColor,
                            spreadRadius: -7,
                            offset: Offset(0, 13),
                          )
                        ],
                      ),
                      child:
                          Image.asset('assets/images/icon_category_active.png'),
                    ),
                  ),
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Container(
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 20,
                            color: CustomColors.mainColor,
                            spreadRadius: -7,
                            offset: Offset(0, 13),
                          )
                        ],
                      ),
                      child: Image.asset('assets/images/icon_category.png'),
                    ),
                  ),
                  label: 'دسته بندی'),
              BottomNavigationBarItem(
                  activeIcon: Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Container(
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 20,
                            color: CustomColors.mainColor,
                            spreadRadius: -7,
                            offset: Offset(0, 13),
                          )
                        ],
                      ),
                      child:
                          Image.asset('assets/images/icon_basket_active.png'),
                    ),
                  ),
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Container(
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 20,
                            color: CustomColors.mainColor,
                            spreadRadius: -7,
                            offset: Offset(0, 13),
                          )
                        ],
                      ),
                      child: Image.asset('assets/images/icon_basket.png'),
                    ),
                  ),
                  label: 'سبدخرید'),
              BottomNavigationBarItem(
                  activeIcon: Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Container(
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 20,
                            color: CustomColors.mainColor,
                            spreadRadius: -7,
                            offset: Offset(0, 13),
                          )
                        ],
                      ),
                      child:
                          Image.asset('assets/images/icon_profile_active.png'),
                    ),
                  ),
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Container(
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 20,
                            color: CustomColors.mainColor,
                            spreadRadius: -7,
                            offset: Offset(0, 13),
                          )
                        ],
                      ),
                      child: Image.asset('assets/images/icon_profile.png'),
                    ),
                  ),
                  label: 'پروفایل'),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> getLayOut() {
    return <Widget>[
      const HomeScreens(),
      const CategoryScreens(),
      const CartScreen(),
      const ProfileScreens(),
    ];
  }
}
