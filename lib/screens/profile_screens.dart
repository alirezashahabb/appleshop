import 'package:appleshop1/common/color.dart';
import 'package:appleshop1/widgets/profile/category_items_list_cheap.dart';
import 'package:flutter/material.dart';

class ProfileScreens extends StatelessWidget {
  const ProfileScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              height: 46,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  const SizedBox(
                    width: 16,
                  ),
                  Image.asset('assets/images/icon_apple_blue.png'),
                  const Expanded(
                    child: Text(
                      'حساب کاربری',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Sb',
                        color: CustomColors.mainColor,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Text(
              'علیرضا شهاب',
              style: TextStyle(fontFamily: 'Sm'),
            ),
            const Text(
              '09916924578',
              style: TextStyle(
                fontFamily: 'Sm',
                fontSize: 10,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Wrap(
              alignment: WrapAlignment.end,
              spacing: 20,
              runSpacing: 20,
              children: const [
                CategoryItemCheap(),
                CategoryItemCheap(),
                CategoryItemCheap(),
                CategoryItemCheap(),
                CategoryItemCheap(),
                CategoryItemCheap(),
                CategoryItemCheap(),
                CategoryItemCheap(),
                CategoryItemCheap(),
              ],
            ),
            const Spacer(),
            const Text(
              'اپل شاپ',
              style: TextStyle(
                fontFamily: 'Sm',
                fontSize: 11,
                color: CustomColors.mainTextcolor,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            const Text(
              'v.12.10.9',
              style: TextStyle(
                fontFamily: 'Sm',
                fontSize: 10,
                color: CustomColors.mainTextcolor,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
