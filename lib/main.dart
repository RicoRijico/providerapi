import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_api/providers/product_provider.dart';
import 'package:provider_api/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
        ChangeNotifierProvider(create: (context) => ProductProvider()),
    ],
      child: MaterialApp(
    title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    ),
    );

  }
}
