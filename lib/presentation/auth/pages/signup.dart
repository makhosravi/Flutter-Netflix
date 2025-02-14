import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie/common/helper/message/display_message.dart';
import 'package:flutter_movie/common/helper/navigation/app_navigation.dart';
import 'package:flutter_movie/core/configs/theme/app_colors.dart';
import 'package:flutter_movie/data/auth/models/signup_req_params.dart';
//import 'package:flutter_movie/data/auth/repositories/auth.dart';
//import 'package:flutter_movie/data/auth/sources/auth_api_service.dart';
import 'package:flutter_movie/domain/auth/usecases/signup.dart';
import 'package:flutter_movie/presentation/auth/pages/signin.dart';
import 'package:flutter_movie/presentation/home/pages/home.dart';
import 'package:flutter_movie/service_locator.dart';
import 'package:reactive_button/reactive_button.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _passwordCon = TextEditingController();

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
              _singupText(),
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
              _signupButton(context),
              const SizedBox(
                height: 20.0,
              ),
              _singinText(context),
            ],
          )),
    );
  }

  Widget _singupText() {
    return const Text(
      'Sing up',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24.0,
      ),
    );
  }

  Widget _emailField() {
    return TextField(
      controller: _emailCon,
      decoration: const InputDecoration(
        hintText: 'Email',
      ),
    );
  }

  Widget _passwordField() {
    return TextField(
      controller: _passwordCon,
      decoration: const InputDecoration(
        hintText: 'Password',
      ),
    );
  }

  Widget _signupButton(BuildContext context) {
    return ReactiveButton(
      title: 'Sing up',
      activeColor: AppColors.primary,
      onPressed: () async =>
        await sl<SignupUsecase>().call(
          params: SignupReqParams(
            email: _emailCon.text,
            password: _passwordCon.text,
          ),
        )
        //use it without dependency injection
        //await SignupUsecase(authRepositiry: AuthRepositoryImpl(authApiService: AuthApiServiceImpl(),),).call(params: SignupReqParams(email: _emailCon.text, password: _passwordCon.text,),);
      ,
      onSuccess: () {
        AppNavigator.pushAndRemove(
          context,
          const HomePage(),
        );
      },
      onFailure: (error) {
        DisplayMessage.errorMessage(error, context);
      },
    );
  }

  Widget _singinText(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          const TextSpan(
            text: "Already have an account?",
          ),
          TextSpan(
            text: ' Sign In ',
            style: const TextStyle(color: Colors.blue),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AppNavigator.push(
                  context,
                  SigninPage(),
                );
              },
          ),
        ],
      ),
    );
  }
}
