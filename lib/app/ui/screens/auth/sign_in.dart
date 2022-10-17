import 'package:flutter/material.dart';
import 'package:nursey/app/bloc/bloc.dart';
import 'package:nursey/app/ui/screens/home.dart';
import 'package:nursey/app/ui/widgets/widgets.dart';
import 'package:nursey/app/utils/design/design.dart';
import 'package:nursey/app/utils/extensions/extensions.dart';
import 'package:nursey/configs/packages.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        switch (state.status) {
          case AuthStatus.authenticated:
            context.read<NurseBloc>().add(GetNurse(id: state.user?.uid ?? ''));
            context.pushReplacement(HomeScreen.route());
            break;
          case AuthStatus.error:
            context.showErrorToast(
                title: 'Sign In Error', message: state.exception ?? '');
            break;
          case AuthStatus.loading:
            break;
          default:
            break;
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: AppBg(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    const AppIllustration(AppIllustrations.nurse01Gif),
                    const SizedBox(height: 35),
                    Spring.fadeIn(
                      child: Text(
                        'WELCOME BACK,\n to  Nursey!',
                        style: GoogleFonts.nunito(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryAccent,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    AppSignInFormFields(
                      passwordController: passwordController,
                      emailController: emailController,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AppSignInFormFields extends StatefulWidget {
  const AppSignInFormFields(
      {required this.passwordController,
      required this.emailController,
      Key? key})
      : super(key: key);
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  State<AppSignInFormFields> createState() => _AppSignInFormFieldsState();
}

class _AppSignInFormFieldsState extends State<AppSignInFormFields> {
  bool obscurePassword = true;
  bool isBusy = false;
  final SpringController springController = SpringController();

  @override
  void initState() {
    springController.play();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //INFO:for test purposes only
    widget.emailController.text = 'musa.damu@gmail.com';
    widget.passwordController.text = '123456789';
    return Form(
        child: Spring.slide(
      child: Column(children: [
        const SizedBox(height: 35),
        AppFormField(
          controller: widget.emailController,
          hint: 'Email',
        ),
        const SizedBox(height: 30),
        AppFormField(
          controller: widget.passwordController,
          hint: 'Password',
          isPassword: true,
          obscure: obscurePassword,
          onVisibilityChanged: () {
            setState(() {
              obscurePassword = !obscurePassword;
            });
          },
        ),
        const SizedBox(height: 70),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppSecondaryButton(
              width: 100,
              isBusy: isBusy,
              title: 'Mock',
              onPressed: () => context.read<AuthBloc>().add(const AuthSignIn(
                  email: 'aliya.mahim@nursey.com', password: '123456789')),
            ),
            AppPrimaryButton(
              width: 250,
              title: 'Sign In',
              onPressed: () => context.read<AuthBloc>().add(
                    AuthSignIn(
                        email: widget.emailController.text,
                        password: widget.passwordController.text),
                  ),
            ),
          ],
        ),
      ]),
      slideType: SlideType.slide_in_bottom,
    ));
  }
}
