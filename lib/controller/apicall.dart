import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiCall{

  var data;

Future<void> getUserApi()async{
  final response =await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

  if(response.statusCode == 200){
    data =  jsonDecode(response.body.toString());

  }else{

  }
}

}