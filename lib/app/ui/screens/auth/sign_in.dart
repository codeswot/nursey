import 'package:flutter/material.dart';
import 'package:nursey/app/bloc/auth/auth_bloc.dart';
import 'package:nursey/app/bloc/bloc.dart';
import 'package:nursey/app/ui/screens/home.dart';
import 'package:nursey/app/ui/widgets/widgets.dart';
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

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        switch (state.status) {
          case AuthStatus.authenticated:
            context.pop();
            //
            context.read<NurseBloc>().add(GetNurse(id: state.user?.uid ?? ''));
            context.pushReplacement(HomeScreen.route());
            break;
          case AuthStatus.error:
            context.pop();
            context.showErrorToast(
                title: 'Sign In Error', message: state.exception ?? '');
            break;
          case AuthStatus.loading:
            context.showAppDialog(context,
                canDismiss: false, widget: const LoadingDialog());
            break;
          default:
            break;
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  AppFormField(
                    controller: emailController,
                  ),
                  const SizedBox(height: 50),
                  AppFormField(
                    controller: passwordController,
                  ),
                  const SizedBox(height: 100),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppPrimaryButton(
                        title: 'Sign In',
                        onPressed: () => context.read<AuthBloc>().add(
                            AuthSignIn(
                                email: emailController.text,
                                password: passwordController.text)),
                      ),
                      AppPrimaryButton(
                        title: 'Mock SignIn',
                        onPressed: () => context.read<AuthBloc>().add(
                            const AuthSignIn(
                                email: 'aliya.mahim@nursey.com',
                                password: '123456789')),
                      ),
                    ],
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
