import 'package:bloc/bloc.dart';

import '../../data/models/movies_model.dart';
import '../../data/repositories/movies_repository.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit() : super(MoviesInitial());

  Future<void> fetchMovies() async {
    try {
      emit(MoviesLoading());
      MoviesModel moviesModel = await MovieRepository().getMovies();
      if (moviesModel != null) {
        emit(MoviesLoadedSuccess(moviesList: moviesModel.results));
      } else {
        emit(MoviesLoadedFailure());
      }
    } catch (e) {
      print(e);
      emit(MoviesLoadedFailure());
    }
  }
}
