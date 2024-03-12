import 'package:fast_food/home.dart';
import 'package:fast_food/utils/singleton.dart';
import 'package:fast_food/vista_producto.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Singleton singleton = Singleton();  //forma de accedera a las variables de la clase
  //singleton: un punto de acceso global

  late final SharedPreferences prefs;
  
  final usuario = TextEditingController();
  final contra = TextEditingController();

  @override
  void initState() {
    //llamar a otras funciones para hacer funciones asincronas
    initPreferences();  
    super.initState();
  }

  Future<void> initPreferences() async {
    prefs = await SharedPreferences.getInstance();
    checkIsLogin();
  }

  void checkIsLogin() {
    // String pass = (prefs.getString('pass') ?? '');
    // String user = (prefs.getString('user') ?? '');

    bool band = (prefs.getBool('logeado') ?? false);
    // String user = (prefs.getString('idProducto') ?? '');

    //if(user == '' && pass == '') {
    if(band) {
      if(prefs.getBool('productoSeleccionado') == true) {
        var datos = prefs.getStringList('producto');
        singleton.productoSeleccionado = datos!;
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const VistaProducto()));
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const Home())
        );
    }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [

              TextFormField(
                controller: usuario,
              ),
              TextFormField(
                controller: contra,
                obscureText: true,
              ),

              /*
                TextFormField -> Usuario
                TextFormField -> password
              */

              ElevatedButton(
                onPressed: (){
                  setState(() {
                    if(usuario.text == 'sergio' && contra.text == '123')
                    {
                      singleton.user = usuario.text;
                      singleton.pass = contra.text;

                      // prefs.setString('user', usuario.text);
                      // prefs.setString('pass', contra.text);
                      prefs.setBool('logeado', true);

                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Home()));
                    }
                    else {
                      //aparece el mensaje de error
                    }
                    
                  });
                }, 
                child: Text(''))
            ],
          )
        ],
      )
    );
  }
}