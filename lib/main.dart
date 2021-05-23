
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider/ui/views/dashboard_screen.dart';
import 'package:flutter_provider/ui/views/registration_screen.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';

import 'business_logic/providers/dashboard_provider.dart';
import 'business_logic/providers/provider_state.dart';
import 'business_logic/utils/app_colors.dart';
import 'business_logic/utils/navigation_service.dart';
import 'business_logic/utils/route_constant.dart';
import 'ui/views/login_screen.dart';
import 'ui/views/splash_screen.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  runApp(
      MultiProvider(providers:[ChangeNotifierProvider(create:(_)=>ProviderState())],
        child: MyApp(),
      )
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool _initialized = false;
  bool _error = false;

  void initializeFlutterFire() async {
    try {
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch(e) {
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      useDefaultLoading: false,
      overlayColor: Colors.white12,
      overlayOpacity: 1,
      overlayWidget: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.themeLightGreen),
          )
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Auth Provider',
        initialRoute: splashRoute,
        navigatorKey: NavigationService().navigationKey,
        onGenerateRoute: _onGenerateRoute,
        theme: ThemeData(
            accentColor: AppColors.themeGreenColor,
            fontFamily: 'Gilroy',
            textSelectionTheme:
            TextSelectionThemeData(cursorColor: AppColors.themeGreenColor),
            hintColor: AppColors.hintColor,
            primaryColor: AppColors.themeGreenColor,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            buttonTheme: ButtonThemeData(
                buttonColor: AppColors.themeGreenColor,
                minWidth: double.infinity),
            buttonColor: AppColors.themeGreenColor),
      ),
    );
  }

  Route _onGenerateRoute(RouteSettings settings) {

    switch(settings.name){
      case splashRoute:
        return MaterialPageRoute(builder: (_)=>SplashScreen());
        break;
      case registrationRoute:
        return MaterialPageRoute(builder: (_)=>ProviderRegistration());
        break;
      case loginRoute:
        return MaterialPageRoute(builder: (_)=>ProviderLogin());
        break;
      case dashboardRoute:
        return MaterialPageRoute(builder: (_)=>ChangeNotifierProvider(
            create: (context) => DashBoardProvider(),
            child: ProviderDashboard()));
      default:
        return MaterialPageRoute(builder: (_)=>SplashScreen());
    }
  }
}

