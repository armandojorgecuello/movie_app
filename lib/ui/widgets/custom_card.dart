import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:movies_app/core/entities/movie.dart';
import 'package:movies_app/ui/screen/home/logic/home_controller.dart';
import 'package:movies_app/ui/utils/constants/constants.dart';
import 'package:movies_app/ui/utils/constants/general.dart';
import 'package:movies_app/ui/utils/responsive.dart';
import 'package:movies_app/ui/utils/styles/styles.dart';

class CustomCard extends StatelessWidget {
  CustomCard({
    Key? key,
    required this.movie,
    required this.responsive,
    required this.controller,
  }) : super(key: key);

  final Movie movie;
  final HomeController controller;
  final Responsive responsive;

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: kTransparent,
      child: Padding(
        padding: const EdgeInsets.only(right: kDimens15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: (){
                Get.toNamed(kDetails, arguments: movie);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(kDimens16),
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/loading.gif', 
                  image: '$kImagePath${movie.backdropPath}',
                  imageErrorBuilder: (context, obj, stackTrace) =>
                    Image.asset(
                      'assets/no_image.png',
                      height: responsive.hp(kDimens20),
                      width: responsive.wp(kDimens38),
                      fit: BoxFit.cover,
                    ),
                  height: responsive.hp(kDimens20),
                  width: responsive.wp(kDimens38),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox( height:  kDimens10,),
            SizedBox(
              width: responsive.wp(kDimens38),
              child: Text(
                movie.title!, 
                style: Styles.h1,
                overflow: TextOverflow.ellipsis,
              )
            ),
            const SizedBox( height:  kDimens10,),
            SizedBox(
              width: responsive.wp(kDimens38),
              height: kDimens20,
              child: RatingBar.builder(
                 initialRating: 4,
                 minRating: 1,
                 direction: Axis.horizontal,
                 allowHalfRating: true,
                 itemCount: 5,
                 itemPadding: const EdgeInsets.only(left: kDimens0),
                 itemSize: kDimens20,
                 itemBuilder: (context, _) => const Icon(
                   Icons.star,
                   color: Colors.amber,
                 ),
                 onRatingUpdate: (rating) {
                   print(rating);
                 },
              ),
            )
          ],
        ),
      ),
    );
  }
}