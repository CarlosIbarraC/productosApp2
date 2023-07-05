import 'package:flutter/material.dart';
import 'package:product_app_2/Servicios/servicios.dart';
import 'package:product_app_2/screens/screens.dart';
import 'package:provider/provider.dart';

void main() => runApp( AppState());

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider(create: ( _ ) => ServicioProductos())],
        child: MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Products App',
      initialRoute: 'home',
      routes: {
        'login': ( _ ) => LoginScreen(),
        'home': ( _ ) => HomeScreen(),
        'producto': ( _ ) => ProductoPantalla()
      },
      theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: Colors.grey[300],
          appBarTheme: const AppBarTheme(
            elevation: 0,
            backgroundColor: Colors.deepPurple,
          )),
    );
  }
}
