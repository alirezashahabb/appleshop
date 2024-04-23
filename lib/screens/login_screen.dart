import 'package:appleshop1/bloc/auth_bloc_bloc.dart';
import 'package:appleshop1/common/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController userName =
        TextEditingController(text: 'alirezashshhs');
    final TextEditingController password =
        TextEditingController(text: '12345678');
    return Scaffold(
      backgroundColor: CustomColors.mainColor,
      body: BlocProvider(
        create: (context) => AuthBloc(),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/icon_application.png',
                      width: 150,
                      height: 150,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'اپل شاپ',
                      style: TextStyle(
                          fontSize: 20, color: CustomColors.scaffoldColor),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: CustomColors.scaffoldColor),
                  child: Column(
                    children: [
                      TextField(
                        controller: userName,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(12),
                          labelText: 'ایمیل',
                          labelStyle: const TextStyle(
                            color: Colors.black,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              color: CustomColors.mainColor,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextField(
                        controller: password,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(12),
                          labelText: 'رمز عبور...',
                          labelStyle: const TextStyle(
                            color: Colors.black,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              color: CustomColors.mainColor,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      BlocBuilder<AuthBloc, AuthBlocState>(
                        builder: (context, state) {
                          if (state is AuthBlocInitialState) {
                            return ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  foregroundColor: CustomColors.scaffoldColor,
                                  backgroundColor: CustomColors.mainColor,
                                  minimumSize: const Size(200, 50)),
                              onPressed: () {
                                BlocProvider.of<AuthBloc>(context).add(
                                    AuthLoginRequestEvent(
                                        userName: userName.text,
                                        password: password.text));
                              },
                              child: const Text('ثبت نام'),
                            );
                          } else if (state is AuthSateLoading) {
                            return const CircularProgressIndicator();
                          } else if (state is AuthResponseState) {
                            return state.response
                                .fold((l) => Text(l), (r) => Text(r));
                          } else {
                            return const Text('unsupport state');
                          }
                        },
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
