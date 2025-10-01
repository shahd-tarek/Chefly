import 'package:chefly/constants.dart';
import 'package:chefly/core/utils/app_router.dart';
import 'package:chefly/core/utils/styles.dart';
import 'package:chefly/core/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset("assets/images/Picture.png", fit: BoxFit.cover),
        ),
        SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                Text(
                  "Let’s",
                  style: Styles.textStyle64.copyWith(color: Colors.white),
                ),
                Text(
                  "Cooking",
                  style: Styles.textStyle64.copyWith(color: Colors.white),
                ),
                Text(
                  "Find best recipes for cooking",
                  style: TextStyle(color: Color(0xffF9F9F9), fontSize: 20),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(bottom: 60),
                  child: CustomButton(
                    backgroundColor: kPrimaryColor,
                    textColor: Colors.white,
                    text: "Start Cooking",
                    onPressed: () {
                      GoRouter.of(context).push(AppRouter.kHomeView);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
