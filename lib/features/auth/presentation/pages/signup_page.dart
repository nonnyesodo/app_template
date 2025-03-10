import 'package:medical_app/core/config/page_route/route_name.dart';
import 'package:medical_app/core/res/theme/assets.dart';
import 'package:medical_app/core/utils/extension.dart';
import 'package:medical_app/features/auth/presentation/bloc/cubit/auth_cubit.dart';
import 'package:medical_app/global_widget/export.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final watchAuth = context.watch<AuthCubit>();
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoginState) {
          context.go(RouteName.botomNav.path);
        }
      },
      child: Opacity(
        opacity: watchAuth.state is AuthLoading ? 0.4 : 1.0,
        child: AbsorbPointer(
          absorbing: watchAuth.state is AuthLoading,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AppAssets.background),
                      fit: BoxFit.cover)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.all(size.width * 0.04),
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(30.r))),
                    child: Form(
                      key: formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            5.verticalSpace,
                            Center(
                                child: AppExoText(
                                    text: 'Login',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20)),
                            10.verticalSpace,
                            AppExoText(
                                text: 'Welcome back!',
                                color: AppColors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                            10.verticalSpace,
                            ApptextField(
                                title: 'FullName',
                                controller: watchAuth.fullNameController,
                                keyboardType: TextInputType.emailAddress,
                                validator: (v) => v?.validateName()),
                            20.verticalSpace,
                            ApptextField(
                                title: 'Email Address',
                                controller: watchAuth.emailController,
                                keyboardType: TextInputType.emailAddress,
                                validator: (v) => v?.validateEmail()),
                            20.verticalSpace,
                            ApptextField(
                                title: 'Password',
                                controller: watchAuth.passwordController,
                                keyboardType: TextInputType.name,
                                validator: (v) => v?.validatePassword()),
                            20.verticalSpace,
                            Appbutton(
                                isLoading: watchAuth.state is AuthLoading,
                                onTap: () {
                                  if (formKey.currentState?.validate() ??
                                      false) {
                                    context.read<AuthCubit>().login();
                                  }
                                },
                                label: 'Login'),
                            20.verticalSpace,
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
