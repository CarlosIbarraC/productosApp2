import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  final Widget child;
 AuthBackground({ required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          FondoPurple(),
          _iconoPersona(),
         child
        ],
      ),
    );
  }
}

class _iconoPersona extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: Icon(Icons.person_pin, color: Colors.white, size: 100),
        
      ),
    );
  }
}

class FondoPurple extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * .40,
      decoration: _fondoPurpura(),
      child: Stack(
        children: [
          Positioned(child: _Bombas(), top: 90, left: 30),
          Positioned(child: _Bombas(), top: 110, right: 20),
          Positioned(child: _Bombas(), top: -50, left: 150),
          Positioned(child: _Bombas(), bottom: -30, left: 50),
          Positioned(child: _Bombas(), bottom: -60, right: -10)
        ],
      ),
    );
  }

  BoxDecoration _fondoPurpura() => BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromRGBO(63, 63, 156, 1),
        Color.fromRGBO(90, 70, 178, 1)
      ]));
}

class _Bombas extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Color.fromRGBO(255, 255, 255, 0.05)),
    );
  }
}
