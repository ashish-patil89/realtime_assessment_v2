import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:realtime_assessment_v2/screens/calender/calender_cubit.dart';
import 'package:realtime_assessment_v2/screens/screens.dart';
import 'package:realtime_assessment_v2/src/gen/l10n/app_localizations.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => EmployeeCubit()),
        BlocProvider(create: (_) => CalendarCubit()),
      ],
      child: MaterialApp(
        title: 'Employee Manager',
        theme: ThemeData(primarySwatch: Colors.blue),
        locale: Locale('en'),
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [Locale('en')],
        debugShowCheckedModeBanner: false,

        home: HomeScreen(),
      ),
    );
  }
}
