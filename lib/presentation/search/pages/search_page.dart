import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/common/widgets/appbar/app_bar.dart';
import 'package:flutter_movie/presentation/search/bloc/search_cubit.dart';
import 'package:flutter_movie/presentation/search/bloc/selectable_option_cubit.dart';
import 'package:flutter_movie/presentation/search/widgets/search_content.dart';
import 'package:flutter_movie/presentation/search/widgets/search_field.dart';
import 'package:flutter_movie/presentation/search/widgets/search_options.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        title: Text('Search'),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => SelectableOptionCubit()),
          BlocProvider(create: (context) => SearchCubit()),
        ],
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              SearchField(),
              SizedBox(height: 16.0),
              SearchOptions(),
              SizedBox(height: 16.0),
              Expanded(child: SearchContent()),
            ],
          ),
        ),
      ),
    );
  }
}
