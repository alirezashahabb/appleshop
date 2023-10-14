import 'package:appleshop1/common/di.dart';
import 'package:appleshop1/data/repositroy/auth_repositroy.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('getData'),
          ElevatedButton(
              onPressed: () async {
                var either =
                    await Authrepostiry().login('alirezash', '12345678');

                var share = locator.get<SharedPreferences>();
                print(share.getString('acsess_token'));

                either.fold((l) => print(l), (r) => print(r));
              },
              child: const Text('getData'))
        ],
      ),
    );
  }
}
