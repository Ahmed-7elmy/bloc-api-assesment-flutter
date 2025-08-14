import 'package:bloc/bloc.dart';
import 'package:bloc_assesment/models/UserModel.dart';
import 'package:bloc_assesment/network/UserRepository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository; // Repository to fetch user data
  UserBloc(this._userRepository) : super(UserLoadingState()) {
    //here inherits from Bloc it is saying that is i will start with this specific state
    on<LoadUserEvent>((event, emit) async {
      //on event then emit the new state
      emit(UserLoadingState());
      try {
        final users = await _userRepository.getUsers();
        emit(UserLoadedState(users));
      } catch (e) {
        emit(UserErrorState(e.toString()));
      }
    });
  }
}
