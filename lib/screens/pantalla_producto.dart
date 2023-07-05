import 'package:flutter/material.dart';
import 'package:product_app_2/userInterface/decoracionInputs.dart';
import 'package:product_app_2/widgets/widgets.dart';

class ProductoPantalla extends StatelessWidget {
   
  const ProductoPantalla({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ImagenProducto(),
                Positioned(child: IconButton(
                  onPressed:()=>Navigator.of(context).pop() , icon:Icon(Icons.arrow_back_ios_new,color: Colors.white,)),
                top: 80,
                left: 30,),
                Positioned(child: IconButton(
                  onPressed:(){
                    //TODO CAMARA O GALERIA
                  } , icon:Icon(Icons.camera_alt_outlined,color: Colors.white,)),
                top: 80,
                right: 30,)
              ],
            ),
            _FormularioProducto(),
            SizedBox(height: 100,)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        child: Icon(Icons.save_outlined,
        color: Colors.black38,),
        
        onPressed: (){}),
    );
  }
}

class _FormularioProducto extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,),
      child: Container(
        width: double.infinity,        
        decoration: _buildBoxDecoration(),
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Form(child: Column(
          children: [
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecorations.authInputDecoration(hintText: 'nombre del producto', 
              labelText: 'Producto:'),
          
            ),
            SizedBox(height: 40),
             
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecorations.authInputDecoration(hintText: '\$precio', 
              labelText: 'Precio:'),
          
            ),
             SizedBox(height: 30),
             SwitchListTile.adaptive(
              value: true,
               onChanged: (value){
              //TODO pendiente accion
             },
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
      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
      boxShadow:[ BoxShadow(
        color: Colors.black.withOpacity(0.05),
        offset: Offset(0, 5),
        blurRadius: 5
      )]
    );
  }
}