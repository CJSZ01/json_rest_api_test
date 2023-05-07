// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_test_caio/view/theme/app_colors.dart';
import 'package:api_test_caio/view/theme/app_textstyles.dart';
import 'package:flutter/material.dart';

import 'package:api_test_caio/data/models/user.dart';
import 'package:flutter/services.dart';

class EditUserDialog extends StatefulWidget {
  final User user;
  final Function(User user) onSubmit;
  const EditUserDialog({
    Key? key,
    required this.user,
    required this.onSubmit,
  }) : super(key: key);

  @override
  State<EditUserDialog> createState() => _EditUserDialogState();
}

class _EditUserDialogState extends State<EditUserDialog> {
  FocusNode emailFocus = FocusNode();

  FocusNode ageFocus = FocusNode();

  final TextEditingController _nameController = TextEditingController();
  TextEditingController get nameController => _nameController;
  final TextEditingController _emailController = TextEditingController();
  TextEditingController get emailController => _emailController;
  final TextEditingController _ageController = TextEditingController();
  TextEditingController get ageController => _ageController;

  final formKey = GlobalKey<FormState>(debugLabel: 'form');

  bool buttonEnabled = true;

  late User editedUser;

  @override
  void initState() {
    editedUser = widget.user;
    _nameController.text = editedUser.name;
    _ageController.text = editedUser.age.toString();
    _emailController.text = editedUser.email;
    super.initState();
  }

  void validateFields() {
    if (_nameController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _ageController.text.isNotEmpty &&
        formKey.currentState!.validate()) {
      editedUser = editedUser.copyWith(
          age: int.parse(_ageController.text),
          name: _nameController.text,
          email: _emailController.text);
      setState(() {
        buttonEnabled = true;
      });
    } else {
      setState(() {
        buttonEnabled = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.secondaryDarker,
      title: Text(
        'Editando ${widget.user.name}',
        style: AppTextstyles.buttonMedium,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Form(
            onChanged: () {
              validateFields();
            },
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    fillColor: AppColors.white,
                    label: const Text('Nome'),
                  ),
                  controller: nameController,
                  maxLines: 1,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor insira seu nome.';
                    }
                    return null;
                  },
                  onFieldSubmitted: (value) => emailFocus.requestFocus(),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    fillColor: AppColors.white,
                    label: const Text('E-Mail'),
                  ),
                  onFieldSubmitted: (value) => ageFocus.requestFocus(),
                  focusNode: emailFocus,
                  keyboardType: TextInputType.emailAddress,
                  maxLines: 1,
                  validator: (value) {
                    if (!RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                    ).hasMatch(value!)) {
                      return 'Por favor insira um e-mail válido.';
                    }
                    return null;
                  },
                  controller: emailController,
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
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  controller: ageController,
                ),
              ],
            ),
          ),
        ],
      ),
      actions: [
        OutlinedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'Cancelar',
            style: AppTextstyles.buttonMedium,
          ),
        ),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          child: buttonEnabled
              ? OutlinedButton(
                  key: const Key(
                    'enabled',
                  ),
                  onPressed: () {
                    widget.onSubmit(editedUser);
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Salvar',
                    style: AppTextstyles.buttonMedium,
                  ),
                )
              : ElevatedButton(
                  key: const Key(
                    'disabled',
                  ),
                  onPressed: null,
                  child: Text(
                    'Salvar',
                    style: AppTextstyles.buttonMedium,
                  ),
                ),
        ),
      ],
    );
  }
}
