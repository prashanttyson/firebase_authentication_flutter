import 'package:flutter/material.dart';
import 'package:flutter_provider/business_logic/models/post.dart';

class DashBoardProvider extends ChangeNotifier{
  bool _isProcessing = true;
  List<Post> _postsList = [];
  bool get isProcessing => _isProcessing;

  setIsProcessing(bool value){
    _isProcessing = value;
    notifyListeners();
  }

  List<Post> get postsList => _postsList;

  setPostsList(List<Post> list){
    _postsList = list;
    notifyListeners();
  }

  mergePostsList(List<Post> list){
    _postsList.addAll(list);
    notifyListeners();
  }
  Post getPostByIndex(int index)=> _postsList[index];
}