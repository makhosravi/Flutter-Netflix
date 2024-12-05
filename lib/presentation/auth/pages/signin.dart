import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie/common/helper/navigation/app_navigation.dart';
import 'package:flutter_movie/core/configs/theme/app_colors.dart';
import 'package:flutter_movie/presentation/auth/pages/signup.dart';
import 'package:reactive_button/reactive_button.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          minimum: const EdgeInsets.only(
            top: 100.0,
            right: 16.0,
            left: 16.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _singinText(),
              const SizedBox(
                height: 30.0,
              ),
              _emailField(),
              const SizedBox(
                height: 20.0,
              ),
              _passwordField(),
              const SizedBox(
                height: 60.0,
              ),
              _signinButton(),
              const SizedBox(
                height: 20.0,
              ),
              _singupText(context),
            ],
          )),
    );
  }

  Widget _singinText() {
    return const Text(
      'Sing in',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24.0,
      ),
    );
  }

  Widget _emailField() {
    return const TextField(
      decoration: InputDecoration(
        hintText: 'Email',
      ),
    );
  }

  Widget _passwordField() {
    return const TextField(
      decoration: InputDecoration(
        hintText: 'Password',
      ),
    );
  }

  Widget _signinButton() {
    return ReactiveButton(
      title: 'Sing in',
      activeColor: AppColors.primary,
      onPressed: () async {},
      onSuccess: () {},
      onFailure: (error) {},
    );
  }

  Widget _singupText(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          const TextSpan(
            text: "Don't have an account?",
          ),
          TextSpan(
            text: ' Sign Up ',
            style: const TextStyle(color: Colors.blue),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AppNavigator.push(
                  context,
                  const SignupPage(),
                );
              },
          ),
        ],
      ),
    );
  }
}
