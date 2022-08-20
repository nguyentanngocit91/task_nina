import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app.dart';
import 'config/routes/app_router.dart';
import 'modules/dashboard/debug/app_bloc_observer.dart';



Future<void> main()  async{
    WidgetsFlutterBinding.ensureInitialized();
      SharedPreferences preferences= await SharedPreferences.getInstance();
    Bloc.observer = AppBlocObserver();
    runApp(  MyApp(
      sharedPreferences:preferences,
      appRouter: AppRouter(),

    ));
  }





