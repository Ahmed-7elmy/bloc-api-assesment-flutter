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
      home: RepositoryProvider(
        //not digested
        create: (context) => UserRepository(),
        child: const Home(),
      ),
    );
  }
}
