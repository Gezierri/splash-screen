import 'package:flutter/cupertino.dart';
import 'package:flutter_splash/models/post_model.dart';
import 'package:flutter_splash/repository/post_repository.dart';

class HomeController{

  final PostRepository _postRepository;
  HomeController(this._postRepository);

  ValueNotifier<List<PostModel>> posts = ValueNotifier<List<PostModel>>([]);

  fetch() async{
    posts.value = await _postRepository.getList();
  }
}