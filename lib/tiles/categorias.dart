import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery/componentes/categoryScreen.dart';

// Aqui cria as Listas com os dados do firebase

class CategoryTile extends StatelessWidget {

  final DocumentSnapshot snapshot;

  CategoryTile(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25.0,
        backgroundColor: Colors.transparent ,
        backgroundImage: NetworkImage(snapshot.data["icone"]),
      ),
      title: Text(snapshot.data["titulo"], style: TextStyle(fontWeight: FontWeight.bold)),
      trailing: Icon(Icons.arrow_right),
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => CategoryScreen(snapshot)));
      },
    
    );
  }
}