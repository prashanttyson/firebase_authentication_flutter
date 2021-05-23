


import 'dart:convert';
import 'dart:io';

import 'package:flutter_provider/business_logic/models/httpresponse.dart';
import 'package:flutter_provider/business_logic/models/post.dart';
import 'package:http/http.dart' as http;

class APIHelper{
 static Future<HTTPResponse<List<Post>>> getPost({int limit = 20, int page = 1}) async {
String url = 'https://jsonplaceholder.typicode.com/posts?_limit=$limit&_page=$page';
try{
 var response = await http.get(Uri.parse(url));
 if(response.statusCode == 200){
   var body= jsonDecode(response.body);
   List<Post> postsList = [];
   body.forEach((e){
     Post post = Post.fromJson(e);
     postsList.add(post);

 });
   return HTTPResponse(true, postsList,
 responseCode:response.statusCode);
 } else{
 return HTTPResponse(false, null,
 message: 'Unable to reach the internet! Please try again in a minute or two.',
 responseCode: response.statusCode,
 );
 }
 }on SocketException{
  return HTTPResponse(false, null, message: 'Unable to reach the internet! Please try again in a minute or two.',
 );
}
 on FormatException {
return HTTPResponse(false, null, message: 'Invalid response received from the server!Please try again in a minute or two.',);

}
 catch (e) {
return HTTPResponse(false, null, message: 'Something went wrong!Please try again in a minute or two.',);

}

  }
}