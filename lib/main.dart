import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/provider/cart_provider.dart';
import 'package:shop_app/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shop App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 254, 254, 2),
            primary: const Color.fromARGB(255, 254, 254, 2),
          ),
          fontFamily: 'Noto-Sans',
          inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
          ),
          textTheme: const TextTheme(
            titleMedium: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            bodySmall: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            titleLarge: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
