import 'dart:developer';

import 'package:get/get.dart';
import 'package:movies_app/core/entities/credits_movie.dart';
import 'package:movies_app/core/entities/movie.dart';
import 'package:movies_app/core/repositories/users_repository.dart';

class DetailsController extends GetxController{
    
  DetailsController({
    required MoviesRepository moviesRepository
  }) : 
    _moviesRepository = moviesRepository, 
    super();
  
  final MoviesRepository _moviesRepository;
  var credits = CreditsMovie(
    cast: null,
    crew: null,
    id: null
  ).obs;

  var isLoadedData = false.obs;

  @override
  void onInit() {
    final movie = Get.arguments as Movie;
     getMovieCredits(movie.id.toString());
    super.onInit();
  }
    
  Future getMovieCredits(String movieId)async{
    final response =  await _moviesRepository.getMovieCredits(movieId: movieId);
    if (response.isSuccess) {
      if(response.successRes != null){
        log('Si esta trayendo informacion');
        credits(response.successRes as CreditsMovie);
        isLoadedData(true);
      }
    }
  }


}