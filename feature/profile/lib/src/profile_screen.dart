import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:profile/src/profile_bloc/profile_bloc.dart';

import 'profile_form.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileBloc>(
      create: (_) => ProfileBloc(
        getLocalUserUseCase: appLocator<GetLocalUserUseCase>(),
        addUserUseCase: appLocator<AddUserUseCase>(),
        setImageUseCase: appLocator<SetImageUseCase>(),
        setUserUseCase: appLocator<SetUserUseCase>(),
        deleteUserUseCase: appLocator<DeleteUserUseCase>(),
        fetchLocalUserUseCase: appLocator<FetchLocalUserUseCase>(),
      ),
      child: const ProfileForm(),
    );
  }
}
