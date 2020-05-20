import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery/tiles/categorias.dart';

class DraweProd extends StatefulWidget {
  @override
  _DraweProdState createState() => _DraweProdState();
}

class _DraweProdState extends State<DraweProd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Produtos"),
        backgroundColor: Colors.red,
        elevation: 0.2,
      ),
      body: ProdTab(),
    );
  }
}

// Comando Para retorna uma lista com dados do firebase
class ProdTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: Firestore.instance.collection("produtos").getDocuments(),
      builder:(context, snapshot){
            if(! snapshot.hasData)
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                ),
              );
            else {
              return ListView(
                children: snapshot.data.documents.map(
                  (doc){
                    return CategoryTile(doc);
                  }
                ).toList(),
              );
            }
      } ,
      );
  }
}