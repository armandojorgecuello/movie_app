import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movies_app/generated/l10n.dart';
import 'package:movies_app/ui/utils/constants/constants.dart';
import 'package:movies_app/ui/utils/responsive.dart';
import 'package:movies_app/ui/utils/styles/styles.dart';

class CustomWatchButtonAndRatingBar extends StatelessWidget {
  const CustomWatchButtonAndRatingBar({
    Key? key,
    required this.padding,
    required this.movieHasVideo,
    required this.responsive,
  }) : super(key: key);

  final EdgeInsets padding;
  final bool movieHasVideo;
  final Responsive responsive;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        children: [
          GestureDetector(
            onTap: movieHasVideo ? (){
              print(movieHasVideo);
            } : null,
            child: SizedBox(
              width: responsive.wp(kDimens40),
              child: PhysicalModel(
                borderRadius: BorderRadius.circular(kDimens30),
                color: kGray,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: kDimens20, vertical: kDimens10),
                  child: Center(child: Text(I18n.of(context).sWatchNow, style: Styles.h1,)),
                ),
              ),
            ),
          ),
          const Spacer(),
          SizedBox(
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
    );
  }
}

