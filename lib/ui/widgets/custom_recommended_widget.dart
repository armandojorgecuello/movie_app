import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/core/entities/movie.dart';
import 'package:movies_app/ui/screen/home/logic/home_controller.dart';
import 'package:movies_app/ui/utils/constants/constants.dart';
import 'package:movies_app/ui/utils/responsive.dart';
import 'package:movies_app/ui/widgets/custom_card.dart';

class CustomRecommendedWidget extends StatelessWidget {
  final Responsive responsive;
  final HomeController controller;
  const CustomRecommendedWidget({
    required this.responsive,
    required this.controller,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return SizedBox(
          height: responsive.hp(kDimens29),
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: controller.initialRecommendedForYou.length,
            itemBuilder: (BuildContext context, int index) {  
              Movie movie = controller.initialRecommendedForYou[index]; 
              return CustomCard(movie: movie, responsive: responsive, controller: controller,);
            },
          ),
        );
      }
    );
  }
}

