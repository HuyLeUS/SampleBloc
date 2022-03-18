import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:sample_bloc/bloc/first_bloc_bloc.dart';
import 'package:sample_bloc/bloc/second_bloc.dart';
import 'package:sample_bloc/common/theme.dart';
import 'package:sample_bloc/presentation/pages/first_page.dart';
import 'package:sample_bloc/presentation/pages/second_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FirstBloc>(
          create: (context) => FirstBloc(),
        ),
        BlocProvider<SecondBloc>(
          create: (context) => SecondBloc(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: AppTheme.lightTheme,
        initialRoute: "/",
        routes: {
          '/': (context) => const FirstPage(),
          '/second': (context) => const SecondPage()
        },
      ),
    );
  }
}
