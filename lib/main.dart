import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sale_app/feature/middleware/presentation/bloc/authorization_bloc.dart';
import 'package:sale_app/injector.dart';
import 'package:sale_app/main_screen.dart';
import 'core/disble_ssl.dart';

void main() async {
  // Ensures Flutter binding is initialized
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  HttpOverrides.global = DisableSSL();
  container();
  runApp(MyMainApp());
}

class MyMainApp extends StatefulWidget {
  const MyMainApp({super.key});

  @override
  State<MyMainApp> createState() => _MyMainAppState();
}

class _MyMainAppState extends State<MyMainApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<AuthorizationBloc>()),
      ],
      child: const MainScreen(),
    );
  }
}
