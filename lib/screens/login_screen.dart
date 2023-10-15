import 'package:appleshop1/bloc/auth/authbloc_bloc.dart';
import 'package:appleshop1/common/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController userName =
        TextEditingController(text: 'alirezash');
    final TextEditingController password =
        TextEditingController(text: '12345678');
    return Scaffold(
      backgroundColor: CustomColors.mainColor,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                        fontFamily: 'Sb', fontSize: 22, color: Colors.white),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: userName,
                      decoration: InputDecoration(
                        label: const Text('نام کاربری'),
                        labelStyle: const TextStyle(
                            fontFamily: 'Sm',
                            fontSize: 13,
                            color: Colors.black),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                          color: CustomColors.mainColor,
                        )),
                        contentPadding: const EdgeInsets.all(12),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(width: 1),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextField(
                      controller: password,
                      decoration: InputDecoration(
                        label: const Text('رمز عبور'),
                        labelStyle: const TextStyle(
                            fontFamily: 'Sm',
                            fontSize: 13,
                            color: Colors.black),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                          color: CustomColors.mainColor,
                        )),
                        contentPadding: const EdgeInsets.all(12),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(width: 1),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        if (state is AuthblocInitial) {
                          return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              textStyle: const TextStyle(fontFamily: 'sm'),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {
                              BlocProvider.of<AuthBloc>(context).add(
                                  AuthRequest(userName.text, password.text));
                            },
                            child: const Text('ورود به حساب کابری'),
                          );
                        } else if (state is AuthLoading) {
                          return const CircularProgressIndicator();
                        } else if (state is AuthResonse) {
                          return state.responce.fold(
                            (l) => Text(l),
                            (r) => Text(r),
                          );
                        } else {
                          return const Text('State not support');
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
    );
  }
}
