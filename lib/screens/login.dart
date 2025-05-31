import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final ThemeData? themeData;
  LoginScreen({this.themeData});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeData!.primaryColor,
        leading: IconButton(
          icon: Icon(
            Icons.clear,
            color: themeData!.colorScheme.secondary,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Log In',
          style: themeData!.textTheme.headlineSmall,
        ),
      ),
      body: Container(
        color: themeData!.primaryColor,
        child: Center(
          child: Text(
            'Coming Soon.',
            style: themeData!.textTheme.bodyLarge,
          ),
        ),
      ),
    );
  }
}
