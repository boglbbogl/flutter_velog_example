import 'package:flutter/material.dart';
import 'package:flutter_velog_example/state/auth_provider.dart';
import 'package:flutter_velog_example/view/home_screen.dart';
import 'package:flutter_velog_example/_constant/theme.dart';
import 'package:flutter_velog_example/view/splash_screen.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    theme = Theme.of(context);
    return Consumer<AuthProvider>(
      builder: (context, provider, child) {
        if (provider.isSplash) {
          return const SplashScreen();
        } else {
          return const HomeScreen();
        }
      },
    );
  }
}
