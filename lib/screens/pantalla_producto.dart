import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:product_app_2/Servicios/servicios.dart';
import 'package:product_app_2/providers/providers.dart';
import 'package:product_app_2/userInterface/decoracionInputs.dart';
import 'package:product_app_2/widgets/widgets.dart';
import 'package:provider/provider.dart';

class ProductoPantalla extends StatelessWidget {
  const ProductoPantalla({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ServicioProductos>(context);
    return ChangeNotifierProvider(
      create: (_) => ProductoDesdeProvider(productService.selectorProducto),
      child: _cuerpoPantallaProducto(productService: productService),
    );
    //return _cuerpoPantallaProducto(productService: productService);
  }
}

class _cuerpoPantallaProducto extends StatelessWidget {
  const _cuerpoPantallaProducto({
    Key? key,
    required this.productService,
  }) : super(key: key);

  final ServicioProductos productService;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // se oculta el teclado al hacer scroll
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          children: [
            Stack(
              children: [
                ImagenProducto(url: productService.selectorProducto.imagen),
                Positioned(
                  child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                      )),
                  top: 80,
                  left: 30,
                ),
                Positioned(
                  child: IconButton(
                      onPressed: () {
                        //TODO CAMARA O GALERIA
                      },
                      icon: Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.white,
                      )),
                  top: 80,
                  right: 30,
                )
              ],
            ),
            _FormularioProducto(),
            SizedBox(
              height: 100,
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.amber,
          child: Icon(
            Icons.save_outlined,
            color: Colors.black38,
          ),
          onPressed: () {}),
    );
  }
}

class _FormularioProducto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productoIni = Provider.of<ProductoDesdeProvider>(context);
    final productoFormulario =
        Provider.of<ProductoDesdeProvider>(context).producto;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Container(
        width: double.infinity,
        decoration: _buildBoxDecoration(),
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Form(
            child: Column(
          children: [
            SizedBox(height: 10),
            TextFormField(
              initialValue: productoFormulario.nombre,
              onChanged: (value) => productoFormulario.nombre = value,
              // ignore: body_might_complete_normally_nullable
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'El nombre no es valido';
                }
              },
              decoration: InputDecorations.authInputDecoration(
                  hintText: 'nombre del producto', labelText: 'Producto:'),
            ),
            SizedBox(height: 40),
            TextFormField(
              initialValue: '${productoFormulario.precio}',
              inputFormatters: [
                (FilteringTextInputFormatter.allow(
                    RegExp(r'^(\d+)?\.?\d{0,2}')))
              ],
              onChanged: (value) => productoFormulario.nombre = value,
              // ignore: body_might_complete_normally_nullable
              validator: (value) {
                if (double.tryParse(value!) == null) {
                  productoFormulario.precio = 0;
                } else {
                  productoFormulario.precio = value as double;
                }
              },
              keyboardType: TextInputType.number,
              decoration: InputDecorations.authInputDecoration(
                  hintText: '\$precio', labelText: 'Precio:'),
            ),
            SizedBox(height: 30),
            SwitchListTile.adaptive(
              value: productoFormulario.disponible,
              onChanged: (value) =>productoIni
                  .habilitaBoton(value),
              title: Text('disponible'),
              activeColor: Colors.amber,
            )
          ],
        )),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() {
    return BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.05),
              offset: Offset(0, 5),
              blurRadius: 5)
        ]);
  }
}
