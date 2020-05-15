import 'package:flutter/material.dart';

class PaletaColors extends StatefulWidget {
  @override
  _PaletaColorsState createState() => _PaletaColorsState();
}

class _PaletaColorsState extends State<PaletaColors> {
  String text = 'Este texto se puede cambiar';

  hexColor(String colorPalete){
    return colorPalete = colorPalete;
  }

  Widget build(BuildContext context) {
    
        return Scaffold(
          appBar: new AppBar(title: new Text('Paleta de Colores'),
          ),
          body: new ListView(
            children: <Widget>[
              new Divider(),
              new ListTile(
                title: new Text('Yellow'),
                //onTap: hexColor('#FFFC2B'),
          ),
          new Divider(),
          new ListTile(
            title: new Text('Blue'),
          ),
          new Divider(),
          new ListTile(
            title: new Text('Red'),
          ),
          new Divider(),
          new ListTile(
            title: new Text('Orange'),
          ),
          new Divider(),
          new ListTile(
            title: new Text('Green'),
          ),
          new Divider(),
          new ListTile(
            title: new Text('Purple'),
          ),
          new Divider(),
          new ListTile(
            title: new Text('Cyan'),
          ),
          new Divider(),
          new ListTile(
            title: new Text('Grey'),
          ),
        ],
      ),
    );
  }
}