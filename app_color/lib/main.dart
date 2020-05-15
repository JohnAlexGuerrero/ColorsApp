
import 'package:app_color/pages/nosotros.dart';
import 'package:flutter/material.dart';
import 'package:app_color/pages/paletaColors.dart';

void main() {
  runApp(MaterialApp(
    title: 'App Colors',
    home: new Home(),
  ));
}

class Home extends StatefulWidget {
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //creamos un arreglo de datos imagenes y nombre ejercicio
  List<Container> listamos = List();

  var arreglox = [
    {"nombre": "Woman", "imagen": "abdomen2.jpg"},
    {"nombre": "6 grandes heroes", "imagen": "beimar.jpg"},
    {"nombre": "Mujer hacinedo ejercicio", "imagen": "abdominal.jpg"},
    {"nombre": "Mujer levantando pesas", "imagen": "pesas.jpg"},
    {"nombre": "Riel de tren en el bosque", "imagen": "photo01.jpg"},
    {"nombre": "Rio y bosque", "imagen": "photo02.jpg"},
    {"nombre": "Hermosa playa", "imagen": "photo03.jpg"},
    {"nombre": "Puente en el bosque", "imagen": "photo04.jpg"},
    {"nombre": "Chica anime", "imagen": "photo05.jpg"},
    {"nombre": "Guerreros anime", "imagen": "photo06.jpg"},
    {"nombre": "Lujuria anime", "imagen": "photo07.jpg"},
    {"nombre": "Pokemon", "imagen": "photo08.jpg"},
    {"nombre": "Mujer posando", "imagen": "photo09.jpg"},
    {"nombre": "Mujer levantando", "imagen": "pierna2.jpg"},
  ];

  _listado() async {
    for (var i = 0; i < arreglox.length; i++) {
      final arregloxyz = arreglox[i];
      final String imagen = arregloxyz["imagen"];

      listamos.add(new Container(
        padding: new EdgeInsets.all(10.0),
        child: new Card(
          child: new Column(
            children: <Widget>[
              new Hero(
                tag: arregloxyz['nombre'],
                child: new Material(
                  child: new InkWell(
                    onTap: () =>
                        Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new Detalle(
                        nombre: arregloxyz['nombre'],
                        imagen: imagen,
                      ),
                    )),
                    child: new Image.asset("img/$imagen", fit: BoxFit.contain),
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.all(3.0),
              ),
              new Text(
                arregloxyz['nombre'],
                style: new TextStyle(fontSize: 20.0),
              ),
            ],
          ),
        ),
      ));
    }
  }

  @override
  void initState() {
    _listado();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: new AppBar(
        title: new Text('App Colors'),
        backgroundColor: Colors.blue,
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text('App Colors'),
              accountEmail: new Text('app_colors@gmail.com'),
              decoration: new BoxDecoration(
                color: Colors.orange,
                image: new DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('img/colores.jpg'),
              )),
            ),
            new Divider(),
            new ListTile(
                  title: new Text("Colors"),
                  trailing: new Icon(Icons.color_lens),
                  onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => PaletaColors(),
                  )),
                ),
                new Divider(),
            new ListTile(
              title: new Text("About us"),
              trailing: new Icon(Icons.help),
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => Nosotros(),
              )),
            ),
          ],
        ),
      ),
      body: new GridView.count(
        crossAxisCount: 2, //numero de columas de la primera pagina pruebn con 1
        mainAxisSpacing: 0.1, //espacio entre card
        childAspectRatio: 0.700, //espacio largo de cada card
        children: listamos,
      ),
    );
  }
}

//creamos el metodo detalle
//este se usa cuando pulsamos para ver segunda pantalla la descripcion del ejercicio
class Detalle extends StatefulWidget {
  Detalle({this.nombre, this.imagen});
  final String nombre;
  final String imagen;

  @override
  _DetalleState createState() => _DetalleState();
}

class _DetalleState extends State<Detalle> {
  double sliderRed = 0;
  double sliderBlue = 0;
  double sliderGreen = 0;
  double sliderOpacity = 0.0;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: new ListView(
        children: <Widget>[
          new Container(
            height: 387.0, //tamaño de la segunda imagen
            child: new Hero(
              tag: widget.nombre,
              child: new Material(
                child: new InkWell(
                  child: new Image.asset(
                    "img/${widget.imagen}",
                    fit: BoxFit.cover,
                    color: Color.fromRGBO((sliderRed).toInt(), (sliderGreen).toInt(), (sliderBlue).toInt(), 0).withOpacity(sliderOpacity),
                    colorBlendMode: BlendMode.colorBurn,
                  ),
                ),
              ),
            )
          ),
          new IniciarNombre(
            nombre: widget.nombre,
          ),
              //new IniciarIcon(),
          new Container(
            width: 100,
            height: 50,
            child: Slider(
              activeColor: Colors.red,
              value: sliderRed,
              onChanged: (double delta) {
                setState(() => sliderRed = delta);
              },
              min: 0,
              max: 255,
              divisions: 10,
              label: "$sliderRed",
            ),
          ),
          new Container(
            width: 100,
            height: 50,
            child: Slider(
              activeColor: Colors.green,
              value: sliderGreen,
              onChanged: (double delta) {
                setState(() => sliderGreen = delta);
              },
              min: 0,
              max: 255,
              divisions: 10,
              label: "$sliderGreen",
            ),
          ),
          new Container(
            width: 100,
            height: 50,
            child: Slider(
              activeColor: Colors.blue,
              value: sliderBlue,
              onChanged: (double delta) {
                setState(() => sliderBlue = delta);
              },
              min: 0,
              max: 255,
              divisions: 10,
              label: "$sliderBlue",
            ),
          ),
          new Container(
            width: 100,
            height: 30,
            child: Slider(
              activeColor: Colors.black26,
              value: sliderOpacity,
              onChanged: (double delta){
                setState(()=> sliderOpacity = delta);
              },
              min: 0.0,
              max: 1.0,
              divisions: 10,
              label: "$sliderOpacity",
            ),
          )
        ],
      ),
    );
  }
}



class IniciarNombre extends StatefulWidget {
  IniciarNombre({this.nombre});
  final String nombre;

  @override
  _IniciarNombreState createState() => _IniciarNombreState();
}

class _IniciarNombreState extends State<IniciarNombre> {
   Color rcolor = const Color.fromRGBO(0, 0, 0, 0.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.all(10.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  widget.nombre,
                  style: new TextStyle(fontSize: 20.0, color: Colors.blue),
                ),
                new Text(
                  "${widget.nombre}\@gmail.com",
                  style: new TextStyle(fontSize: 15.0, color: Colors.blueGrey),
                ),
              ],
            ),
          ),
          new Row(
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.restore,
                  size: 30.0,
                  color: Colors.red,
                ), 
                onPressed: (){
                  setState((){
                    print('alex');
                    return rcolor = Color.fromRGBO(0, 0, 0, 0.0);
                });
              }),
                                
                                new Icon(
                                  Icons.brightness_auto,
                                  size: 30.0,
                                  color: Colors.orange,
                                  
                                ),
                                new Icon(
                                  Icons.help,
                                  size: 30.0,
                                  color: Colors.purple,
                                ),
                                
                              ],
                            )
                          ],
                        ),
                      );
                    }

}

class IniciarIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.all(10.0),
      child: new Row(
        children: <Widget>[
          new IconTec(icon: Icons.call, tec: "Llamar"),
          new IconTec(icon: Icons.message, tec: "WhastApp"),
          new IconTec(icon: Icons.photo, tec: "Foto"),
        ],
      ),
    );
  }
}

class IconTec extends StatelessWidget {
  IconTec({this.icon, this.tec});
  final IconData icon;
  final String tec;
  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: new Column(
        children: <Widget>[
          new Icon(
            icon,
            size: 50.0,
            color: Colors.blue,
          ),
          new Text(
            tec,
            style: new TextStyle(fontSize: 12.0, color: Colors.blue),
          )
        ],
      ),
    );
  }
}

  

class Informacion extends StatelessWidget {
  Informacion({this.deporte});
  final String deporte;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      padding: new EdgeInsets.all(10.0),
      child: new Card(
        child: new Padding(
          padding: const EdgeInsets.all(10.0),
          child: new Text(
            deporte,
            style: new TextStyle(fontSize: 16.0, color: Colors.blue),
          ),
        ),
      ),
    );
  }
}
