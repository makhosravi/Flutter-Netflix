import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/presentation/splash/bloc/splash_state.dart';

class SplashCubit extends Cubit<SplashState>{
  SplashCubit():super(Displaysplash());
}