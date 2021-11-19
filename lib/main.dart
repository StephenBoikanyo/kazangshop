import 'package:flutter/material.dart';
import 'package:kanzangshop/screens/home_screen.dart';
import 'package:kanzangshop/screens/login_screen.dart';
import 'package:kanzangshop/screens/product_details_page.dart';

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
      initialRoute: LoginScreen.id,
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        ProductDetails.id: (context) => ProductDetails()
      },
    );
  }
}
