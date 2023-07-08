import 'package:flutter/material.dart';
import 'package:product_app_2/models/models.dart';

class ProductoDesdeProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey();
  Productos producto;
  ProductoDesdeProvider(this.producto);

 habilitaBoton(bool value) {
    print(value);
    producto.disponible = value;
    notifyListeners();
  }

  bool isValidForm() {
    // ?? especifica que regresa null
    //? por si no esta asignado a ningun valor
    return formKey.currentState?.validate() ?? false;
  }
}
