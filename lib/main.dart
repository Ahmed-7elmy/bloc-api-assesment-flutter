import 'package:bloc_assesment/Home.dart';
import 'package:bloc_assesment/network/UserRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      /// Sets the `home` property of the app to a widget wrapped with `RepositoryProvider`,
      /// which provides a repository instance to the widget subtree for dependency injection.
      /// This is commonly used in Flutter apps with the BLoC pattern to make repositories
      /// accessible to BLoCs and widgets below in the widget tree.
      ///
      ///
      home: RepositoryProvider(
        //not digested
        create: (context) => UserRepository(),
        child: const Home(),
      ),
    );
  }
}
