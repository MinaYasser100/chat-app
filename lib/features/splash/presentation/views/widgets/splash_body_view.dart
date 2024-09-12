import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chat_app/core/constant/color/app_colors.dart';
import 'package:chat_app/core/constant/styles/styles.dart';
import 'package:flutter/material.dart';

class SplashBodyView extends StatelessWidget {
  const SplashBodyView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: CircleAvatar(
              radius: 104,
              backgroundColor: AppColors.primaryColor,
              child: CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage('assets/images/chat.jpg'),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                'استمتع الان بالحديث مع اصدقائك عبر هذا البرنامج',
                textStyle: Styles.textStyle24White,
                textAlign: TextAlign.center,
                speed: const Duration(milliseconds: 80),
              ),
            ],
            totalRepeatCount: 1,
            displayFullTextOnTap: true,
            stopPauseOnTap: true,
          )
        ],
      ),
    );
  }
}
