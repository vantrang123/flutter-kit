import 'package:starterkit/api/api_base_helper.dart';
import 'package:starterkit/models/movie.dart';
import 'package:starterkit/responses/movie_response.dart';
import 'package:starterkit/utils/constants.dart';

class MovieRepository {

  ApiBaseHelper _helper = ApiBaseHelper();

  Future<List<Movie>> fetchMovieList() async {
    final response = await _helper.get(Constants.moviesUrl);
    return MovieResponse.fromJson(response).results;
  }
}
