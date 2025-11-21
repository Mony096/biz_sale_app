import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sale_app/dashboard/dashboard.dart';
import 'package:sale_app/feature/middleware/presentation/bloc/authorization_bloc.dart';
import 'package:sale_app/feature/middleware/presentation/login_screen.dart';
import 'package:sale_app/utilies/storage/locale_storage.dart';
import 'constant/style.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool hasCredentials = false;
  bool isLoading = true;
  bool isSplash = true; // 👈 SPLASH FLAG (show 2 seconds)

  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    startApp();
  }

  // 🔹 Start splash → initialize login → show screen
  Future<void> startApp() async {
    // 1) Show splash screen for 2 seconds
    await Future.delayed(const Duration(seconds: 3));

    setState(() => isSplash = false);

    // 2) Load user login data
    await init();
  }

  // 🔹 Load saved username/password/warehouse
  Future<void> init() async {
    setState(() => isLoading = true);

    final username = await LocalStorageManger.getString('username');
    final password = await LocalStorageManger.getString('password');

    hasCredentials = username.isNotEmpty && password.isNotEmpty;

    setState(() => isLoading = false);

    // Auto-navigate after loading
    if (hasCredentials) {
      _navigatorKey.currentState?.pushReplacement(
        MaterialPageRoute(builder: (_) => const Dashboard()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthorizationBloc, AuthorizationState>(
      listener: (context, state) {
        if (state is UnAuthorization) {
          _navigatorKey.currentState?.pushReplacement(
            MaterialPageRoute(
                builder: (_) => const LoginScreen(fromLogout: true)),
          );
        } else if (state is AuthorizationSuccess) {
          _navigatorKey.currentState?.pushReplacement(
            MaterialPageRoute(builder: (_) => const Dashboard()),
          );
        }
      },
      child: MaterialApp(
        navigatorKey: _navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: const Color(0xFFF5F5F5),
        ),
        title: 'Sale App',

        // 🔹 SHOW SPLASH FIRST
        home: isSplash
            ? const SplashScreenWidget()
            : isLoading
                ? const AppInitializingWidget()
                : BlocBuilder<AuthorizationBloc, AuthorizationState>(
                    builder: (context, state) {
                      if (hasCredentials) {
                        return const Dashboard();
                      } else if (state is AuthorizationSuccess) {
                        return const Dashboard();
                      } else {
                        return const LoginScreen();
                      }
                    },
                  ),
      ),
    );
  }
}

// 🔹 SPLASH SCREEN COMPONENT
class SplashScreenWidget extends StatelessWidget {
  const SplashScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          "SALE APP SPLASH Screen",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

// 🔹 LOADING SCREEN DURING INIT()
class AppInitializingWidget extends StatelessWidget {
  const AppInitializingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 20),
            Text(
              "Initializing App...",
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
