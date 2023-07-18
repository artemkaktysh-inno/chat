import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:profile/src/profile_bloc/profile_bloc.dart';

import 'profile_form.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileBloc(),
      child: const ProfileForm(),
    );
  }
}
