import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:domain/usecases/usecase.dart';

import 'profile_event.dart';
import 'profile_state.dart';

export 'profile_event.dart';
export 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetLocalUserUseCase _getLocalUserUseCase;
  final AddUserUseCase _addUserUseCase;
  final SetImageUseCase _setImageUseCase;
  final SetUserUseCase _setUserUseCase;
  final DeleteUserUseCase _deleteUserUseCase;
  final FetchLocalUserUseCase _fetchLocalUserUseCase;

  ProfileBloc({
    required GetLocalUserUseCase getLocalUserUseCase,
    required AddUserUseCase addUserUseCase,
    required SetImageUseCase setImageUseCase,
    required SetUserUseCase setUserUseCase,
    required DeleteUserUseCase deleteUserUseCase,
    required FetchLocalUserUseCase fetchLocalUserUseCase,
  })  : _getLocalUserUseCase = getLocalUserUseCase,
        _addUserUseCase = addUserUseCase,
        _setImageUseCase = setImageUseCase,
        _setUserUseCase = setUserUseCase,
        _deleteUserUseCase = deleteUserUseCase,
        _fetchLocalUserUseCase = fetchLocalUserUseCase,
        super(
          const ProfileState(
            isAuthorized: false,
            imagePath: '',
            isDisabled: true,
            username: '',
            uuid: '',
          ),
        ) {
    on<InitEvent>(_onInitEvent);
    on<EditEvent>(_onEditEvent);
    on<SaveEvent>(_onSaveEvent);
    on<DeleteUserEvent>(_onDeleteUserEvent);
    add(InitEvent());
  }

  Future<void> _onEditEvent(
    EditEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(
      state.copyWith(
        isAuthorized: state.isAuthorized,
        imagePath: state.imagePath,
        isDisabled: false,
        username: state.username,
        uuid: state.uuid,
      ),
    );
  }

  Future<void> _onInitEvent(
    InitEvent event,
    Emitter<ProfileState> emit,
  ) async {
    final User? user = _getLocalUserUseCase.execute(const NoParams());
    if (user != null) {
      emit(
        state.copyWith(
          isAuthorized: true,
          imagePath: user.imageUrl,
          isDisabled: state.isDisabled,
          uuid: user.uuid,
          username: user.username,
        ),
      );
    }
  }

  Future<void> _onSaveEvent(
    SaveEvent event,
    Emitter<ProfileState> emit,
  ) async {
    if (event.uuid == '' || event.username == '') {
      return;
    }
    if (state.username == '') {
      _addUserUseCase.execute(
        User(
          username: event.username,
          uuid: event.uuid,
          imageUrl: event.photo != null ? event.photo!.path : '',
        ),
      );
      emit(
        state.copyWith(
          isDisabled: true,
          isAuthorized: true,
          username: event.username,
          uuid: event.uuid,
          imagePath: event.photo != null ? event.photo!.path : '',
        ),
      );
    } else {
      _setUserUseCase.execute(
        User(
          username: event.username,
          uuid: event.uuid,
          imageUrl: event.photo != null
              ? event.photo!.path
              : (state.imagePath != '' ? state.imagePath : ''),
        ),
      );
      emit(
        state.copyWith(
          isAuthorized: true,
          isDisabled: true,
          uuid: event.uuid,
          username: event.username,
          imagePath: state.imagePath,
        ),
      );
    }
  }

  Future<void> _onDeleteUserEvent(
    DeleteUserEvent event,
    Emitter<ProfileState> emit,
  ) async {
    _deleteUserUseCase.execute(const NoParams());
    emit(
      const ProfileState(
        isAuthorized: false,
        imagePath: '',
        isDisabled: true,
        uuid: '',
        username: '',
      ),
    );
  }
}
