import 'package:flutter/material.dart';
import 'package:movies_app/ui/screen/home/logic/home_controller.dart';
import 'package:movies_app/ui/utils/constants/constants.dart';
import 'package:movies_app/ui/utils/responsive.dart';
import 'package:movies_app/ui/widgets/custom_horizontal_scroll_widget.dart';

class CustomScrollableView extends StatelessWidget {
  const CustomScrollableView({
    Key? key,
    required this.responsive,
    required this.controller,
  }) : super(key: key);

  final Responsive responsive;
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: responsive.hp(kDimens75),
      child: PhysicalModel(
        color: kBackgroundColor,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(kDimens30),
          topLeft: Radius.circular(kDimens30)
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: kDimens20),
          child: CustomHorizontalScrollWidget(responsive: responsive, controller: controller, isTopRated: false,),
        ),
      ),
    );
  }
}

