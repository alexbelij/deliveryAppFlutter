import 'package:flutter/material.dart';
import 'package:delivery/data/productsData.dart';

class ProductTile extends StatelessWidget {
  final String type;
  final ProductsData product;

  ProductTile(this.type, this.product);

  @override
  Widget build(BuildContext context) {
// AQUI É O CARD DENTRO DE UM INKWEL VAI RETORNA A IMAGEM DO FIREBASE
    return InkWell(
      onTap: () {},
      child: Card(
          child: type == "grid"
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 1.0,
                      child: Image.network(
                        product.image[0],
                        fit: BoxFit.cover,
                      ),
                    ),
//        AQUI VAI FICAR O TITULO DA IMAGEM E O PREÇO
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Text(product.titulo,
                                style: TextStyle(fontWeight: FontWeight.w500)),
                            Text(
                              "R\$ ${product.preco.toStringAsFixed(2)}",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )
              : Row()),
    );
  }
}
