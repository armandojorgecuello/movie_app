import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/generated/l10n.dart';
import 'package:movies_app/ui/screen/home/logic/home_controller.dart';
import 'package:movies_app/ui/utils/constants/constants.dart';
import 'package:movies_app/ui/utils/responsive.dart';
import 'package:movies_app/ui/widgets/custom_recommended_widget.dart';
import 'package:movies_app/ui/widgets/custom_title.dart';
import 'package:movies_app/ui/widgets/custom_top_rated.dart';

class CustomHorizontalScrollWidget extends StatelessWidget {
  const CustomHorizontalScrollWidget({
    Key? key,
    required this.responsive,
    required this.controller,
    this.isTopRated = false,
  }) : super(key: key);

  final Responsive responsive;
  final HomeController controller;
  final bool isTopRated;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: kDimens20, ),
      child: Column(
        children: [
          CustomTitle(
            onPressed: (){
              controller.isRecommendSeAll(true);
              Get.toNamed(kSeeAll, arguments: ['recommend', I18n.of(context).sRecommendedForYou ]);
            },
            title: I18n.of(context).sRecommendedForYou,
          ),
          const SizedBox(
            height: kDimens10,
          ),
          CustomRecommendedWidget(responsive: responsive, controller: controller),
          CustomTitle(
            onPressed: (){
              controller.isRecommendSeAll(false);
              Get.toNamed(kSeeAll, arguments: ['topRated', I18n.of(context).sTopRated ]);
            },
            title: I18n.of(context).sTopRated,
          ),
          const SizedBox(
            height: kDimens10,
          ),
          CustomTopRatedWidget(responsive: responsive, controller: controller),
        ],
      ),
    );
  }
}

