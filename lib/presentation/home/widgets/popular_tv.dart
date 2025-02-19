import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/common/widgets/tv/tv_card.dart';
import 'package:flutter_movie/presentation/home/bloc/popular_tv_cubit.dart';
import 'package:flutter_movie/presentation/home/bloc/popular_tv_state.dart';

class PopularTV extends StatelessWidget {
  const PopularTV({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PopularTVCubit()..getPopularTV(),
      child: BlocBuilder<PopularTVCubit, PopularTVState>(
        builder: (context, state) {
          if (state is PopularTVLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is PopularTVLoaded) {
            return SizedBox(
              height: 300.0,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemBuilder: (context, index) {
                  return TVCard(
                    tvEntity: state.tv[index],
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                  width: 10.0,
                ),
                itemCount: state.tv.length,
              ),
            );
          }

          if (state is FailurePopularTV) {
            return Text(state.errorMessage);
          }

          return Container();
        },
      ),
    );
  }
}
