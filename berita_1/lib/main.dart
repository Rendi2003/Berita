import 'package:berita_1/routes/route_names.dart';
import 'package:berita_1/views/login_screen.dart';
import 'package:berita_1/views/widgets/home_screen.dart';
import 'package:berita_1/views/widgets/onboarding_screen.dart';
import 'package:berita_1/views/widgets/register_screen.dart';
import 'package:berita_1/views/widgets/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'views/utils/helper.dart' as helper;

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  initialLocation: RouteName.splash,
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: RouteName.splash,
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: '/introduction',
      name: RouteName.introduction,
      builder: (BuildContext context, GoRouterState state) {
        return const OnboardingScreen();
      },
    ),
    GoRoute(
      path: '/login',
      name: RouteName.login,
      builder: (BuildContext context, GoRouterState state) {
        return const LoginScreen();
      },
    ),
    GoRoute(
      path: '/register',
      name: RouteName.register,
      builder: (BuildContext context, GoRouterState state) {
        return const RegisterScreen();
      },
    ),
    GoRoute(
      path: '/home',
      name: RouteName.home,
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Text('Halaman tidak ditemukan: ${state.error}'),
    ),
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Aplikasi Berita Anda',
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
      theme: ThemeData(
        primaryColor: helper.cPrimary,
        colorScheme: ColorScheme.fromSeed(
          seedColor: helper.cPrimary,
          primary: helper.cPrimary,
          secondary: helper.cTextBlue,
        ),
        scaffoldBackgroundColor: helper.cWhite,
        appBarTheme: AppBarTheme(
          backgroundColor: helper.cPrimary,
          foregroundColor: helper.cWhite,
          elevation: 4.0,
          titleTextStyle: helper.headline4.copyWith(color: helper.cWhite),
        ),
        textTheme: TextTheme(
          displayLarge: helper.headline1.copyWith(color: helper.cBlack),
          displayMedium: helper.headline2.copyWith(color: helper.cBlack),
          displaySmall: helper.headline3.copyWith(color: helper.cBlack),
          headlineMedium: helper.headline4.copyWith(color: helper.cBlack),
          titleLarge: helper.subtitle1
              .copyWith(color: helper.cBlack, fontWeight: helper.bold),
          bodyLarge: helper.subtitle1.copyWith(color: helper.cTextBlue),
          bodyMedium: helper.subtitle2.copyWith(color: helper.cTextBlue),
          labelLarge: helper.subtitle1
              .copyWith(color: helper.cWhite, fontWeight: helper.semibold),
          bodySmall: helper.caption.copyWith(color: helper.cTextBlue),
          labelSmall: helper.overline.copyWith(color: helper.cTextBlue),
        ).apply(
          fontFamily: helper.headline1.fontFamily,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: helper.cPrimary,
            foregroundColor: helper.cWhite,
            textStyle: helper.subtitle1.copyWith(fontWeight: helper.semibold),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: helper.cPrimary,
            side: BorderSide(color: helper.cPrimary, width: 1.5),
            textStyle: helper.subtitle1.copyWith(fontWeight: helper.semibold),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: helper.enableBorder,
          enabledBorder: helper.enableBorder,
          focusedBorder: helper.focusedBorder,
          errorBorder: helper.errorBorder,
          focusedErrorBorder: helper.focusedErrorBorder,
          labelStyle: helper.subtitle2.copyWith(color: helper.cTextBlue),
          hintStyle: helper.subtitle2.copyWith(color: helper.cLinear),
        ),
        useMaterial3: true,
      ),
    );
  }
}
