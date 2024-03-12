//VISTA HOME

import 'package:fast_food/utils/singleton.dart';
import 'package:fast_food/vista_producto.dart';
import 'package:flutter/material.dart';
import 'package:fast_food/constante.dart' as con;
import 'package:fast_food/drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Singleton singleton = Singleton();

  late final SharedPreferences prefs;

  @override
  void initState() {
    singleton.inicializaLista();
    initPreferences();  

    super.initState();
  }

  Future<void> initPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
      //     InkWell(
      // onTap: () {},
      // child: Icon(Icons.add),
      // ),
        ],
      ),
      //endDrawer: //derecha,
      drawer: drawerWidget(), // izquierda
      body: Stack(
        children: [
SingleChildScrollView(
  child: Column(
    children:[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Ya hace hambre, ¿no? asdfa',
                style: TextStyle(
                  color: con.black,
                  fontSize: 24,
                  letterSpacing: 1.5
                ),
              ),
            ],
          ),

          SizedBox(
            height: 50,
            width: size.width,
            child: Container(
              color: const Color.fromARGB(255, 213, 207, 207),
              child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const ScrollPhysics(),
              itemCount: singleton.listTitle.length,
              itemBuilder: (BuildContext context,int index){
                var datos = singleton.products[index].split('#');

                return InkWell(
                  onTap: (){
                    setState(() {
                      //singleton.limpiarVariables();
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: size.width * 0.05,
                      right: size.width * 0.05,
                      top: 12,
                    ),
                    child: Text(datos[1],
                      style: TextStyle(
                      color: con.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                    ),
                  )
              );
            },)
            )
            ),

            SizedBox(
              height: size.height * 0.65,
              width: size.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: singleton.products.length ,
                //itemCount: products.length /2,
                itemBuilder: (BuildContext context, int index) {

                  var datos = singleton.products[index].split('#');

                  //inicializar arriba
                  // int i = 0; +2
                  // int j = 0; + 2
                  return 
                  // Column(
                  //   children: [
                  //     Expanded(flex: 6,
                  //     child: Card...

                  //     ),
                  //     Expanded(flex: 6,
                  //     child: Card...

                  //     )
                  //   ]
                  // )

                  InkWell(
                    onTap: (){
                      
                        singleton.productoSeleccionado = datos;
                        prefs.setBool('productoSeleccionado', true);
                        prefs.setStringList('producto', datos);
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => VistaProducto()));
                        //print(datos);
                    },
                  child: Card(
                      margin: EdgeInsets.only(
                        left: size.width * 0.01, right: size.width * 0.01
                      ),

                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircleAvatar(
                                radius: size.width * 0.15,
                                child: Image.asset("images/${datos[4]}",
                                width: size.width *0.15),
                            ),
                            Text(
                                  datos[1],
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                            Text(datos[3],
                                  style: TextStyle(fontWeight: FontWeight.bold, color: con.red),
                                
                              )
                          ],
                        ),
                      )
                    )

                  );
                },
              )
            ),

            
        ])
          )
        ],
      ),
    );
  }
}

 