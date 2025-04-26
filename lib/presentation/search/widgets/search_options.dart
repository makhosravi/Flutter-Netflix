import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/presentation/search/bloc/search_cubit.dart';
import 'package:flutter_movie/presentation/search/bloc/selectable_option_cubit.dart';
import 'package:flutter_movie/presentation/search/widgets/selectable_option.dart';

class SearchOptions extends StatelessWidget {
  const SearchOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectableOptionCubit, SearchType>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SelectableOption(
              title: 'Movie',
              isSelected: context.read<SelectableOptionCubit>().state ==
                  SearchType.movie,
              onTap: () {
                context.read<SelectableOptionCubit>().selectMovie();
                context.read<SearchCubit>().search(
                      context.read<SearchCubit>().textEditingController.text,
                      context.read<SelectableOptionCubit>().state,
                    );
              },
            ),
            const SizedBox(
              width: 16.0,
            ),
            SelectableOption(
              title: 'TV',
              isSelected:
                  context.read<SelectableOptionCubit>().state == SearchType.tv,
              onTap: () {
                context.read<SelectableOptionCubit>().selectTV();
                context.read<SearchCubit>().search(
                      context.read<SearchCubit>().textEditingController.text,
                      context.read<SelectableOptionCubit>().state,
                    );
              },
            ),
          ],
        );
      },
    );
  }
}
