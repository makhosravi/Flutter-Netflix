import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/common/bloc/generic_data_cubit.dart';
import 'package:flutter_movie/common/bloc/generic_data_state.dart';
import 'package:flutter_movie/common/widgets/tv/tv_card.dart';
import 'package:flutter_movie/domain/movie/enteties/movie_entity.dart';
import 'package:flutter_movie/domain/tv/usecases/get_popular_tv.dart';
import 'package:flutter_movie/service_locator.dart';

class PopularTV extends StatelessWidget {
  const PopularTV({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenericDataCubit()..getData<List<MovieEntity>>(sl<GetPopularTVUseCase>(),),
      child: BlocBuilder<GenericDataCubit, GenericDataState>(
        builder: (context, state) {
          if (state is DataLoadind) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is DataLoaded) {
            return SizedBox(
              height: 300.0,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemBuilder: (context, index) {
                  return TVCard(
                    tvEntity: state.data[index],
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                  width: 10.0,
                ),
                itemCount: state.data.length,
              ),
            );
          }

          if (state is FailureData) {
            return Text(state.errorMessage);
          }

          return Container();
        },
      ),
    );
  }
}
