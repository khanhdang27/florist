import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:florist/blocs/blocs.dart';
import 'package:florist/configs/configs.dart';
import 'package:florist/library/shared_preferences.dart';

class App extends StatefulWidget {

  static void setLocale(BuildContext context, Locale locale){
    _AppState state = context.findAncestorStateOfType<_AppState>();
    state.setLocale(locale);
  }

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  String token = SharedPrefs.getToken() ?? '';
  bool rememberMe = SharedPrefs.getRememberMe() ?? false;
  Locale _locale;

  void setLocale(Locale locale){
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      setState(() {
        this._locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    return MultiBlocProvider(
      providers: AppBloc.providers,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'James Wong Florist',
          theme: ThemeData(fontFamily: AppFont.fPingFangSC),

          initialRoute: token != '' && rememberMe? AppRoute.home: AppRoute.login,
          onGenerateRoute: AppRoute().generateRoute,
          locale: _locale,
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            Locale('zh'),
            Locale('zh', 'CN'),
            Locale('en')
          ],
          localeResolutionCallback: (deviceLocale, supportedLocales){
            for(var locale in supportedLocales){
              if(locale.languageCode == deviceLocale.languageCode &&
                  locale.countryCode == deviceLocale.countryCode){
                return deviceLocale;
              }
            }
            return supportedLocales.first;
          }

      ),
    );
  }
}
