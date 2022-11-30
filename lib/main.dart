
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:movies_app/core/bindings/main_bindings.dart';
import 'package:movies_app/generated/l10n.dart';
import 'package:movies_app/ui/utils/constants/routes.dart';
import 'package:movies_app/ui/utils/movie_app_navigation/movie_app_screens.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Movie App',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        localizationsDelegates: const [
          I18n.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: I18n.delegate.supportedLocales,
        initialRoute: kSplash,
        getPages: MovieAppScreens.pages,
        initialBinding: MainBinding(),
    );
  }
}
