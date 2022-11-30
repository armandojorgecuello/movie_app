import 'package:get/route_manager.dart';
import 'package:movies_app/ui/screen/home/logic/home_binding.dart';
import 'package:movies_app/ui/screen/home/see_all_movies.dart';
import 'package:movies_app/ui/screen/movie_details/details_screen.dart';
import 'package:movies_app/ui/screen/home/home_screen.dart';
import 'package:movies_app/ui/screen/movie_details/logic/details_binding.dart';
import 'package:movies_app/ui/screen/splash/logic/splash_binding.dart';
import 'package:movies_app/ui/screen/splash/splash_screen.dart';
import 'package:movies_app/ui/utils/constants/constants.dart';


class MovieAppScreens{

  static final pages = [
    GetPage(
      name: kSplash, 
      page: () => SplashScreen(),
      binding: SplashBinding()
    ),
    GetPage(
      name: kHome, 
      page: () => const HomeScreen(),
      binding: HomeBinding()
    ),
    GetPage(
      name: kSeeAll, 
      page: () => const SeeAllMovies(),
      binding: HomeBinding()
    ),
    GetPage(
      name: kDetails, 
      page: () => const DetailsScreen(),
      binding: DetailsBinding()
    ),
  ];


}