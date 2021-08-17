import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/business/business_screen.dart';
import 'package:news_app/modules/science/science_screen.dart';
import 'package:news_app/modules/sports/sports_screen.dart';
import 'package:news_app/modules/technology/technology_screen.dart';
import 'package:news_app/network/remote/dio_helper.dart';
import 'package:news_app/shared/cubit/states.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(AppIntialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  // Bottom Navigation Bar
  int currentIndex = 0;
  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    TechnologyScreen(),
  ];
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.business,
      ),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.sports,
      ),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.science,
      ),
      label: 'Science',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.computer_outlined,
      ),
      label: 'Technology',
    ),
  ];
  void changeIndex(int index) {
    currentIndex = index;
    if (index == 1) {
      getSportsNews();
    }
    if (index == 2) {
      getScienceNews();
    }
    if (index == 3) {
      getTechnologyhNews();
    }
    emit(AppChangeBottomNAVState());
  }

  // Business News API Handling
  List<dynamic> businessNews = [];
  void getBusinessNews() {
    if (businessNews.length == 0) {
      emit(AppGetBusinessLoadingState());
      DioHelper()
        ..getData(
          url: 'v2/top-headlines',
          query: {
            'country': 'eg',
            'category': 'business',
            'apiKey': 'b7f61724cae2408180a8f4de3e409231'
          },
        ).then((value) {
          businessNews = value.data['articles'];
          print(businessNews.length);
          emit(AppGetBusinessSucessState());
        }).catchError((error) {
          print(error.toString());
          emit(AppGetBusinessErrorsState(error.toString()));
        });
    } else {
      emit(AppGetBusinessSucessState());
    }
  }

  // Sports News API Handling
  List<dynamic> sportsNews = [];
  void getSportsNews() {
    if (sportsNews.length == 0) {
      emit(AppGetSportsLoadingState());
      DioHelper()
        ..getData(
          url: 'v2/top-headlines',
          query: {
            'country': 'eg',
            'category': 'sports',
            'apiKey': 'b7f61724cae2408180a8f4de3e409231'
          },
        ).then((value) {
          sportsNews = value.data['articles'];
          print(sportsNews.length);
          emit(AppGetSportsSucessState());
        }).catchError((error) {
          print(error.toString());
          emit(AppGetSportsErrorsState(error.toString()));
        });
    } else {
      emit(AppGetSportsSucessState());
    }
  }

  // Science News API Handling
  List<dynamic> scienceNews = [];
  void getScienceNews() {
    if (scienceNews.length == 0) {
      emit(AppGetScienceLoadingState());
      DioHelper()
        ..getData(
          url: 'v2/top-headlines',
          query: {
            'country': 'eg',
            'category': 'science',
            'apiKey': 'b7f61724cae2408180a8f4de3e409231'
          },
        ).then((value) {
          scienceNews = value.data['articles'];
          print(scienceNews.length);
          emit(AppGetScienceSucessState());
        }).catchError((error) {
          print(error.toString());
          emit(AppGetScienceErrorsState(error.toString()));
        });
    } else {
      emit(AppGetScienceSucessState());
    }
  }

  // Health News API Handling
  List<dynamic> technologyNews = [];
  void getTechnologyhNews() {
    if (technologyNews.length == 0) {
      emit(AppGetTechnologyLoadingState());
      DioHelper()
        ..getData(
          url: 'v2/top-headlines',
          query: {
            'country': 'eg',
            'category': 'technology',
            'apiKey': 'b7f61724cae2408180a8f4de3e409231'
          },
        ).then((value) {
          technologyNews = value.data['articles'];
          print(technologyNews.length);
          emit(AppGetTechnologySucessState());
        }).catchError((error) {
          print(error.toString());
          emit(AppGetTechnologyErrorsState(error.toString()));
        });
    } else {
      emit(AppGetTechnologySucessState());
    }
  }

  // Search API Handling
  List<dynamic> search = [];
  void getSearch(String value) {
    emit(AppSearchLoadingState());
    search = [];
    DioHelper()
      ..getData(
        url: 'v2/everything',
        query: {
          'q': '$value',
          'apiKey': 'b7f61724cae2408180a8f4de3e409231',
        },
      ).then((value) {
        search = value.data['articles'];
        print(search.length);
        emit(AppSearchSucessState());
      }).catchError((error) {
        print(error.toString());
        emit(AppSearchErrorsState(error.toString()));
      });
  }
}
