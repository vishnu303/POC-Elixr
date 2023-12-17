import 'package:elixr_poc/authentication/screen/sign_in_page.dart';
import 'package:elixr_poc/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'app_redux/app_store.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        scaffoldMessengerKey: SnackBarService.scaffoldKey,
        theme: ThemeData(
            useMaterial3: false,
            primaryColor: Colors.brown[400],
            primarySwatch: Colors.brown),
        title: 'Poc',
        home: const SignInPage(),
      ),
    );
  }
}
