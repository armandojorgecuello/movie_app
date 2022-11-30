import 'package:flutter/material.dart';
import 'package:movies_app/ui/utils/constants/constants.dart';
import 'package:movies_app/ui/utils/styles/styles.dart';

class CustomMovieTitle extends StatelessWidget {
  const CustomMovieTitle({
    Key? key,
    required this.padding,
    required this.movieTitle,
  }) : super(key: key);

  final EdgeInsets padding;
  final String movieTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        children: [
          Expanded(child: Text(movieTitle, style: Styles.appBarTitleStyle,)),
          const Icon(Icons.four_k_outlined, size: kDimens30, color: kLigthGray,)
        ],
      ),
    );
  }
}

