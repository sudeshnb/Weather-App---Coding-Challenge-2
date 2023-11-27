import 'package:flutter/material.dart';
import 'package:weather_app/src/core/constants/constants.dart';

class AppDecoration {
  static BoxDecoration get scroll => BoxDecoration(
        gradient: LinearGradient(
          end: Alignment.bottomCenter,
          begin: Alignment.topCenter,
          colors: [
            const Color(0xFF301D5C),
            const Color(0xFF391A49).withOpacity(0),
          ],
        ),
      );

  static BoxDecoration get background => BoxDecoration(
        gradient: LinearGradient(
          colors: AppColor.background,
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      );
  static BoxDecoration withImage(ImageProvider? image) => BoxDecoration(
        color: AppColor.black,
        image: image != null
            ? DecorationImage(image: image, fit: BoxFit.cover)
            : null,
      );
  static BoxDecoration get previewCard => BoxDecoration(
        color: AppColor.card.withOpacity(0.2),
        borderRadius: BorderRadius.circular(24.0),
      );
  static BoxDecoration get previewDismissCard => BoxDecoration(
        color: AppColor.red,
        // backgroundBlendMode: BlendMode.clear,
        borderRadius: BorderRadius.circular(24.0),
      );
  static BoxDecoration get bottomSheet => BoxDecoration(
        borderRadius: BorderRadius.circular(24.0),
        gradient: LinearGradient(
          colors: AppColor.background,
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      );
}
