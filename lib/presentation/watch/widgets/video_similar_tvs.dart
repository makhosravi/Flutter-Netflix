import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/common/bloc/generic_data_cubit.dart';
import 'package:flutter_movie/common/bloc/generic_data_state.dart';
import 'package:flutter_movie/common/widgets/tv/tv_card.dart';
import 'package:flutter_movie/domain/tv/entities/tv_entity.dart';
import 'package:flutter_movie/domain/tv/usecases/get_similar_tv_usecase.dart';
import 'package:flutter_movie/service_locator.dart';

class VideoSimilarTVs extends StatelessWidget {
  final int tvId;
  const VideoSimilarTVs({
    required this.tvId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenericDataCubit()
        ..getData<List<TVEntity>>(
          sl<GetSimilarTvUsecase>(),
          params: tvId,
        ),
      child: BlocBuilder<GenericDataCubit, GenericDataState>(
        builder: (context, state) {
          if (state is DataLoadind) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is DataLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Similar',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                SizedBox(
                  height: 300.0,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
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
                ),
              ],
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
