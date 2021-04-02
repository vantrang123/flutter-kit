import 'dart:async';

import 'package:starterkit/api/api_response.dart';
import 'package:starterkit/models/movie.dart';
import 'package:starterkit/repositories/movie_repository.dart';

class BannerBloc {
  MovieRepository _movieRepository;

  StreamController _bannerController;

  StreamSink<ApiResponse<List<Movie>>> get bannerListSink =>
      _bannerController.sink;

  Stream<ApiResponse<List<Movie>>> get bannerListStream =>
      _bannerController.stream;

  BannerBloc() {
    _bannerController = StreamController<ApiResponse<List<Movie>>>();
    _movieRepository = MovieRepository();
    fetchBannerList();
  }

  void fetchBannerList() async {
    bannerListSink.add(ApiResponse.loading('Fetching Banners'));
    try {
      List<Movie> banners = await _movieRepository.fetchMovieList();
      bannerListSink.add(ApiResponse.completed(banners));
    } catch (e) {
      bannerListSink.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _bannerController?.close();
  }
}