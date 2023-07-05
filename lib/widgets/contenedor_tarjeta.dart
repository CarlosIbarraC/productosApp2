import 'package:flutter/material.dart';

class ContenedorTarjeta extends StatelessWidget {
  final Widget child;
  const ContenedorTarjeta({ required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        decoration: _formaTarjeta(),
        child:child
      ),
    );
  }

  BoxDecoration _formaTarjeta() => BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.black12, blurRadius: 15, offset: Offset(0, 5))
          ]);
}
