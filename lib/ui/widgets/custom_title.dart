import 'package:flutter/material.dart';
import 'package:movies_app/generated/l10n.dart';
import 'package:movies_app/ui/utils/constants/constants.dart';
import 'package:movies_app/ui/utils/styles/styles.dart';

class CustomTitle extends StatelessWidget {
  final String title;
  final Function() onPressed;
  const CustomTitle({
    required this.title,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Styles.h1,),
        TextButton(
          onPressed: onPressed,
          child: Text(
            I18n.of(context).sSeeAll, 
            style: Styles.h1.copyWith(color:kLigthGray),
          )
        )
      ],
    );
  }
}