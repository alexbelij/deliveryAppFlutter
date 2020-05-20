import 'package:cloud_firestore/cloud_firestore.dart';
// FUNÇAO PARA PEGAR OS DADOS DO FIREBASE

class ProductsData {
  String category;
  String id;
  String titulo;
  String descricao;
  double preco;
  List image;

  ProductsData.fromDocument(DocumentSnapshot snapshot){
   
    id = snapshot.documentID; // RECUPERA OS DOCUMENTOS COM OS ID
    titulo = snapshot.data["titulo"];
    descricao = snapshot.data["descrição"];
    preco = snapshot.data["preço"] + 0.0;
    image = snapshot.data["imagens"];
  
  }

}