import 'package:flutter/material.dart';
import 'package:flutter_splash/service/prefes_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.wait([
      PrefsService.isAuth(),
      Future.delayed(const Duration(seconds: 5)),
    ]).then((value) => value[0]
        ? Navigator.of(context).pushReplacementNamed('/home')
        : Navigator.of(context).pushReplacementNamed('/login'));
    /*Future.delayed(const Duration(seconds: 5)).then(
      (_) => Navigator.of(context).pushReplacementNamed('/login'),
    );*/
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      child: const Center(
        child: SizedBox(
          height: 100,
          width: 100,
          child: CircularProgressIndicator(
            color: Colors.amber,
          ),
        ),
      ),
    );
  }
}
