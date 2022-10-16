import 'package:flutter/material.dart';
import 'package:nursey/app/ui/screens/auth/auth.dart';
import 'package:nursey/app/utils/design/colors.dart';
import 'package:nursey/app/utils/design/design.dart';
import 'package:nursey/configs/configs.dart';

import 'bloc/bloc.dart';
import 'repository/repository.dart';
import 'services/services.dart';

///This is the Main Entry to The Nursey App
class NurseyApp extends StatelessWidget {
  const NurseyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthRepository(AuthService()),
        ),
        RepositoryProvider(
          create: (context) => ShiftRepository(ShiftService()),
        ),
        RepositoryProvider(
          create: (context) => TaskRepository(TaskService()),
        ),
        RepositoryProvider(
          create: (context) => NurseRepository(NurseService()),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(context.read<AuthRepository>()),
          ),
          BlocProvider<NurseBloc>(
            create: (context) => NurseBloc(context.read<NurseRepository>()),
          ),
          BlocProvider<ShiftBloc>(
            create: (context) => ShiftBloc(context.read<ShiftRepository>()),
          ),
          BlocProvider<TaskBloc>(
            create: (context) => TaskBloc(context.read<TaskRepository>()),
          ),
        ],
        child: MaterialApp(
          title: 'Nursey',
          theme: ThemeData(
              // AppColors.primaryAccent,
              scaffoldBackgroundColor: AppColors.primaryBg,
              primarySwatch: Colors.purple,
              appBarTheme: const AppBarTheme(
                  backgroundColor: AppColors.primaryAccent, elevation: 1)),
          home: const AppInitialScreen(),
          // WidgetBuilder(
          //   builder: (context) {
          //     ScreenUtil.setScreenRatio(MediaQuery.of(context));
          //     return
          //
          //     // return BlocBuilder<AuthBloc, AuthState>(
          //     //   builder: (context, state) {
          //     //     if (state is AuthInitial) {
          //     //       return const AuthScreen();
          //     //     } else if (state is AuthLoading) {
          //     //       return const Scaffold(
          //     //         body: Center(
          //     //           child: CircularProgressIndicator(),
          //     //         ),
          //     //       );
          //     //     } else if (state is AuthSuccess) {
          //     //       return const AuthScreen();
          //     //     } else if (state is AuthFailure) {
          //     //       return const AuthScreen();
          //     //     } else {
          //     //       return const AuthScreen();
          //     //     }
          //     //   },
          //     // );
          //   },
          // ),
        ),
      ),
    );
  }
}

class AppInitialScreen extends StatelessWidget {
  const AppInitialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO: check auth state and route to appropriate screen
    // return BlocBuilder<AuthBloc, AuthState>(
    //   builder: (context, state) {
    //     if (state is AuthInitial) {
    //       return const AuthScreen();
    //     } else if (state is AuthLoading) {
    //       return const Scaffold(
    //         body: Center(
    //           child: CircularProgressIndicator(),
    //         ),
    //       );
    //     } else if (state is AuthSuccess) {
    //       return const AuthScreen();
    //     } else if (state is AuthFailure) {
    //       return const AuthScreen();
    //     } else {
    //       return const AuthScreen();
    //     }
    //   },
    // );
    ScreenUtil.setScreenRatio(MediaQuery.of(context));

    return const SignInScreen();
  }
}
