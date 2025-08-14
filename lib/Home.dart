import 'package:bloc_assesment/bloc/user_bloc.dart';
import 'package:bloc_assesment/models/UserModel.dart';
import 'package:bloc_assesment/network/UserRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc/src/bloc_provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          UserBloc(
              RepositoryProvider.of<UserRepository>(context),
            ) //not digested
            ..add(const LoadUserEvent()),
      child: Scaffold(
        appBar: AppBar(title: const Text('the blog app')),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is UserLoadedState) {
              List<UserModel> usersList = state.users;
              return ListView.builder(
                itemCount: usersList.length,
                itemBuilder: (_, index) {
                  return Card(
                    color: const Color.fromARGB(255, 156, 7, 255),
                    elevation: 10,
                    margin: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15,
                    ),
                    child: ListTile(title: Text(usersList[index].title)),
                  );
                },
              );
            }

            if (state is UserErrorState) {
              return const Center(child: Text('Error !'));
            }

            return Container();
          },
        ),
      ),
    );
  }
}
