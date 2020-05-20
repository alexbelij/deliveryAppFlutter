import 'package:delivery/pages/productsDetails.dart';
import 'package:flutter/material.dart';


class Produtos extends StatefulWidget {
  @override
  _ProdutosState createState() => _ProdutosState();
}

class _ProdutosState extends State<Produtos> {
  var listaProdutos = [
    {
      "name": "hamburguer",
      "picture": "imagens/produtos/image1.jpg",
      "old_price": 20,
      "price": 13
    },
     {
      "name": "hamburguer",
      "picture": "imagens/produtos/image2.jpg",
      "old_price": 20,
      "price": 13
    },
     {
      "name": "hamburguer",
      "picture": "imagens/produtos/image3.jpg",
      "old_price": 20,
      "price": 13
    },
     {
      "name": "hamburguer",
      "picture": "imagens/produtos/image4.jpg",
      "old_price": 20,
      "price": 13
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: listaProdutos.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 1.0,
        crossAxisSpacing: 1.5   
        ), 
      itemBuilder:(BuildContext context,index){
        return DetalheProduto(
          nome: listaProdutos[index]["name"],
          foto: listaProdutos[index]["picture"],
          precoAntigo: listaProdutos[index]["old_price"],
          preco: listaProdutos[index]["price"],
        );
      }
      );
  }
}



class DetalheProduto extends StatelessWidget {
  final nome;
  final foto;
  final precoAntigo;
  final preco;
  DetalheProduto({
    this.nome,
    this.foto,
    this.precoAntigo,
    this.preco
  });
  @override
  Widget build(BuildContext context) {
    return Card(
          child: Material(
            child: InkWell(
              onTap: (){
                Navigator.push(context, 
                MaterialPageRoute(builder: (context) =>ProductsDetails(
                  detalhe_produto_nome: nome,
                  detalhe_produto_foto: foto,
                  detalhe_produto_ant_preco: precoAntigo,
                  detalhe_produto_preco: preco,
                ) )
                );
              },
              child: GridTile(
                  footer: Container(
                    color: Colors.white70,
                    child: ListTile(
                        leading: Text(
                          nome,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        title: Text(
                          "\$$preco",
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.w800),
                        ),
                        subtitle: Text(
                          "\$$precoAntigo",
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w800,
                              decoration
                                  :TextDecoration.lineThrough),
                        ),
                    ),
                  ),
                  child: Image.asset(
                    foto,
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          );
   
  }
}