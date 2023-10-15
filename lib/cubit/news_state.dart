abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadindState extends HomeState {}

class HomeSorcesSuccessState extends HomeState {}

class HomeSorcesErrorState extends HomeState {
  final String error;
  HomeSorcesErrorState(this.error);
}

class HomeNewsSuccessState extends HomeState {}

class HomeNewsErrorState extends HomeState {
  final String error;
  HomeNewsErrorState(this.error);
}

class HomeChangeIndexState extends HomeState {}

class HomeView extends HomeState {}

class NewsView extends HomeState {}
