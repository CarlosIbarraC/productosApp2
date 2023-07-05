import 'package:flutter/material.dart';
import 'package:product_app_2/Servicios/servicios.dart';
import 'package:product_app_2/screens/imagenLoading.dart';
import 'package:product_app_2/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsService = Provider.of<ServicioProductos>(context);
    if (productsService.isLoading) return LoadingScreen();
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Productos')),
      ),
      body: ListView.builder(
          itemCount: productsService.productos.length,
          itemBuilder: (BuildContext contex, int index) => GestureDetector(
              onTap: () => Navigator.pushNamed(context, 'producto'),
              child: ProductoTarjeta(product: productsService.productos[index],))),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          elevation: 0,
          backgroundColor: Colors.deepPurple,
          onPressed: () {}),
    );
  }
}
