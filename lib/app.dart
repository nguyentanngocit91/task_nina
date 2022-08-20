import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_nina/modules/dashboard/cubits/locale_cubit/locale_cubit.dart';
import 'package:task_nina/modules/dashboard/screens/home_screen/home_screen.dart';
import 'config/routes/app_router.dart';
import 'modules/dashboard/cubits/theme_cubit/theme_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';



class MyApp extends StatelessWidget {
  final SharedPreferences sharedPreferences;
  final AppRouter appRouter;

   MyApp({Key? key,
    required this.sharedPreferences,
    required  this.appRouter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(create: (themeCubitContext) => ThemeCubit(sharedPreferences),),

        BlocProvider(create: (localeCubitContext) => LocaleCubit(sharedPreferences),),

      ],
      child: MainApp(appRouter: appRouter),
    );
  }
}

class MainApp extends StatefulWidget {
  final AppRouter appRouter;

   MainApp({Key? key,
     required this.appRouter,
   }) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      title: "Task Nina",
      supportedLocales: AppLocalizations.supportedLocales,
      locale: context.select((LocaleCubit localeCubit) => localeCubit.state.locale),
      debugShowCheckedModeBanner: false,
      theme: context.select((ThemeCubit themeCubit) => themeCubit.state.theme),
      onGenerateRoute: widget.appRouter.onGenerateRoute,
      home: HomeScreen(),
     /* home: BlocBuilder<ThemeCubit, ThemeState>(
       builder: (context, state) {
         return HomeScreen();
       },
      )*/
    );
  }
}
