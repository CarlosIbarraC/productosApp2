import 'package:flutter/material.dart';
import 'package:product_app_2/models/models.dart';

class ProductoTarjeta extends StatelessWidget {
  final Productos product;

  const ProductoTarjeta({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 30),
            width: double.infinity,
            height: 400,
            decoration: _bordesTarjeta(),
            child: Stack(alignment: Alignment.bottomLeft, children: [
              _FondoImagen(product.imagen),
              _DetalleProducto(),
              Positioned(top: 0, right: 0, child: _EtiquetaPrecio()),
              Positioned(top: 0, left: 0, child: EtiquetaDisponible())
            ]),
          ),
         
          SizedBox(
            height: 40,
          )
         
        ],
      ),
    );
  }

  BoxDecoration _bordesTarjeta() {
    return BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 102, 101, 101),
            offset: Offset(0, 3),
            blurRadius: 10,
          )
        ]);
  }
}

class EtiquetaDisponible extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'NO Disponible',
        style: TextStyle(
          color: Colors.white,
          fontSize: 12,
        ),
      ),
      width: 100,
      height: 50,
      decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), bottomRight: Radius.circular(10))),
      alignment: Alignment.center,
    );
  }
}

class _EtiquetaPrecio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            '\$10003.99',
            style: TextStyle(
              color: Colors.deepPurple,
              fontSize: 18,
            ),
          ),
        ),
      ),
      width: 100,
      height: 50,
      decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10), bottomLeft: Radius.circular(10))),
      alignment: Alignment.center,
    );
  }
}

class _DetalleProducto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 50),
      child: Container(
        width: double.infinity,
        height: 70,
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(5), bottomLeft: Radius.circular(10)),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Producto1',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                'especificaciones',
                style: TextStyle(fontSize: 12, color: Colors.deepPurple),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _FondoImagen extends StatelessWidget {
  final String? url;

  const _FondoImagen(this.url);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: double.infinity,
        height: 400,
        child: FadeInImage(
          placeholder: AssetImage('assets/jar-loading.gif'),
          image: NetworkImage(url!),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
