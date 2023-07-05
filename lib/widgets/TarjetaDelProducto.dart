import 'package:flutter/material.dart';

class ImagenProducto extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return Padding(      
      padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
      child: SafeArea(
        child: Container(
          decoration: _constructorCajaDecoracion(),
          width: double.infinity,
          height:450 ,
          child: ClipRRect(
            borderRadius:BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)) ,
            child: FadeInImage(placeholder: AssetImage('assets/jar-loading.gif'),
             image: NetworkImage('https://via.placeholder.com/400x300/blue'),
             fit: BoxFit.cover,),
          ),
        ),
      ),
    );
  }

  BoxDecoration _constructorCajaDecoracion() {
    return BoxDecoration(
      color: Colors.amber,
      borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
      boxShadow:[ 
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 10,
          offset: Offset(0, 5)
          )]
      
        
      );
  }
}