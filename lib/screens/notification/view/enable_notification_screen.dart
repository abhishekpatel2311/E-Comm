import 'package:flutter/material.dart';
import 'package:shop/components/buy_full_ui_kit.dart';

class EnableNotificationScreen extends StatelessWidget {
  const EnableNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/screens/Enable notification.png")
          ],
        ),
      ),
    );

  }
}
