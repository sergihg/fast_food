import 'package:fast_food/login.dart';
import 'package:flutter/material.dart';

import 'package:fast_food/constante.dart' as consta;


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/hamburguesa.jpg"),
                fit: BoxFit.fill
              )
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: size.height * 0.15),
              child: Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(

                onPressed: () {
                  // Navigator.of(context).
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Login()),
                  );
                },
                
                child: Text(
                  'Iniciar sesión', 
                  style: TextStyle(
                    color: consta.white,
                    fontSize: 20,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: consta.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)
                  ),
                  fixedSize:  Size(size.width * 0.6, 45)
                ),
              )
            ),
          ),

          Padding(
            padding: EdgeInsets.only(bottom: size.height * 0.05),
              child: Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(

                onPressed: () {},
                
                child: Text(
                  'Registrarse', 
                  style: TextStyle(
                    color: consta.white,
                    fontSize: 20,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: consta.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)
                  ),
                  fixedSize:  Size(size.width * 0.6, 45)
                ),
              )
            ),
          ),

        ],
      ),
    );
  }
}