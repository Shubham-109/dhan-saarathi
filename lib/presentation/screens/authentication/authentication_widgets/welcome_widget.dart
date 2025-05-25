import 'package:flutter/material.dart';
import 'package:khazana/core/index.dart';
import 'package:khazana/presentation/widgets/logo_widget.dart';

class WelcomeScreen extends StatelessWidget {
  final VoidCallback callback;
  const WelcomeScreen({super.key, required this.callback});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppLogoWidget(width: MediaQuery.sizeOf(context).width * .6),
              const SizedBox(height: 45),
              Text("Welcome to\n${AppConstants.appName} !", textAlign: TextAlign.center, style: TextStyles.textStyle_32_400),
            ],
          ),
        ),
        Positioned(
          left: 24,
          right: 24,
          bottom: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("One step closer to smarter\ninvesting. Let’s begin!", style: TextStyles.textStyle_14_400),
              FloatingActionButton(
                backgroundColor: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1000)),
                onPressed: () => callback(),
                child: Icon(Icons.arrow_forward, size: 25, color: Theme.of(context).colorScheme.onPrimary),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
