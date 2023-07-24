import 'dart:io';

import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:profile/src/profile_bloc/profile_bloc.dart';
import 'package:profile/src/widgets/profile_text_field.dart';

class ProfileForm extends StatefulWidget {
  const ProfileForm({super.key});

  @override
  State<ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  final TextEditingController uuidController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final ImagePicker imagePicker = ImagePicker();
  File? _pickedFile;

  Future<void> pickImage({
    required ImageSource imageSource,
  }) async {
    final XFile? pickedFile = await imagePicker.pickImage(
      source: imageSource,
    );
    if (pickedFile != null) {
      setState(() {
        _pickedFile = File(pickedFile.path);
      });
    }
  }

  void showPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: Text('gallery'.tr()),
                onTap: () async {
                  await pickImage(
                    imageSource: ImageSource.gallery,
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: Text('camera'.tr()),
                onTap: () async {
                  await pickImage(
                    imageSource: ImageSource.camera,
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (BuildContext context, ProfileState state) {
        return Column(
          children: <Widget>[
            Container(
              height: AppDimens.heightAppBar,
              alignment: Alignment.centerRight,
              color: AppColors.of(context).gray,
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 11,
                ),
                child: PopupMenuButton(
                  offset: const Offset(0.0, 50.0),
                  child: SvgPicture.asset(
                    AppImages.moreIcon,
                  ),
                  itemBuilder: (BuildContext context) {
                    return <PopupMenuItem>[
                      PopupMenuItem(
                        height: 40,
                        child: InkWell(
                          onTap: () {
                            BlocProvider.of<ProfileBloc>(context)
                                .add(DeleteUserEvent());
                          },
                          child: SizedBox(
                            height: 40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SvgPicture.asset(AppImages.trashIcon),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    'delete_account'.tr(),
                                    style: AppFonts.normal20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ];
                  },
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          _pickedFile == null && state.imagePath == ''
                              ? SvgPicture.asset(
                                  AppImages.accountIcon,
                                )
                              : (_pickedFile == null)
                                  ? Image.network(
                                      state.imagePath,
                                      height: 100,
                                      width: 100,
                                    )
                                  : Image.file(
                                      _pickedFile!,
                                      height: 100,
                                      width: 100,
                                    ),
                          if (!state.isDisabled)
                            IconButton(
                              onPressed: () {
                                showPicker(context);
                              },
                              icon: SvgPicture.asset(
                                AppImages.plusIcon,
                              ),
                            ),
                        ],
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        ProfileTextField(
                          controller: uuidController,
                          hintText: state.uuid != '' ? state.uuid : 'uuid'.tr(),
                          disabled: state.isDisabled,
                          errorText: state.isAlreadyExists
                              ? 'already_exists'.tr()
                              : null,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 11.0, bottom: 14),
                          child: ProfileTextField(
                            errorText: null,
                            disabled: state.isDisabled,
                            controller: nameController,
                            hintText: state.username != ''
                                ? state.username
                                : ''
                                        'username'
                                    .tr(),
                          ),
                        )
                      ],
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        textStyle: AppFonts.robotoBold16.copyWith(
                          color: AppColors.of(context).white,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(AppDimens.BORDER_RADIUS_8),
                        ),
                        backgroundColor: AppColors.of(context).blue,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        child: Text(
                          state.isDisabled ? 'edit'.tr() : 'save'.tr(),
                        ),
                      ),
                      onPressed: () {
                        BlocProvider.of<ProfileBloc>(context).add(
                          state.isDisabled
                              ? EditEvent()
                              : SaveEvent(
                                  uuid: uuidController.value.text != ''
                                      ? uuidController.value.text
                                      : state.uuid,
                                  username: nameController.value.text != ''
                                      ? nameController.value.text
                                      : state.username,
                                  photo: _pickedFile,
                                ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    uuidController.dispose();
    nameController.dispose();
    super.dispose();
  }
}
