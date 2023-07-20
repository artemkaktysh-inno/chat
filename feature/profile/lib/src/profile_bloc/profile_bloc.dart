import 'package:core/core.dart';

import 'profile_event.dart';
import 'profile_state.dart';

export 'profile_event.dart';
export 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileState());
}
