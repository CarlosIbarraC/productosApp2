// se encarga de las peticiones http

import 'package:flutter/foundation.dart';
import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:product_app_2/models/models.dart';
import 'package:http/http.dart' as http;

class ServicioProductos extends ChangeNotifier {
  final String _basUrl = 'flutter-tienda-a531f-default-rtdb.firebaseio.com';
  final List<Productos> productos = [];

  late Productos selectorProducto;
  bool isLoading = true;
  bool isSaving = false;

  ServicioProductos() {
    cargarProductos();
  }

  Future cargarProductos() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.https(_basUrl, 'productos.json');
    final resp = await http.get(url);
    final Map<String, dynamic> productosMap = convert.jsonDecode(resp.body);
    productosMap.forEach((key, value) {
      final temProduct = Productos.fromJson(value);
      temProduct.id = key;
      productos.add(temProduct);
    });
    isLoading = false;
    notifyListeners();
    return productos;
  }

  Future grabarProducto(Productos productos) async {
    isSaving = true;
    notifyListeners();

    if (productos.id == null) {
      // es necesario crear
    } else {
      await descargaProducto(productos);
    }

    isSaving = false;
    notifyListeners();
  }

  Future<String> descargaProducto(Productos productos) async {
    final url = Uri.https(_basUrl, 'productos/${productos.id}.json');
    final resp = await http.put(url, body: productos.toRawJson());
    final decodedDate = resp.body;
    print(decodedDate);
    final index =
        this.productos.indexWhere((element) => element.id == productos.id);
    this.productos[index] = productos;
    return productos.id!;
  }
}
