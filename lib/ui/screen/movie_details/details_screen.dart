import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/core/entities/movie.dart';
import 'package:movies_app/generated/l10n.dart';
import 'package:movies_app/ui/screen/movie_details/logic/details_controller.dart';
import 'package:movies_app/ui/utils/constants/constants.dart';
import 'package:movies_app/ui/utils/constants/general.dart';
import 'package:movies_app/ui/utils/responsive.dart';
import 'package:movies_app/ui/utils/styles/styles.dart';
import 'package:movies_app/ui/widgets/custom_detail_screen_title.dart';
import 'package:movies_app/ui/widgets/custom_header_widget.dart';
import 'package:movies_app/ui/widgets/custom_watch_button_and_rating_bar.dart';

class DetailsScreen extends GetWidget<DetailsController> {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const padding = EdgeInsets.only(left: kDimens20, right:kDimens20, top: kDimens30 );
    final movie = Get.arguments as Movie;
    final responsive = Responsive(context);
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              CustomHeaderImage( moviePosterPath: movie.backdropPath ?? kPlaceHolderImage, responsive: responsive),
              CustomMovieTitle(padding: padding, movieTitle: movie.title!),
              CustomWatchButtonAndRatingBar(padding: padding, movieHasVideo: movie.video!, responsive: responsive),
              Padding(
                padding: padding,
                child: Text(
                  movie.overview!, 
                  style: Styles.p1.copyWith(
                    color: kGray, 
                    fontSize: responsive.dp(kDimens2),
                    height: kDimens0150
                  ),
                ),
              ),
              Obx(
                () {
                  return controller.isLoadedData.value ? SizedBox(
                    height: responsive.hp(kDimens38),
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: responsive.hp(kDimens20),
                          child: ListView.builder(
                            itemCount: controller.credits.value.cast?.length ,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              final castInfo = controller.credits.value.cast?[index];  
                              return  Padding(
                                padding: const EdgeInsets.only(left: kDimens15, right: kDimens5, top: kDimens15),
                                child: SizedBox(
                                  width: responsive.wp(kDimens20),
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(kDimens180),
                                        child: FadeInImage.assetNetwork(
                                          placeholder: 'assets/loading.gif', 
                                          image: '$kImagePath${castInfo?.profilePath}',
                                          imageErrorBuilder: (context, obj, stackTrace) =>
                                            Image.asset(
                                              'assets/no_image.png',
                                              height: responsive.wp(kDimens20),
                                              width: responsive.wp(kDimens20),
                                              fit: BoxFit.cover,
                                            ),
                                         height: responsive.wp(kDimens20),
                                         width: responsive.wp(kDimens20),
                                         fit: BoxFit.cover,
                                        )
                                      ),
                                      const SizedBox(height: kDimens15,),
                                      Text(
                                        castInfo!.name!, 
                                        style: Styles.p1.copyWith(
                                          color: kWhite, 
                                          fontSize: responsive.dp(kDimens2),
                                        ), 
                                        textAlign: TextAlign.center,
                                        maxLines: 2, 
                                      )
                                      
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding:const EdgeInsets.only(left: kDimens15, right: kDimens5, top: kDimens15),
                          child: RichText(
                            text: TextSpan(
                              text:"${I18n.of(context).sStudio}   \n",
                              style: Styles.p1.copyWith(fontSize: responsive.dp(kDimens2), color: kWhite, height: kDimens0150),
                              children: [
                                TextSpan(
                                  text:"${I18n.of(context).sGenre}   \n",
                                ),
                                TextSpan(
                                  text: "${I18n.of(context).sRelase}   ${movie.releaseDate?.year}\n",
                                )
                              ]
                            )
                          ),
                        )
                      ],
                    ) 
                  ) : const SizedBox(
                    width: kDimens30,
                    height: kDimens10,
                    child:   CupertinoActivityIndicator(),
                  );
                }
              )
            ])
          )
        ],
      ),
    );
  }
}

