import 'package:delivery/tiles/productsTile.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery/data/productsData.dart';
//CRIANDO A LISTA DE CATEGORIAS DE PRODUTOS EXIBINDO EM GRADE E EM LISTA
class CategoryScreen extends StatelessWidget {
// Funçao para pegar os documentos
    final DocumentSnapshot snapshot;

    CategoryScreen(this.snapshot);

  @override
  Widget build(BuildContext context) {
  // CRIANDO O APP BAR
    return DefaultTabController(
      length: 2, 
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text(snapshot.data["titulo"]),
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: Colors.red,
            tabs: <Widget>[
              Tab(icon: Icon(Icons.grid_on)),
              Tab(icon: Icon(Icons.list),)
            ],
            ),
        ),
        // CRIANDO O CORPO COM UMA FUTURE BUILDER E ROTORNADO EM GRADE E EM LISTA
        body: FutureBuilder<QuerySnapshot>(
          // FUNÇÃO DO FIRESTORE PARA RECUPERAR DADOS                // ESSE COMANDO PEGA OS DOCUMENTOS DE ACORDO COM CADA ID
          future: Firestore.instance.collection("produtos").document(snapshot.documentID).collection("itens").getDocuments(),
          builder: (context,snapshot){
              if(!snapshot.hasData)
                return Center(
                  child: CircularProgressIndicator(),
                );
              else{
                return TabBarView(
                     physics: NeverScrollableScrollPhysics(),
                     children: <Widget>[
                          GridView.builder(
                            padding: EdgeInsets.all(4.0),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 4.0,
                              crossAxisSpacing: 4.0,
                              childAspectRatio: 0.65,
                            ),
                            itemCount: snapshot.data.documents.length, 
                            itemBuilder: (context,index) {
                                return ProductTile("grid",ProductsData.fromDocument(snapshot.data.documents[index]));

                            }
                          ),
                        ],
                 );
              }
          },
        )
      ),
    );
  }
}