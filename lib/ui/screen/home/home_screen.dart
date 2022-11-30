import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/core/entities/movie.dart';
import 'package:movies_app/ui/screen/home/logic/home_controller.dart';
import 'package:movies_app/ui/utils/constants/constants.dart';
import 'package:movies_app/ui/utils/constants/general.dart';
import 'package:movies_app/ui/utils/responsive.dart';
import 'package:movies_app/ui/utils/styles/styles.dart';
import 'package:movies_app/ui/widgets/custom_scrollable_widget.dart';
import 'package:movies_app/ui/widgets/custom_search_bar.dart';


class HomeScreen extends GetWidget<HomeController> {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context,) {
    final responsive = Responsive(context);
    return Scaffold(
      backgroundColor: kBlueColor,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: CustomSearchBar(responsive: responsive, controller: controller, ) ,
          ),
          controller.filterMovies.isEmpty ?  SliverToBoxAdapter(
            child: CustomScrollableView(responsive: responsive,controller: controller, ),
          ) :  SliverToBoxAdapter(
            child: Obx(
              () {
                return SizedBox(
                  height: responsive.hp(kDimens75),
                  child: ListView.builder(
                    itemCount: controller.filterMovies.length,
                    itemBuilder: (BuildContext context, int index) {
                      Movie movie = controller.filterMovies[index];  
                      return Card(
                        color: kBackgroundColor,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: kDimens5),
                          child: ListTile(
                            onTap: (){
                              Get.toNamed(kDetails, arguments: movie);
                            },
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(kDimens10),
                              child: Image.network(
                                '$kImagePath${movie.backdropPath}',
                                height: responsive.wp(kDimens20),
                                width: responsive.wp(kDimens20),
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: Text(movie.title!,style: Styles.h1.copyWith(color:  kWhite),),
                            subtitle: Text(
                              movie.overview!, 
                              style: Styles.p1.copyWith(color: kWhite), 
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
            ),
          )
        ],
      )
    );
  }
}




