import 'package:flutter/material.dart';

import 'app/nursey_app.dart';
import 'configs/configs.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const NurseyApp());
}
