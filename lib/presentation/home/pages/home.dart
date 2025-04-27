import 'package:flutter/material.dart';
import 'package:flutter_movie/common/helper/navigation/app_navigation.dart';
import 'package:flutter_movie/common/widgets/appbar/app_bar.dart';
import 'package:flutter_movie/core/configs/assets/app_vectors.dart';
import 'package:flutter_movie/presentation/auth/widgets/logout_btn.dart';
import 'package:flutter_movie/presentation/home/widgets/category_text.dart';
import 'package:flutter_movie/presentation/home/widgets/now_playing_movies.dart';
import 'package:flutter_movie/presentation/home/widgets/popular_tv.dart';
import 'package:flutter_movie/presentation/home/widgets/trending_movies.dart';
import 'package:flutter_movie/presentation/search/pages/search_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        hideBack: true,
        leading: const LogoutBtn(),
        action: IconButton(
          onPressed: () {
            AppNavigator.push(context, const SearchPage());
          },
          icon: const Icon(Icons.search),
        ),
        title: SvgPicture.asset(
          AppVectors.logo,
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CategoryText(title: 'Trendings 🤞'),
            TrendingMovies(),
            SizedBox(height: 16.0),
            CategoryText(title: 'Now Playing 💕'),
            SizedBox(height: 16.0),
            NowPlayingMovies(),
            SizedBox(height: 16.0),
            CategoryText(title: 'Popular TV'),
            SizedBox(height: 16.0),
            PopularTV(),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
