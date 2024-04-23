import 'package:appleshop1/data/repositroy/auth_repositroy.dart';
import 'package:appleshop1/data/repositroy/product_detail_repositroy.dart';
import 'package:appleshop1/utils/auth_manger.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                ElevatedButton(
                  onPressed: () async {
                    await AuthRepository().login('alirezashshhs', '12345678');
                  },
                  child: const Text('login'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    AuthManger.logout();
                  },
                  child: const Text('logout'),
                ),
                ValueListenableBuilder(
                  valueListenable: AuthManger.notifierAuth,
                  builder: (context, value, child) {
                    if (value == null || value.isEmpty) {
                      return const Text('شما وارد  نشدی');
                    } else {
                      return const Text('شما وارد شدی');
                    }
                  },
                ),
                ElevatedButton(
                    onPressed: () async {
                      var either =
                          await ProductDetailRepository().getProductVariant();
                      either.fold((l) => print(l), (r) {
                        for (var element in r) {
                          print(element.variant.first.value);
                        }
                      });
                    },
                    child: const Text('getData'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
