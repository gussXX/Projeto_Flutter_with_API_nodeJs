import 'dart:convert';
import 'package:http/http.dart' as http;

Future consulta ({required String valor}) async{

  final todo = await fetch(digitado: valor);
  print(todo.toJson());

  print('json user: ${todo.user}');
  print('json Password: ${todo.password}');
  print('json email: ${todo.email}');
}

Future <Todo> fetch({required String digitado,}) async {


  String caminho = 'http://localhost:1234/consultaUnica/${digitado}';
  var url = Uri.parse(caminho);
  print('====================================');
  print(caminho);
  print(digitado);
  print(url);
  print('====================================');
  var response = await http.get(url);
  var json = (jsonDecode(response.body));

  var todo = Todo.fromJson(json);
  return todo; 
}

class Todo{
  final String user;
  final String password;
  final String email;

  Todo({required this.user, required this.password, required this.email});

  factory Todo.fromJson(Map json){
    return Todo(user:     json['user'], 
                password: json['password'], 
                email:    json['email']);
  }

  Map toJson(){
    return {
      'user':     user,
      'password': password,
      'email':    email
    };
  }
}



/*
Future fetch() async {
  var url = Uri.parse('http://localhost:1234/consultaUnicA/');
  var response = await http.get(url);
  var json = (jsonDecode(response.body));

  return json; 
}
*/