import 'package:chat_app_c11/core/cache/shared_preferences_utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'config/routes/route_generator.dart';
import 'config/routes/routes.dart';
import 'core/di/di.dart';
import 'core/utils/my_bloc_observer.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesUtils.init();
  configureDependencies();
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    // if (Platform.isAndroid) {
    //   await Firebase.initializeApp(
    //       options: const FirebaseOptions(
    //           apiKey: 'AIzaSyCyb5kh10tTsL-mbMWmwX6_cv8avZf3YBI',
    //           appId: 'com.example.chat_app_c11',
    //           messagingSenderId: '725999559661',
    //           projectId: 'todo-app-c11-7502b'));
    // } else {
    //   await Firebase.initializeApp();
    // }
  } catch (e) {
    print(e.toString());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        designSize: const Size(375, 812),
        splitScreenMode: true,
        builder: (context, child) => MaterialApp(
              debugShowCheckedModeBanner: false,
              home: child,
              initialRoute: Routes.signUp,
              onGenerateRoute: RouteGenerator.getRoute,
            ));
  }
}
