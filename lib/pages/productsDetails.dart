import 'package:flutter/material.dart';

class ProductsDetails extends StatefulWidget {
  final detalhe_produto_nome;
  final detalhe_produto_foto;
  final detalhe_produto_ant_preco;
  final detalhe_produto_preco;

  ProductsDetails({this.detalhe_produto_nome,this.detalhe_produto_foto,
  this.detalhe_produto_ant_preco,
  this.detalhe_produto_preco}
  );
  @override
  _ProductsDetailsState createState() => _ProductsDetailsState();
}



class _ProductsDetailsState extends State<ProductsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Burgues burgue"),
        backgroundColor: Colors.red,
        elevation: 0.2,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search,color: Colors.white,), onPressed: (){}),
          IconButton(icon: Icon(Icons.shopping_cart,color: Colors.white,), onPressed: (){})

        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 300.0,
            child: GridTile(
              child: Container(
                color: Colors.white70,
                child: Image.asset(widget.detalhe_produto_foto),
              ),
              footer: Container(
                color: Colors.white,
                child: ListTile(
                  leading: Text(widget.detalhe_produto_nome, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0)),
                  title: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text("\$${widget.detalhe_produto_ant_preco}",
                        style: TextStyle(color: Colors.grey,decoration: TextDecoration.lineThrough)
                        ),
                        ),
                        Expanded(
                        child: Text("\$${widget.detalhe_produto_preco}",
                        style: TextStyle(color: Colors.red),
                        ),
                        ),
                    ],
                  ),
                ),
              ),
              ),
              
          ),
         Row(
           children: <Widget>[
            // User the size buttom
             Expanded(child: MaterialButton(onPressed: (){},
             color: Colors.white,
             textColor: Colors.grey,
             elevation: 0.2,
             child: Row(
               children: <Widget>[
                 Expanded(child: Text("Size"),
                 ),
                 Expanded(child: Icon(Icons.arrow_drop_down))
               ],
             ),             
             ),
             ),
             Expanded(child: MaterialButton(onPressed: (){},
             color: Colors.white,
             textColor: Colors.grey,
             elevation: 0.2,
             child: Row(
               children: <Widget>[
                 Expanded(child: Text("Qnt"),
                 ),
                 Expanded(child: Icon(Icons.arrow_drop_down))
               ],
             ),
             ),
             ),
           ],
         ), 
         Row(
           children: <Widget>[
             Expanded(child: MaterialButton(onPressed: (){},
             color: Colors.red,
             textColor: Colors.white,
             elevation: 0.2,
             child: Text("Comprar"),
             ),
             ),
             IconButton(icon: Icon(Icons.add_shopping_cart),onPressed: (){},color: Colors.red,),
             IconButton(icon: Icon(Icons.add_shopping_cart),onPressed: (){},color: Colors.red,)
           ],
         )
        ],
      ),
    );
  }
}