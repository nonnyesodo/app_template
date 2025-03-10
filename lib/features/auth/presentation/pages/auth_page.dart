import 'package:medical_app/core/config/page_route/route_name.dart';
import 'package:medical_app/core/res/theme/assets.dart';
import 'package:medical_app/core/utils/extension.dart';
import 'package:medical_app/global_widget/export.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
        backgroundColor: AppColors.white,
        body: Column(
          children: [
            Expanded(
                child: Stack(
              children: [
                Container(
                    padding: EdgeInsets.only(top: size.width * 0.5),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(AppAssets.background),
                            fit: BoxFit.cover))),
                Positioned(
                    top: -5, child: AppAssets.auth.svg(fit: BoxFit.cover))
              ],
            )),
            Expanded(
                child: Container(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              color: AppColors.white,
              child: Column(
                spacing: size.width * 0.04,
                children: [
                  30.verticalSpace,
                  Appbutton(
                    label: 'Get Started',
                    onTap: () => context.push(RouteName.login.path),
                  ),
                  OauthWidget(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppExoText(text: 'Already have an account? '),
                      AppExoText(
                        text: 'Log in',
                        fontWeight: FontWeight.w700,
                        color: AppColors.green,
                      ),
                    ],
                  )
                ],
              ),
            )),
          ],
        ));
  }
}

class OauthWidget extends StatelessWidget {
  const OauthWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Column(
      spacing: size.width * 0.05,
      children: [
        AppExoText(text: 'OR'),
        Appbutton(
            border: true,
            borderColor: AppColors.black,
            buttonColor: Colors.transparent,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              AppAssets.google.svg(),
              10.horizontalSpace,
              AppExoText(
                  text: 'Sign up with Google',
                  fontWeight: FontWeight.w700,
                  fontSize: 16)
            ])),
        Appbutton(
            border: true,
            borderColor: AppColors.black,
            buttonColor: Colors.transparent,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(Icons.apple, size: 35.sp),
              10.horizontalSpace,
              AppExoText(
                  text: 'Sign up with Apple',
                  fontWeight: FontWeight.w700,
                  fontSize: 16)
            ])),
        10.verticalSpace,
      ],
    );
  }
}
