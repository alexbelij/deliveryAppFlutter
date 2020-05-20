
import 'package:delivery/componentes/horizontalListView.dart';
import 'package:delivery/componentes/products.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:delivery/drawerpages/catprods.dart';



void main(){
  
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
  Widget image_carousel = new Container(
    height: 200.0,
    child:  new Carousel(
      boxFit: BoxFit.cover,
      images: [
        AssetImage('imagens/cm1.jpg'),
        AssetImage('imagens/cm2.jpg'),
        AssetImage('imagens/hb1.jpg'),
        AssetImage('imagens/hb2.png'),
        AssetImage('imagens/p1.jpg'),
      ],
      autoplay: true,
//      animationCurve: Curves.fastOutSlowIn,
//      animationDuration: Duration(milliseconds: 1000),
      dotSize: 4.0,
      indicatorBgPadding: 2.0,
    ),
  );
    return Scaffold(
      appBar: AppBar(
        title: new Text("Delicias.com"),
        backgroundColor: Colors.red,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search,color: Colors.white), onPressed: null),
          IconButton(icon: Icon(Icons.shopping_cart,color: Colors.white), onPressed: null)
        ],
      ),
      drawer: Drawer(
        child: new ListView(
          children: <Widget>[
//            header
            new UserAccountsDrawerHeader(
                accountName: Text('luccas fontinele'),
                accountEmail: Text('lucassampaio@gmail.com'),
            currentAccountPicture: GestureDetector(
              child: new CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(Icons.person, color: Colors.white,),
              ),
            ),
            decoration: new BoxDecoration(
              color: Colors.red
            ),
            ),

//            body

          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text('Início'),
              leading: Icon(Icons.home),
            ),
          ),

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Conta'),
                leading: Icon(Icons.person),
              ),
            ), 

            InkWell(
              onTap: () => Navigator.push(context, MaterialPageRoute(
                builder:(context) => DraweProd())),
              child: ListTile(
                title: Text('Produtos'),
                leading: Icon(Icons.dashboard),
              ),
            ),

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Favoritos'),
                leading: Icon(Icons.favorite),
              ),
            ),

            Divider(),

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Settings'),
                leading: Icon(Icons.settings, color: Colors.blue,),
              ),
            ),

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('About'),
                leading: Icon(Icons.help, color: Colors.green),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          image_carousel,
          Padding(padding: EdgeInsets.all(5.0),
          child: Text("Categorias",style: TextStyle(fontWeight: FontWeight.bold,)),
          ),
          HorizontalList(),
          Padding(padding: EdgeInsets.only(left: 4.0,top: 5.0),
          child: Text("Novidades",
          style: TextStyle(fontWeight: FontWeight.bold),
          ),
          ),
          Container(
            height: 300.0,
            child: Produtos(),
          )
        ],
      ),
   );
  }
}