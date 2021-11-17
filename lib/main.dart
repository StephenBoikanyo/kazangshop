import 'package:flutter/material.dart';

void main() {
  runApp(KazangShop());
}

class KazangShop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
