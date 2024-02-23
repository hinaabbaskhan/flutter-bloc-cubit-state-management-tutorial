part of 'movies_cubit.dart';

abstract class MoviesState {}

class MoviesInitial extends MoviesState {}

class MoviesLoading extends MoviesState {}

class MoviesLoadedSuccess extends MoviesState {
  final List<Results>? moviesList;
  MoviesLoadedSuccess({required this.moviesList});
}

class MoviesLoadedFailure extends MoviesState {}

//Loading
//Success
//Failure
