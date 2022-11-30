import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/ui/utils/constants/constants.dart';
import 'package:movies_app/ui/utils/constants/general.dart';
import 'package:movies_app/ui/utils/responsive.dart';

class CustomHeaderImage extends StatelessWidget {
  const CustomHeaderImage({
    Key? key,
    required this.moviePosterPath,
    required this.responsive,
  }) : super(key: key);

  final String moviePosterPath;
  final Responsive responsive;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(kDimens15),
            bottomRight: Radius.circular(kDimens15)
          ),
          child: FadeInImage.assetNetwork(
            placeholder: 'assets/loading.gif', 
            image: '$kImagePath$moviePosterPath',
            imageErrorBuilder: (context, obj, stackTrace) =>
              Image.asset(
                'assets/no_image.png',
                height: responsive.hp(kDimens40),
                fit: BoxFit.cover,
              ),
           height: responsive.hp(kDimens40),
           fit: BoxFit.cover,
          )
        ),
        Positioned(
          top: responsive.hp(kDimens4),
          right: kDimens10,
          left: kDimens10,
          child: SizedBox(
            width: responsive.width,
            child: Row(
              children: [
                GestureDetector(
                  onTap: (){
                    Get.back();
                  }, 
                  child: const Icon(Icons.arrow_back, color: kLigthGray, size: kDimens30,)
                ),
                const Spacer(),
                IconButton(
                  onPressed: (){}, 
                  icon: const Icon(Icons.favorite_border, color: kLigthGray, size: kDimens30,)
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}