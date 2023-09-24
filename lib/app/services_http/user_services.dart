// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class UserServices {
//  final String ruta="http://192.168.100.36:5500";

//   pruebaApi() async{
//       var url = Uri.parse(ruta + "/session/loguear");
//       Map<String, String> hola= {
//          "Content-type":"application/json",
//          "Cookie":"sessionid=qhkg512xwhm7ecwma28mnwhpeo6okz02" };
      
      
//       var response = await http.post(url,body: {"username":"slg_01","password":"sanluisgeminis"});
//       print(response.headers["set-cookie"]);
//       print(response.headers.toString().substring(135,177));//csrftoken=6MaRNw3KdVeQcw8xXcTOwG5XcR1SkWKR}
//       print("nada nada-----");
     

//   }

// }