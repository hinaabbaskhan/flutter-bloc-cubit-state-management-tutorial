import 'package:bloc_state_management_tutorial/data/models/movies_model.dart';
import 'package:bloc_state_management_tutorial/utils/urls.dart';

import '../../networking.dart';

class MovieRepository {
  Future<MoviesModel> getMovies() async {
    NetworkHelper networkHelper = NetworkHelper(moviesUrl);
    final moviesJsonResponse = await networkHelper.getData();
    // print(moviesJsonResponse['results'][0]['original_title']);
    // print(moviesJsonResponse['results'][0]['backdrop_path']);
    final moviesModel = MoviesModel.fromJson(moviesJsonResponse);
    return moviesModel;
  }
}
