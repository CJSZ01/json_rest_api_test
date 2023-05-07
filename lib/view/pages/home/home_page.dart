import 'package:api_test_caio/view/components/base_screen.dart';
import 'package:api_test_caio/view/components/loading_screen.dart';
import 'package:api_test_caio/view/pages/home/components/user_tile.dart';
import 'package:api_test_caio/view/pages/home/components/users_list.dart';
import 'package:api_test_caio/view/pages/home/home_cubit.dart';
import 'package:api_test_caio/view/pages/home/home_state.dart';
import 'package:api_test_caio/view/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Usuários'),
        centerTitle: true,
      ),
      backgroundColor: AppColors.secondary,
      body: BlocConsumer<HomeCubit, HomeState>(
        builder: (context, state) {
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: Builder(
              builder: (context) {
                if (state is HomeStateError) {
                  return LoadingScreen.error(
                      key: const Key('error'),
                      message: "Ocorreu um erro ao carregar os usuários.");
                }
                if (state is HomeStateLoaded) {
                  return LayoutBuilder(
                    key: const Key('loaded'),
                    builder: (context, constraints) {
                      return BaseScreen(
                        child: UsersList(
                          users: state.users,
                        ),
                      );
                    },
                  );
                }
                return LoadingScreen(
                  key: const Key('loading'),
                );
              },
            ),
          );
        },
        listener: (context, state) {
          late String message;
          if (state is HomeStateUserEditedSuccessfully) {
            message = 'Usuário atualizado som sucesso.';
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message),
              ),
            );
          }
          if (state is HomeStateUserEditFailure) {
            message = 'Ocorreu um erro ao atualizar o usuário.';
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message),
              ),
            );
          }
          if (state is HomeStateUserDeletedSuccessfully) {
            message = 'Usuário removido com sucesso.';
            context
                .read<HomeCubit>()
                .animatedListStateKey
                .currentState!
                .removeItem(state.index,
                    (BuildContext context, Animation<double> animation) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(-1, 0),
                  end: const Offset(0, 0),
                ).animate(animation),
                child: UserTile(
                  user: state.deletedUser,
                  darkenBackground: false,
                  onEditUser: (user) {},
                  onDeleteUser: () => context
                      .read<HomeCubit>()
                      .deleteUser(state.deletedUser, state.index),
                ),
              );
            }, duration: const Duration(milliseconds: 250));
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message),
              ),
            );
          }
          if (state is HomeStateUserDeletedFailure) {
            message = 'Ocorreu um erro ao remover o usuário.';
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message),
              ),
            );
          }
        },
      ),
    );
  }
}
