import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
            image_location: 'imagens/icones/hamburguer.png',
            image_caption: 'Hamburguer',
          ),

          Category(
            image_location: 'imagens/icones/fatia-de-pizza.png',
            image_caption: 'Pizza',
          ),

          Category(
            image_location: 'imagens/icones/sorvete.png',
            image_caption: 'Sorvete',
          ),

          Category(
            image_location: 'imagens/icones/bebida.png',
            image_caption: 'Bebida',
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String image_location;
  final String image_caption;

  Category({this.image_location, this.image_caption});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 93.0,
          child: ListTile(
            title: Image.asset(
              image_location,
              width: 50.0,
              height: 80.0,
            ),
            subtitle: Container(
              alignment: Alignment.topCenter,
              child: Text(image_caption, style: new TextStyle(fontSize: 10.0),),
            )
          ),
        ),
      ),
    );
  }
}


