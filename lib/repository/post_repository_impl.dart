
import 'package:dio/dio.dart';
import 'package:flutter_splash/models/post_model.dart';
import 'package:flutter_splash/repository/post_repository.dart';

class PostRepositoryImpl implements PostRepository {

  @override
  Future<List<PostModel>> getList() async {
    try{
      var response = await Dio().get('https://jsonplaceholder.typicode.com/posts/');
      return (response.data as List).map((e) => PostModel.fromJson(e)).toList();
    }catch(e){
        print(e);
    }
    return [];
  }
}
