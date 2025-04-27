import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/common/helper/message/display_message.dart';
import 'package:flutter_movie/common/helper/navigation/app_navigation.dart';
import 'package:flutter_movie/presentation/auth/bloc/logout_cubit.dart';
import 'package:flutter_movie/presentation/auth/bloc/logout_state.dart';
import 'package:flutter_movie/presentation/auth/pages/signin.dart';

class LogoutBtn extends StatelessWidget {
  const LogoutBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogoutCubit(),
      child: BlocConsumer<LogoutCubit, LogoutState>(
        builder: (context, state) {
          if (state is LogoutLoading) {
            return const Center(
              child: SizedBox(
                width: 25.0,
                height: 25.0,
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (state is FailureLogout) {
            DisplayMessage.errorMessage(state.errorMessage, context);
          }
          return IconButton(
            onPressed: () {
              context.read<LogoutCubit>().logout();
            },
            icon: const Icon(Icons.logout),
          );
        },
        listener: (context, state) {
          if (state is LogoutLoaded) {
            AppNavigator.pushAndRemove(context, SigninPage());
          }
        },
      ),
    );
  }
}
