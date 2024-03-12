import 'package:fast_food/drawer.dart';
import 'package:fast_food/home.dart';
import 'package:fast_food/utils/singleton.dart';
import 'package:flutter/material.dart';

import 'package:fast_food/constante.dart' as con;
import 'package:shared_preferences/shared_preferences.dart';

class VistaProducto extends StatefulWidget {
  const VistaProducto({super.key});

  @override
  State<VistaProducto> createState() => _VistaProductoState();
}

class _VistaProductoState extends State<VistaProducto> {
  final Singleton singleton = Singleton();

  late final SharedPreferences prefs;

  @override
  void initState()
  {
    initPreferences();  
    super.initState();
  }

  Future<void> initPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final datos = singleton.productoSeleccionado;
    
    return Scaffold(


      backgroundColor: con.white,
      appBar: AppBar(
        backgroundColor: con.orange,
        elevation: 10,
        shadowColor: Colors.white,
        title: Center( // cualquier tipo widget o cualquier widget
          child: Image.asset("images/Welcome 2.png",
          width: size.width * 0.1,),
        ),
        iconTheme: IconThemeData(color: con.white),
        actions: [

          Text(singleton.user),

      //     IconButton(
      //       onPressed: (){},
      //       icon: Icon(Icons.local_grocery_store),
      //     ),
          InkWell(
            onTap: () {
              setState(() {
                singleton.limpiarSeleccion();
                prefs.setStringList('producto', []);
                prefs.setBool('productoSeleccionado', false);
              });
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home()));
            },
            child: Icon(Icons.arrow_back),
          ),
        ],
      ),
      //endDrawer: //derecha,
      drawer: drawerWidget(), 


      body: Stack(
        children: [ 
          Column(
            children: [

              Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      margin: EdgeInsets.only(
                        left: size.width * 0.01, right: size.width * 0.01
                      ),

                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                                  datos[1],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                    letterSpacing: 1.5
                                    ),
                                ),
                            Text(
                                  datos[2],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    letterSpacing: 1.5
                                    ),
                            ),
                            CircleAvatar(
                                radius: size.width * 0.2,
                                child: Image.asset("images/${datos[4]}",
                                width: size.width *0.2),
                            ),
                            Text(datos[3],
                                  style: TextStyle(fontWeight: FontWeight.bold, color: con.red),
                                
                              )
                          ],
                        ),
                      )
                    )
                  ]
                )
              )

            ],
          )
        ]  
      ),
      
    );
  }
}