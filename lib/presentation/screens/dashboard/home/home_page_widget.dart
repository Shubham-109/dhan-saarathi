import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart' show SvgPicture;
import '../../../../core/index.dart';

class HomeScreen extends StatelessWidget {
  final Function toggleDrawer;
  const HomeScreen({super.key, required this.toggleDrawer});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: Theme.of(context).colorScheme.onSecondary, width: .1),
                bottom: BorderSide(color: Theme.of(context).colorScheme.onSecondary, width: .1),
              ),
            ),
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(AppConstants.appLogoIconSmall, fit: BoxFit.cover, width: 27, height: 27),
                IconButton(onPressed: () => toggleDrawer(), icon: Icon(Icons.menu_rounded, size: 30)),
              ],
            ),
          ),
          SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text('Welcome,', style: TextStyles.textStyle_24_400.copyWith(color: Theme.of(context).colorScheme.onPrimary)),
            ),
          ),
          SizedBox(width: MediaQuery.sizeOf(context).width * .6, child: SvgPicture.asset(AppConstants.welcomeIcon)),
        ],
      ),
    );
  }
}
