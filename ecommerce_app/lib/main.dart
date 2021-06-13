import 'package:ecommerce_app/screens/home/home_screen.dart';
import 'package:ecommerce_app/screens/sign_in/sign_in_screen.dart';
import 'package:ecommerce_app/screens/sign_up/sign_up_screen.dart';
import 'package:ecommerce_app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/routes.dart';
import 'package:ecommerce_app/screens/splash/splash_screen.dart';
import 'package:ecommerce_app/theme.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_app/size_config.dart';

void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: theme(),
//       // home: SplashScreen(),
//       // We use routeName so that we dont need to remember the name
//       initialRoute: SplashScreen.routeName,
//       routes: routes,
//     );
//   }
// }

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService _authService = AuthService();
  @override
  void initState() {
    _authService.getSavedToken();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   
    return ChangeNotifierProvider.value(
      value: _authService,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: theme(),
        home: Consumer<AuthService>(
          builder: (context, snapshot, _) {
            switch (snapshot.status) {
              case LoginStatus.loggedIn:
                return HomeScreen();
              case LoginStatus.idle:
                return SignInScreen();
              default:
                return Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
            }
          },
        ),
        initialRoute: SplashScreen.routeName,
        routes: routes,
      ),
    );
  }
}
