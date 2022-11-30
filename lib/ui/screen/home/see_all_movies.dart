import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/core/entities/movie.dart';
import 'package:movies_app/ui/screen/home/logic/home_controller.dart';
import 'package:movies_app/ui/utils/constants/constants.dart';
import 'package:movies_app/ui/utils/constants/general.dart';
import 'package:movies_app/ui/utils/responsive.dart';
import 'package:movies_app/ui/utils/styles/styles.dart';

class SeeAllMovies extends GetWidget<HomeController> {
  const SeeAllMovies({super.key});

  @override
  Widget build(BuildContext context) {
    final comeFrom = Get.arguments[0] as String; 
    final title = Get.arguments[1] as String;
    final responsive = Responsive(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        elevation: kDimens0,
        title: Text(title, style: Styles.appBarTitleStyle.copyWith(fontSize: kDimens20),),
        centerTitle: true,
        leading: IconButton(
          onPressed: (){
            Get.back();
            controller.textController.value.clear();
            controller.filterMovies.clear();
          }, 
          icon: const Icon(Icons.arrow_back)
        ),
      ),
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Obx(
          () {
            return CustomScrollView(
              controller: controller.scrollController.value,
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate(
                    comeFrom  == 'recommend' ? controller.fullRecommendedForYou.value.map((movie) => CustomSeeAllMovieCard(responsive: responsive, movie: movie,)).toList() 
                    : controller.fullTopRatedMovies.value.map((movie) => CustomSeeAllMovieCard(responsive: responsive, movie: movie,)).toList()
                  )
                )
              ],
            );
          }
        )
      )
    );
  }
}

class CustomSeeAllMovieCard extends StatelessWidget {
  const CustomSeeAllMovieCard({
    Key? key,
    required this.responsive,
    required this.movie,
  }) : super(key: key);

  final Responsive responsive;
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: kDimens10,),
      child: GestureDetector(
        onTap: (){
          Get.toNamed(kDetails, arguments: movie);
        },
        child: Card(
          child: Column(
            children: [
              FadeInImage.assetNetwork(
                placeholder: 'assets/loading.gif', 
                image: '$kImagePath${movie.backdropPath}',
                imageErrorBuilder: (context, obj, stackTrace) =>
                  Image.asset(
                    'assets/loading.gif',
                    height: responsive.wp(kDimens20),
                    width: responsive.width,
                    fit: BoxFit.cover,
                  ),
                  height: responsive.hp(kDimens20),
                  width: responsive.width,
                fit: BoxFit.cover,
              ),
              ListTile(
                title: Text(movie.title!, style: Styles.h1.copyWith(color: kBlack, fontWeight: FontWeight.bold, fontSize: kDimens18),),
                subtitle: Text(movie.overview!, style: Styles.h1.copyWith(color: kBlack, fontWeight: FontWeight.normal), maxLines: kDimens2.toInt(),  ),
              )
            ],
          ),
        ),
      ),
    );
  }
}