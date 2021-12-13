import 'package:flutter/material.dart';
import 'package:flutter_splash/controller/home_controller.dart';
import 'package:flutter_splash/models/post_model.dart';
import 'package:flutter_splash/repository/post_repository_impl.dart';
import 'package:flutter_splash/service/prefes_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _homeController = HomeController(PostRepositoryImpl());

  @override
  void initState() {
    super.initState();
    _homeController.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Home'),
        ),
        actions: [
          IconButton(
            onPressed: () {
              PrefsService.logout();
              Navigator.of(context).pushNamedAndRemoveUntil('/login', (_) => true);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: ValueListenableBuilder<List<PostModel>>(
        valueListenable: _homeController.posts,
        builder: (_, list, __) {
          return ListView.separated(
            itemCount: list.length,
            itemBuilder: (_, idx) => ListTile(
              leading: Text(
                list[idx].id.toString(),
              ),
              trailing: const Icon(
                Icons.arrow_forward,
              ),
              title: Text(
                list[idx].title.toString(),
              ),
              onTap: () => Navigator.of(context)
                  .pushNamed('/details', arguments: list[idx]),
            ),
            separatorBuilder: (_, __) => const Divider(
              height: 20,
              indent: 20,
              thickness: 2,
              endIndent: 15,
              color: Colors.white10,
            ),
          );
        },
      ),
    );
  }
}
