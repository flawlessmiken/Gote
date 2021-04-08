import 'package:flutter/material.dart';

import 'models/product.dart';

class ProductDetail extends StatelessWidget {

  final Product product;
  ProductDetail(this.product);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
       slivers: [
         SliverAppBar(
           expandedHeight: 250,
           flexibleSpace: FlexibleSpaceBar(
             title: Text(product.title),
             background: Image.network(product.image, fit:BoxFit.cover,),
           ),
         ),
         SliverList(
           delegate: SliverChildListDelegate([
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 8.0),
               child: Text(
                 '\$ ${product.price}',
                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
               ),
             ),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 8.0),
               child: Text(
                 '\$ ${product.description}',
                 style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
               ),
             ),


           ]),
         ),
       ],


      ),
    );
  }
}
