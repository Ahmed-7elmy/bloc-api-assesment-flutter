part of 'user_bloc.dart';

@immutable
abstract class UserState extends Equatable {
  
}

final class UserLoadingState extends UserState {
  @override
  List<Object?> get props => [];
}

final class UserLoadedState extends UserState {
  final List<UserModel> users;
   UserLoadedState(this.users);

  @override
  List<Object?> get props => [users];
}


final class UserErrorState extends UserState {
  final String error;
   UserErrorState(this.error);

  @override
  List<Object?> get props => [error];
}


 