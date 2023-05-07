import 'package:api_test_caio/view/pages/home/components/edit_user_dialog.dart';
import 'package:api_test_caio/view/theme/app_colors.dart';
import 'package:api_test_caio/view/theme/app_textstyles.dart';
import 'package:flutter/material.dart';

import 'package:api_test_caio/data/models/user.dart';

class UserTile extends StatelessWidget {
  final User user;
  final bool darkenBackground;
  final VoidCallback onDeleteUser;
  final Function(User user) onEditUser;

  const UserTile({
    Key? key,
    required this.user,
    required this.darkenBackground,
    required this.onDeleteUser,
    required this.onEditUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.secondaryDarker,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 0.05,
            blurRadius: 2,
            offset: const Offset(0, 4), // changes position of shadow
          ),
        ],
        color: darkenBackground ? AppColors.secondary : AppColors.secondaryDark,
        borderRadius: const BorderRadius.all(
          Radius.circular(32),
        ),
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 16,
          ),
          Flexible(
            fit: FlexFit.tight,
            child: Text(user.name,
                overflow: TextOverflow.fade,
                maxLines: 2,
                style: AppTextstyles.listLabel),
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColors.secondary,
              border: Border.all(
                color: AppColors.secondaryDarker,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(32),
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: onDeleteUser,
              icon: Icon(
                Icons.delete_outline,
                color: AppColors.secondaryDarker,
                size: 32,
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColors.secondary,
              border: Border.all(
                color: AppColors.secondaryDarker,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(32),
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () => showDialog(
                context: context,
                builder: (context) =>
                    EditUserDialog(user: user, onSubmit: onEditUser),
              ),
              icon: Icon(
                Icons.edit_outlined,
                color: AppColors.secondaryDarker,
                size: 32,
              ),
            ),
          )
        ],
      ),
    );
  }
}
