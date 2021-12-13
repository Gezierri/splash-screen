import 'package:flutter_splash/models/post_model.dart';

abstract class PostRepository{

  Future<List<PostModel>> getList();
}