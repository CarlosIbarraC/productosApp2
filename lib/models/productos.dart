// To parse this JSON data, do
//
//     final productos = productosFromJson(jsonString);

import 'dart:convert';

class Productos {
  bool disponible;
  String? imagen;
  String nombre;
  double precio;
  String? id;

  Productos(
      {required this.disponible,
      this.imagen,
      required this.nombre,
      required this.precio,
      this.id});

  factory Productos.fromRawJson(String str) =>
      Productos.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Productos.fromJson(Map<String, dynamic> json) => Productos(
        disponible: json["disponible"],
        imagen: json["imagen"],
        nombre: json["nombre"],
        precio: json["precio"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "disponible": disponible,
        "imagen": imagen,
        "nombre": nombre,
        "precio": precio,
      };
  Productos copy() => Productos(
      disponible: disponible,
      nombre: nombre,
      precio: precio,
      imagen: imagen,
      id: id);
}
