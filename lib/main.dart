import 'package:flutter/material.dart';
import 'package:uac_flutter_app/src/views/screens/auth/create_account.dart';
import 'package:uac_flutter_app/src/views/screens/auth/login.dart';
import 'package:uac_flutter_app/src/views/screens/app/app.dart';
import 'package:uac_flutter_app/src/views/screens/physical/physical.dart';
import 'package:uac_flutter_app/src/views/screens/potency/potency.dart';
import 'package:uac_flutter_app/src/views/screens/factorial/factorial.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  static final Map<String, Widget Function(BuildContext)> _appRoutes = {
    '/': (context) => const AppView(),
    '/physical': (context) => const PhysicalView(),
    '/potency': (context) => const PotencyView(),
    '/factorial': (context) => const FactorialView(),
    '/login': (context) => const LoginView(),
    '/create-account': (context) => const CreateAccountView()
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: '/login', routes: _appRoutes);
  }
}
