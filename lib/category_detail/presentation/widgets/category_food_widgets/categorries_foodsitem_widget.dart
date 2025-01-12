import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// import "package:mvvm_117 /utils/AppColors.dart";
import 'package:flutter/material.dart';

class CategoriesItem extends StatelessWidget {
  const CategoriesItem({
    super.key,
    required this.image,
    required this.title,
    required this.desc,
    required this.time,
  });

  final String title, image, desc, time;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 168,
        height: 226,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 153,
                height: 100,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(14),
                    bottomRight: Radius.circular(14),
                  ),
                  border: Border(
                    left: BorderSide(color: AppColors.RedPinkMain),
                    right: BorderSide(color: AppColors.RedPinkMain),
                    bottom: BorderSide(color: AppColors.RedPinkMain),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          color: AppColors.TextsColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 12),
                    ),
                    Text(
                      desc,
                      maxLines: 2,
                      style: const TextStyle(
                        color: AppColors.TextsColor,
                        fontWeight: FontWeight.w300,
                        fontSize: 13,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Text(
                              "5",
                              style: TextStyle(
                                  color: AppColors.RatingColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12),
                            ),
                            const SizedBox(width: 4),
                            SvgPicture.asset("assets/svg/star.svg"),
                          ],
                        ),
                        Row(
                          children: [
                            SvgPicture.asset("assets/svg/clock.svg"),
                            const SizedBox(width: 4),
                            Text(
                              time,
                              style: const TextStyle(
                                  color: AppColors.RatingColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image(
                  image: NetworkImage(image),
                  width: 169,
                  height: 153,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 7,
              right: 8,
              child: Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: AppColors.Pink,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Center(
                  child: SvgPicture.asset("assets/svg/heart.svg"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AppColors {
  static const Color BackgroundColor = Color(0xFF221D22);
  static const Color RedPinkMain = Color(0xFFFD5D69);
  static const Color Pink = Color(0xFFFFC6C9);
  static const Color TextsColor = Color(0xFF3E2823);
  static const Color RatingColor = Color(0xFFEC888D);
}
