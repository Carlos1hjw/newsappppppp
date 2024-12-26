import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:newsappppppp/model/newsmodelscreen.dart';

class Newscontroller with ChangeNotifier{
 News? news;
int selectedindex = 0;
  bool isLoading=false;
  List<News> newscategory=[];

  
  Future<void>getnews() async {
    final url=Uri.parse("https://newsapi.org/v2/top-headlines?country=us&apiKey=89103bbdfae1414fa176c6902266e58f");
    try{
      isLoading=true;
      notifyListeners();
     final response = await http.get(url);
     if(response.statusCode>=200 && response.statusCode>=200){
      print("success");
      log(response.body.toString());
      news=News.fromJson(jsonDecode(response.body));

      
     }
    }catch(e){
      print(e.toString());
    }
    isLoading=false;
    notifyListeners();
  }
 

}
