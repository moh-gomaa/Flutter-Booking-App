import 'package:booking_app/core/bottom_navigation/pages/main_screen.dart';
import 'package:booking_app/core/connectivity/cubit/connectivity_cubit.dart';
import 'package:booking_app/core/connectivity/pages/connectivity_Screen.dart';
import 'package:booking_app/core/localization/cubit/locale_cubit.dart';
import 'package:booking_app/core/localization/setup/app_localizations_setup.dart';
import 'package:booking_app/core/main_blocs/blocs.dart';
import 'package:booking_app/core/main_blocs/providers.dart';
import 'package:booking_app/core/utils/routes/app_router.dart';
import 'package:booking_app/data/models/basic_model.dart';
import 'package:booking_app/features/language/pages/lang_screen.dart';
import 'package:booking_app/features/onboarding/pages/onboarding_screen.dart';
import 'package:booking_app/resources/constants/constants.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'resources/themes/theme.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await BasicModel.init();
  runApp(MyApp(
    connectivity: Connectivity(),
  ));
}

class MyApp extends StatelessWidget {
  final Connectivity connectivity;

  const MyApp({Key? key, required this.connectivity}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: BlocProviders.providers,
      child: BlocBuilder<LocaleCubit, ChangeLocaleState>(
        builder: (context, state) {
          // print('state.locale==${state.locale}' );
          return Sizer(
            builder: (BuildContext context, Orientation orientation,
                DeviceType deviceType) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Booking App',
                theme: ownThemeData,
                onGenerateRoute: AppRouter.onGenerateRoute,
                locale: state.locale,
                supportedLocales: AppLocalizationsSetup.supportedLocales,
                localizationsDelegates:
                    AppLocalizationsSetup.localizationsDelegates,
                localeResolutionCallback:
                    AppLocalizationsSetup.localeResolutionCallback,
                home: BlocBuilder<ConnectivityCubit, ConnectivityState>(
                    builder: (context, state) {
                  if (state is InternetConnected) {
                    if(lang == '')
                      return LangScreen();
                    else if(BasicModel.isLogin)
                      return MainScreen();
                    else
                      return OnBoardScreen();

                  } else if (state is InternetDisconnected) {
                    return ConnectivityScreen();
                  }
                  return CircularProgressIndicator();
                }),
              );
            },
          );
        },
      ),
    );
  }
}
