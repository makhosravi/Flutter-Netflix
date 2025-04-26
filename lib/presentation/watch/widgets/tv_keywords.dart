import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/common/bloc/generic_data_cubit.dart';
import 'package:flutter_movie/common/bloc/generic_data_state.dart';
import 'package:flutter_movie/core/entities/keywords_model.dart';
import 'package:flutter_movie/domain/tv/usecases/get_keywords_usecase.dart';
import 'package:flutter_movie/service_locator.dart';

class TVKeyWords extends StatelessWidget {
  final int tvId;
  const TVKeyWords({required this.tvId, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenericDataCubit()
        ..getData<List<KeyWordsEntity>>(
          sl<GetTVKeyWordsUsecase>(),
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
            List<KeyWordsEntity> keywords = state.data;
            return Wrap(
              spacing: 5.0,
              children: keywords
                  .map(
                    (item) => Chip(
                      label: Text(item.name),
                    ),
                  )
                  .toList(),
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
