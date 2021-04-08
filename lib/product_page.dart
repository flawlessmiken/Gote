import 'package:flutter/material.dart';
import 'package:gote/product_detail.dart';
import 'package:gote/provider/ProductProvider.dart';
import 'package:provider/provider.dart';

class ProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<ProductProvider>(context, listen: false).getProducts();
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),),
      body: Consumer<ProductProvider>(builder:(BuildContext context, ProductProvider productProvider, Widget child){
        if(productProvider.products.isNotEmpty)
        return ListView.builder(
          itemCount: productProvider.products.length,
            itemBuilder: (BuildContext context, int index){
          return InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder:(BuildContext context)=> ProductDetail(productProvider.products[index])));
            },
            child: Card(
              child: Row(
                children: [
                  Image.network(productProvider.products[index].image,
                  height: 200,
                    width: 100,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(productProvider.products[index].title,
                        style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                        Text(productProvider.products[index].description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
                        Text(productProvider.products[index].price,
                          style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
                      ],
                    ),
                  )

                ],
              ),
            ),
          );
        });
        else return Center(child: CircularProgressIndicator() );
      }),
    );
  }
}
