import 'package:flutter/material.dart';

class Nosotros extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: new Text("About us"),
      ),
      body: new ListView(
        children: <Widget>[
          new Center(
            child: new Text('App Colors',
              style: TextStyle(
                fontSize: 30,
              )
            ),
          ),
          new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: AssetImage('img/colores.jpg'),
                fit: BoxFit.cover,

              )
            ),
          ),
          new Text('John Alexander Guerrero', style: TextStyle(
            fontSize: 20,
          ),),
        ],
      ) 
    );
  }
}