import 'package:flutter/material.dart';

class ImagenProducto extends StatelessWidget {
 
final String? url;

  const ImagenProducto({Key? key,  this.url}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(      
      padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
      child: SafeArea(
        child: Container(
          decoration: _constructorCajaDecoracion(),
          width: double.infinity,
          height:450 ,
          child: Opacity(
            opacity: 0.8,
            child: ClipRRect(
              borderRadius:BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)) ,
              child: url==null
              ?Image(image: AssetImage('assets/no-image.png'),
              fit:BoxFit.cover):
              
              FadeInImage(placeholder: AssetImage('assets/jar-loading.gif'),
               image: NetworkImage(url!),
               fit: BoxFit.cover,),
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration _constructorCajaDecoracion() {
    return BoxDecoration(
      color: Colors.black,
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