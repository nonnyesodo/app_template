import 'package:medical_app/core/config/page_route/route_name.dart';
import 'package:medical_app/features/auth/presentation/pages/auth_page.dart';
import 'package:medical_app/features/auth/presentation/pages/signup_page.dart';
import 'package:medical_app/features/home/data/model/doctor_model.dart';
import 'package:medical_app/features/home/presentation/pages/bottom_nav.dart';
import 'package:medical_app/features/home/presentation/pages/doctor_detail.dart';
import 'package:medical_app/features/splash_onboard/presentation/pages/splash_screen.dart';
import 'package:medical_app/global_widget/export.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class AppRoute {
  // GoRouter configuration
  static final router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: '/',
    routes: [
      GoRoute(
          path: RouteName.splash.path,
          builder: (context, state) {
            return SplashScreen();
          }),
      GoRoute(
          path: RouteName.auth.path,
          builder: (context, state) {
            return AuthPage();
          }),
      GoRoute(
          path: RouteName.login.path,
          builder: (context, state) {
            return SignupPage();
          }),
      GoRoute(
          path: RouteName.botomNav.path,
          builder: (context, state) {
            return BottomNav();
          }),
      GoRoute(
          path: RouteName.doctoctDetail.path,
          builder: (context, state) {
            final DoctorModel doctor = state.extra as DoctorModel;
            return DoctorDetailPage(doctor: doctor);
          }),
    ],
  );
}
