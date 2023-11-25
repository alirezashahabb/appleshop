import 'package:appleshop1/common/auth_manger.dart';
import 'package:appleshop1/data/repositroy/auth_repositroy.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () async {
                await Authrepostiry().login('alirezash', '12345678');
              },
              child: const Text('login')),
          ElevatedButton(
            onPressed: () async {
              AuthManger.logOut();
            },
            child: const Text('logOut'),
          ),
          ValueListenableBuilder(
            valueListenable: AuthManger.authChangeNotifire,
            builder: (context, value, child) {
              if (value == null || value.isEmpty) {
                return const Text('شما وارد نشد اید');
              } else {
                return const Text('شما وارد  شده اید');
              }
            },
          ),
          // ElevatedButton(
          //     onPressed: () async {
          //       var repositroy = ProdcutDetailRepository();
          //       var eitheer = await repositroy.getprodctVaraint();
          //       eitheer.fold(
          //           (l) => print(l),
          //           (r) => r.forEach((element) {
          //                 print(element.variantType.title);
          //               }));
          //     },
          //     child: const Text('getData'))
        ],
      ),
    );
  }
}
