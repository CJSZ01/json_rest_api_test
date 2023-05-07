import 'package:api_test_caio/data/models/user.dart';
import 'package:api_test_caio/data/repository/interface/user_repository_interface.dart';
import 'package:api_test_caio/view/pages/signup/signup_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupCubit extends Cubit<SignupState> {
  final IUserRepository _userRepository;
  SignupCubit({required IUserRepository userRepository})
      : _userRepository = userRepository,
        super(
          const SignupState(false, false, null, false),
        );

  final TextEditingController _nameController = TextEditingController();
  TextEditingController get nameController => _nameController;
  final TextEditingController _emailController = TextEditingController();
  TextEditingController get emailController => _emailController;
  final TextEditingController _ageController = TextEditingController();
  TextEditingController get ageController => _ageController;

  final formKey = GlobalKey<FormState>(debugLabel: 'form');

  void validateFields() {
    if (_nameController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _ageController.text.isNotEmpty &&
        formKey.currentState!.validate()) {
      emit(
        state.copyWith(
          buttonEnabled: true,
        ),
      );
    } else {
      emit(
        state.copyWith(
          buttonEnabled: false,
        ),
      );
    }
  }

  void signUp() async {
    emit(
      state.copyWith(isLoading: true),
    );
    final User userRequest = User(
      name: nameController.text,
      email: emailController.text,
      age: int.parse(ageController.text),
    );
    await Future.delayed(
      const Duration(
        seconds: 2,
      ),
    );

    final response = await _userRepository.signUp(userRequest);
    response.fold(
      (left) => emit(
        state.copyWith(
            isLoading: false, error: 'Ocorreu um erro ao criar seu usuário.'),
      ),
      (right) {
        emit(
          state.copyWith(isLoading: true, success: true),
        );
      },
    );
  }
}
