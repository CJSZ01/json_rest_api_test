// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:api_test_caio/data/models/user.dart';

abstract class HomeState extends Equatable {}

class HomeStateLoading extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeStateError extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeStateLoaded extends HomeState {
  final List<User> users;

  HomeStateLoaded({
    required this.users,
  });

  @override
  List<Object?> get props => [
        users,
      ];
}

class HomeStateUserEditedSuccessfully extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeStateUserEditFailure extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeStateUserDeletedSuccessfully extends HomeState {
  final int index;
  final User deletedUser;

  HomeStateUserDeletedSuccessfully(this.index, this.deletedUser);
  @override
  List<Object?> get props => [index, deletedUser];
}

class HomeStateUserDeletedFailure extends HomeState {
  @override
  List<Object?> get props => [];
}
