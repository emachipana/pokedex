import 'package:flutter/material.dart';
import 'package:pokedex/core/styles/colors.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushNamed("home");
    });

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(8),
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: AppColors.red,
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FractionallySizedBox(
                alignment: Alignment.center,
                widthFactor: 0.9,
                child: Image.asset(
                  "assets/img/logo.png",
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 30),
              Text(
                "!Bienvenido a la pokedex!",
                style: TextStyle(
                  fontSize: 24,
                  color: AppColors.blue,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              CircularProgressIndicator(
                color: AppColors.blue,
              )
            ],
          ),
        ),
      ),
    );
  }
}
