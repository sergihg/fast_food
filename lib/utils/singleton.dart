class Singleton {
  static Singleton?  _instance;

  Singleton._internal() {
    _instance = this;
  }

  factory Singleton() => _instance ?? Singleton._internal();

  // int variablesEntera = 0;
  // double variables = 0.0;
  // String data = "";
  // List Lista = [];

  String user = '';
  String pass = '';
  
  List<String> productoSeleccionado = [];

  List listTitle = [];
  List products = [];

  void limpiarVariables()
  {
    user = '';
    pass = '';
    
  }
  void limpiarSeleccion()
  {
    productoSeleccionado = [];
  }

  void inicializaLista()
  {
                  //id,separador,nombre
    listTitle.add('1#Comida');
    listTitle.add('2#Bebidas');
    listTitle.add('3#Snack');
    listTitle.add('4#Complementos');
                //id#nombre#categoria#precio#nombre.png
    products.add('1#Hamburguesa#Comida#\$50.00#hamburguesa.jpg');
    products.add('2#Boneless#Comida#\$30.00#hamburguesa.jpg');
    products.add('3#Alitas#Comida#\$60.00#hamburguesa.jpg');
    products.add('4#Pizza#Comida#\$70.00#hamburguesa.jpg');
    products.add('5#Refresco#Bebidas#\$30.00#hamburguesa.jpg');
    products.add('6#Malteada#Bebidas#\$80.00#hamburguesa.jpg');
    products.add('7#Cerveza#Bebidas#\$80.00#hamburguesa.jpg');
    products.add('8#Papas#Snack#\$80.00#hamburguesa.jpg');
    products.add('9#Chocolates#Snack#\$20.00#hamburguesa.jpg');
    products.add('10#Cacahuates#Snack#\$25.00#hamburguesa.jpg');
  }
  
}