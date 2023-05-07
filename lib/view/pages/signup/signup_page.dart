import 'package:api_test_caio/view/components/base_screen.dart';
import 'package:api_test_caio/view/components/loading_screen.dart';
import 'package:api_test_caio/view/pages/signup/signup_cubit.dart';
import 'package:api_test_caio/view/pages/signup/signup_state.dart';
import 'package:api_test_caio/view/routes.dart';
import 'package:api_test_caio/view/theme/app_colors.dart';
import 'package:api_test_caio/view/theme/app_textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    FocusNode emailFocus = FocusNode();
    FocusNode ageFocus = FocusNode();
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state.success) {
          Navigator.pushReplacementNamed(context, AppRoutes.home);
        }
      },
      builder: (context, state) {
        final cubit = context.read<SignupCubit>();

        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          child: state.isLoading
              ? LoadingScreen(
                  key: const Key('loading'),
                )
              : state.error != null
                  ? LoadingScreen.error(
                      key: const Key('error'),
                      message: 'Ocorreu um erro ao realizar o cadastro',
                    )
                  : Scaffold(
                      key: const Key('success'),
                      appBar: AppBar(
                        automaticallyImplyLeading: true,
                        centerTitle: true,
                        title: Text(
                          'Cadastro',
                          style: AppTextstyles.buttonMedium,
                        ),
                      ),
                      body: BaseScreen(
                        backgroundPosition: BackgroundPosition.right,
                        child: SingleChildScrollView(
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              return Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(
                                        constraints.maxWidth / 8),
                                    child: Form(
                                      onChanged: () {
                                        cubit.validateFields();
                                      },
                                      key: cubit.formKey,
                                      child: Column(
                                        children: [
                                          TextFormField(
                                            decoration: InputDecoration(
                                              fillColor: AppColors.white,
                                              label: const Text('Nome'),
                                            ),
                                            controller: cubit.nameController,
                                            maxLines: 1,
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'Por favor insira seu nome.';
                                              }
                                              return null;
                                            },
                                            onFieldSubmitted: (value) =>
                                                emailFocus.requestFocus(),
                                          ),
                                          const SizedBox(
                                            height: 16,
                                          ),
                                          TextFormField(
                                            decoration: InputDecoration(
                                              fillColor: AppColors.white,
                                              label: const Text('E-Mail'),
                                            ),
                                            onFieldSubmitted: (value) =>
                                                ageFocus.requestFocus(),
                                            focusNode: emailFocus,
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            maxLines: 1,
                                            validator: (value) {
                                              if (!RegExp(
                                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                                              ).hasMatch(value!)) {
                                                return 'Por favor insira um e-mail válido.';
                                              }
                                              return null;
                                            },
                                            controller: cubit.emailController,
                                          ),
                                          const SizedBox(
                                            height: 16,
                                          ),
                                          TextFormField(
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'Por favor insira sua idade.';
                                              }
                                              return null;
                                            },
                                            focusNode: ageFocus,
                                            decoration: InputDecoration(
                                              fillColor: AppColors.white,
                                              label: const Text('Idade'),
                                              counterText: '',
                                            ),
                                            keyboardType: TextInputType.number,
                                            maxLines: 1,
                                            maxLength: 3,
                                            inputFormatters: [
                                              FilteringTextInputFormatter
                                                  .digitsOnly,
                                            ],
                                            controller: cubit.ageController,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  AnimatedSwitcher(
                                    duration: const Duration(milliseconds: 250),
                                    child: state.buttonEnabled
                                        ? OutlinedButton(
                                            key: const Key(
                                              'enabled',
                                            ),
                                            onPressed: () {
                                              cubit.signUp();
                                            },
                                            child: Text(
                                              'Cadastrar',
                                              style: AppTextstyles.buttonMedium,
                                            ),
                                          )
                                        : ElevatedButton(
                                            key: const Key(
                                              'disabled',
                                            ),
                                            onPressed: null,
                                            child: Text(
                                              'Cadastrar',
                                              style: AppTextstyles.buttonMedium,
                                            ),
                                          ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ),
        );
      },
    );
  }
}
