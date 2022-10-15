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
  bool isBusy = false;

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
            setState(() {
              isBusy = false;
            });
            context.showErrorToast(
                title: 'Sign In Error', message: state.exception ?? '');
            break;
          case AuthStatus.loading:
            setState(() {
              isBusy = true;
            });
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
                    Text(
                      'WELCOME BACK,\n to  Nursey!',
                      style: GoogleFonts.nunito(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryAccent,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 35),
                    AppFormField(
                      controller: emailController,
                      hint: 'Email',
                    ),
                    const SizedBox(height: 30),
                    AppFormField(
                      controller: passwordController,
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
                          onPressed: () => context.read<AuthBloc>().add(
                              const AuthSignIn(
                                  email: 'aliya.mahim@nursey.com',
                                  password: '123456789')),
                        ),
                        AppPrimaryButton(
                          width: 250,
                          title: 'Sign In',
                          onPressed: () => context.read<AuthBloc>().add(
                                AuthSignIn(
                                    email: emailController.text,
                                    password: passwordController.text),
                              ),
                        ),
                      ],
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
