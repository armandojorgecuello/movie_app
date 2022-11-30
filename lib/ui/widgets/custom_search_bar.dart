import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/generated/l10n.dart';
import 'package:movies_app/ui/screen/home/logic/home_controller.dart';
import 'package:movies_app/ui/utils/constants/constants.dart';
import 'package:movies_app/ui/utils/responsive.dart';
import 'package:movies_app/ui/utils/styles/styles.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    Key? key,
    required this.responsive,
    required this.controller,
  }) : super(key: key);

  final Responsive responsive;
  final HomeController controller;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: responsive.hp(kDimens6),) ,
        SizedBox(
          width: responsive.wp(kDimens80),
          child: Text(
            I18n.of(context).sTitle,
            style: Styles.appBarTitleStyle,
          ),
        ),
        SizedBox(height: responsive.hp(kDimens3),),
        SizedBox(
          width: responsive.wp(kDimens80),
          child: PhysicalModel(
            borderRadius: BorderRadius.circular(kDimens50),
            color: kLigthBlueColor,
            child: Obx(
              () {
                return TextField(
                  controller: controller.textController.value,
                  onChanged: (String value){
                    controller.filterList( query: value, movies: controller.fullRecommendedForYou);
                  },
                  style: Styles.h1.copyWith(fontSize: kDimens20) ,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: const Icon(Icons.search, color: kWhite,),
                    hintText: I18n.of(context).sSearchBarHint,
                    hintStyle: Styles.p1.copyWith(color: kWhite)
                  ),
                );
              }
            ),
          ),
        ),
        SizedBox(height: responsive.hp(kDimens3),)
      ],
    );
  }
}
