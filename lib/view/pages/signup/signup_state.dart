// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class SignupState extends Equatable {
  final bool buttonEnabled;
  final bool isLoading;
  final String? error;
  final bool success;
  const SignupState(
      this.buttonEnabled, this.isLoading, this.error, this.success);

  @override
  List<Object?> get props => [buttonEnabled, isLoading, error, success];

  SignupState copyWith({
    bool? buttonEnabled,
    bool? isLoading,
    String? error,
    bool? success,
  }) {
    return SignupState(
        buttonEnabled ?? this.buttonEnabled,
        isLoading ?? this.isLoading,
        error ?? this.error,
        success ?? this.success);
  }
}
