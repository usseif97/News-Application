abstract class NewsStates {}

class AppIntialState extends NewsStates {}

class AppChangeBottomNAVState extends NewsStates {}

class AppGetBusinessLoadingState extends NewsStates {}

class AppGetBusinessSucessState extends NewsStates {}

class AppGetBusinessErrorsState extends NewsStates {
  final String error;
  AppGetBusinessErrorsState(this.error);
}

class AppGetSportsLoadingState extends NewsStates {}

class AppGetSportsSucessState extends NewsStates {}

class AppGetSportsErrorsState extends NewsStates {
  final String error;
  AppGetSportsErrorsState(this.error);
}

class AppGetScienceLoadingState extends NewsStates {}

class AppGetScienceSucessState extends NewsStates {}

class AppGetScienceErrorsState extends NewsStates {
  final String error;
  AppGetScienceErrorsState(this.error);
}

class AppGetTechnologyLoadingState extends NewsStates {}

class AppGetTechnologySucessState extends NewsStates {}

class AppGetTechnologyErrorsState extends NewsStates {
  final String error;
  AppGetTechnologyErrorsState(this.error);
}

class AppSearchLoadingState extends NewsStates {}

class AppSearchSucessState extends NewsStates {}

class AppSearchErrorsState extends NewsStates {
  final String error;
  AppSearchErrorsState(this.error);
}
