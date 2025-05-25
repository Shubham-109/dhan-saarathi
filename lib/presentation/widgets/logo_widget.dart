import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';
import '../../core/constants/app_constants.dart';

class AppLogoWidget extends StatelessWidget {
  final double width;
  const AppLogoWidget({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return Center(child: SvgPicture.asset(AppConstants.appLogoIconLarge, fit: BoxFit.cover, width: width, height: (width * .66)));
  }
}
