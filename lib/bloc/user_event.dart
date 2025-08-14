part of 'user_bloc.dart';

@immutable
abstract class UserEvent extends Equatable {
  const UserEvent();
}

class LoadUserEvent extends UserEvent {
  const LoadUserEvent();

  @override
  List<Object?> get props => [];
}

// class UserClickEvent extends UserEvent{
//   final UserModel user;
//   const UserClickEvent(this.user);

//   @override
//   List<Object> get props => [user];

// }
