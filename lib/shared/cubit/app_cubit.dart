import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/network/local/cache_helper.dart';
import 'package:news_app/shared/cubit/app_states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppIntialState());

  static AppCubit get(context) => BlocProvider.of(context);

  bool isDark = false;
  void changeAppMode({bool? cache}) {
    if (cache != null) {
      // there's cache --> take the value and no need for caching
      isDark = cache;
      emit(AppChangemode());
    } else {
      // there's no cache --> cache the light mode (used on pressing the toggle button)
      isDark = !isDark;
      CacheHelper.putData(key: 'isDark', value: isDark).then((value) {
        emit(AppChangemode());
      });
    }
  }
}
