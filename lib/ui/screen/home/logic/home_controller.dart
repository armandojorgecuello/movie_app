import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:movies_app/core/entities/movie.dart';
import 'package:movies_app/core/repositories/users_repository.dart';

class HomeController extends GetxController{
    
  HomeController({
    required MoviesRepository moviesRepository
  }) : 
    _moviesRepository = moviesRepository, 
    super();
  
  final MoviesRepository _moviesRepository;
  final textController = TextEditingController().obs;
  var scrollController = ScrollController().obs;
  var isRecommendSeAll = true.obs;
  var initialRecommendPage = 1.obs;
  var initialTopRatedPage = 1.obs;
  var initialRecommendedForYou = [].obs;
  var fullRecommendedForYou = [].obs;
  var initialTopRatedMovies = [].obs;
  var fullTopRatedMovies = [].obs;
  var filterMovies = [].obs;
  var movieDetails = Movie(
    adult: null,
    backdropPath: null,
    id: null,
    title: null,
    originalLanguage: null,
    originalTitle: null,
    overview: null,
    posterPath: null,
    mediaType: null,
    genreIds: null,
    popularity: null,
    releaseDate: null,
    video: null,
    voteAverage: null,
    voteCount: null,
  ).obs;

  @override
  void onInit() {

    _getRecommendsMovies();
    _getTopRatedMovies();
    scrollController.value.addListener(()async{
      if(scrollController.value.position.pixels >= scrollController.value.position.maxScrollExtent - 500){
        if(isRecommendSeAll.value){
          initialRecommendPage(initialRecommendPage.value+1);
          final recommendsMovies = await _moviesRepository.getRecommendsMoviesList(movieId: '2', page: initialRecommendPage.value.toString());
          if(recommendsMovies.successRes != null){
            final recommendedMovies = recommendsMovies.successRes?.results; 
            if (recommendedMovies != null ) {
              List<dynamic> dummyList = [];
              dummyList.addAll(fullRecommendedForYou);
              dummyList.addAll(recommendedMovies); 
              fullRecommendedForYou(dummyList);
            }
          }
        }else{
          initialTopRatedPage(initialTopRatedPage.value+1);
          final topRated = await _moviesRepository.getTopRatedMovies(page: initialTopRatedPage.value.toString());
          final ratedMovies = topRated.successRes?.results; 
          if( topRated.successRes != null){
            if(ratedMovies != null ){
              initialTopRatedMovies(ratedMovies.getRange(1, 5).toList());
              List<dynamic> dummyList = [];
              dummyList.addAll(fullTopRatedMovies);
              dummyList.addAll(ratedMovies); 
              fullTopRatedMovies(dummyList);
            }
          }
        }
      }
    });
    super.onInit();
  }

  @override
  void onClose() {
    textController.close();
    filterMovies.clear();
    super.onClose();
  }
    
  Future _getRecommendsMovies()async{
    initialRecommendPage(initialRecommendPage.value++);
    final recommendsMovies = await _moviesRepository.getRecommendsMoviesList(movieId: '2', page: initialRecommendPage.value.toString());
    if(recommendsMovies.successRes != null){
      final recommendedMovies = recommendsMovies.successRes?.results; 
      if (recommendedMovies != null ) {
        initialRecommendedForYou(recommendedMovies.getRange(1, 5).toList());
        fullRecommendedForYou(recommendedMovies);
      }
    }
  }

  Future _getTopRatedMovies()async{
    initialTopRatedPage(initialTopRatedPage.value++);
    final topRated = await _moviesRepository.getTopRatedMovies(page: initialTopRatedPage.value.toString());
    final ratedMovies = topRated.successRes?.results; 
    if( topRated.successRes != null){
      if(ratedMovies != null ){
        initialTopRatedMovies(ratedMovies.getRange(1, 5).toList());
        fullTopRatedMovies(ratedMovies);
      }
    }
  }

  filterList({required String query, required List<dynamic> movies}){
    if(textController.value.text.isNotEmpty){
      filterMovies(movies.where((mv) => mv.title!.toLowerCase().contains(query.toLowerCase())).toList());
    }else{
      filterMovies.clear();
    }
  }

}