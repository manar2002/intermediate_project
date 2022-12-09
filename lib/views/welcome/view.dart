import 'package:flutter/material.dart';
import 'package:nodaliza_store/constants.dart';
import 'package:nodaliza_store/core/app_router/app_router.dart';
import 'package:nodaliza_store/views/login/view.dart';
import 'package:nodaliza_store/views/sign_up/view.dart';
import 'package:nodaliza_store/widgets/confirm_button.dart';
import 'package:nodaliza_store/widgets/my_text.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(getAsset('sc'),width: double.infinity,),
            const MyText(
              verticalMargin: 30,
              horizontalMargin: 20,
              data: 'Get your outfit\nwith BlzSS',
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            ConfirmButton(
              verticalMargin: 10,
              horizontalMargin: 20,
              title: 'Log in',
              onPressed: () => AppRouter.navigateAndPopAll(context, const LoginView()),
            ),
            ConfirmButton(
              verticalMargin: 10,
              horizontalMargin: 20,
              title: 'Create an account',
              backgroundColor: Colors.transparent,
              titleColor: kPrimaryColor,
              onPressed: () => AppRouter.navigateAndPopAll(context, const SignUpView()),
            ),
          ],
        ),
      ]),
    );
  }
}
