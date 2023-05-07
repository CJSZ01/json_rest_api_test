import 'package:api_test_caio/view/pages/home/components/user_tile.dart';
import 'package:api_test_caio/view/pages/home/home_cubit.dart';
import 'package:flutter/material.dart';

import 'package:api_test_caio/data/models/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersList extends StatelessWidget {
  final List<User> users;
  const UsersList({
    Key? key,
    required this.users,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: context.read<HomeCubit>().animatedListStateKey,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index, animation) => SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(-1, 0),
          end: const Offset(0, 0),
        ).animate(CurvedAnimation(
            parent: animation,
            curve: Curves.bounceIn,
            reverseCurve: Curves.bounceOut)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: UserTile(
            user: users[index],
            darkenBackground: index % 2 == 0,
            onEditUser: (user) => context.read<HomeCubit>().editUser(user),
            onDeleteUser: () =>
                context.read<HomeCubit>().deleteUser(users[index], index),
          ),
        ),
      ),
      initialItemCount: users.length,
    );
  }
}
