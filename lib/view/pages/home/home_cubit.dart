import 'package:api_test_caio/data/models/user.dart';
import 'package:api_test_caio/data/repository/interface/user_repository_interface.dart';
import 'package:api_test_caio/view/pages/home/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final IUserRepository _userRepository;
  HomeCubit({required IUserRepository userRepository})
      : _userRepository = userRepository,
        super(
          HomeStateLoading(),
        );

  late List<User> users;
  final animatedListStateKey = GlobalKey<AnimatedListState>();

  Future<void> getUsers() async {
    final response = await _userRepository.fetchUsers();
    response.fold(
      (exception) => emit(
        HomeStateError(),
      ),
      (fetchedUsers) {
        users = fetchedUsers;
        emit(HomeStateLoaded(
          users: users,
        ));
      },
    );
  }

  Future<void> editUser(User user) async {
    final response = await _userRepository.update(user);
    response.fold(
      (exception) => emit(
        HomeStateUserEditFailure(),
      ),
      (editedUser) {
        users[users.indexWhere((element) => element.id == user.id)] =
            editedUser;

        emit(
          HomeStateUserEditedSuccessfully(),
        );
      },
    );
    emit(
      HomeStateLoaded(
        users: users,
      ),
    );
  }

  Future<void> deleteUser(User user, int index) async {
    final response = await _userRepository.delete(user);
    response.fold(
      (exception) => emit(HomeStateUserDeletedFailure()),
      (user) {
        emit(
          HomeStateUserDeletedSuccessfully(index, user),
        );
      },
    );

    users.remove(user);
    emit(
      HomeStateLoaded(
        users: users,
      ),
    );
  }
}
