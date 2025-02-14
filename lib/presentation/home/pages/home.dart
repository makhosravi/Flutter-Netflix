import 'package:flutter/material.dart';
import 'package:flutter_movie/common/widgets/appbar/app_bar.dart';
import 'package:flutter_movie/core/configs/assets/app_vectors.dart';
import 'package:flutter_movie/presentation/home/widgets/trending.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        hideBack: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0,),
          child: SvgPicture.asset(AppVectors.logo,),
        ),
      ),
      body: const Column(
        children: [
          TrendingMovies(),
        ],
      ),
    );
  }
}
