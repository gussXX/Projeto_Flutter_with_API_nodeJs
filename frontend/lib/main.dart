import 'package:flutter/material.dart';
import 'package:frontend/api/consultar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      title: 'FrontEnd',
      theme:  ThemeData(primarySwatch: Colors.purple),
      home:   MyHomePage(title: 'Transmissão de Variavel', valor:'aqui'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title, required this.valor}) : super(key: key);
  final String title;
  final String valor;

  createState(){
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {

  //VARIAVEIS
  String variavel = 'pivo';
  late var digitado;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar:   AppBar(
      title:    Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '${widget.title}',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              '${widget.valor}',
              style: Theme.of(context).textTheme.headline4,
            ),

            Container(
              width: 620,
              height: 620,
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Colors.amber[900],
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(100),
                    blurRadius: 50,
                    offset: Offset(0,1),
                    spreadRadius: 1
                  )
                ]            
              ),
              child: Column(children: [

                Container(
                  padding: EdgeInsets.all(5),
                  child: Text('Usuario',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                    ),
                  ),
                ),
                TextField(
                  onSubmitted: (value) => {
                    if(value.isEmpty){
                      null
                    }else {
                       digitado = value,
                       print(digitado),
                    }
                  },
                  obscureText: false,
                  decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(20),
                  border: OutlineInputBorder(),
                  labelText: 'Usuario',      
                    ),
                  ),

                SizedBox(height: 50),

                  TextButton(
                    onPressed: () => {
                      consulta(valor: digitado)
                    },
                    child: Text('Enviar',
                      style: TextStyle(
                        fontSize: 50,
                      )
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>{
        },
        tooltip: 'texto de referencia',
        child: Icon(Icons.add),
      ),
    );
  }
}
