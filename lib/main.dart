import 'dart:io';

import 'package:chat_app_c11/core/cache/shared_preferences_utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'config/routes/route_generator.dart';
import 'config/routes/routes.dart';
import 'core/di/di.dart';
import 'core/utils/my_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesUtils.init();
  configureDependencies();
  Bloc.observer = MyBlocObserver();

  runApp(MyApp());

  try {
    if (Platform.isAndroid) {
      await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: 'AIzaSyA7ssttg34QPxoAMcjDJFJql0FcFnLYKj8',
              appId: 'com.example.chat_app_c11',
              messagingSenderId: '260190022044',
              projectId: 'chat-app-c11'));
    } else {
      await Firebase.initializeApp();
    }
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
              initialRoute: Routes.loginIn,
              onGenerateRoute: RouteGenerator.getRoute,
            ));
  }
}
