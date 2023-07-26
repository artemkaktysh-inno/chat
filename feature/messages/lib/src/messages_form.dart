import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:messages/src/bloc/messages_bloc.dart';
import 'package:messages/src/widgets/chats_list.dart';

class MessagesForm extends StatefulWidget {
  const MessagesForm({super.key});

  @override
  State<MessagesForm> createState() => _MessagesFormState();
}

class _MessagesFormState extends State<MessagesForm> {
  final TextEditingController uuidController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MessagesBloc, MessagesState>(
      builder: (
        BuildContext context,
        MessagesState state,
      ) {
        return Column(
          children: <Widget>[
            Container(
              height: AppDimens.heightAppBar,
              alignment: Alignment.centerRight,
              color: AppColors.of(context).gray,
              child: InkWell(
                onTap: () {
                  showNewChatModalBottomSheet(context);
                },
                child: Row(
                  children: <Widget>[
                    Text(
                      'new_chat'.tr(),
                      style: AppFonts.normal14,
                    ),
                    SvgPicture.asset(
                      AppImages.newChatIcon,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: state.chats.isEmpty
                  ? Container(
                      alignment: Alignment.center,
                      child: Column(
                        children: <Widget>[
                          Text('empty'.tr()),
                          Text('create'.tr()),
                          IconButton(
                            onPressed: () {
                              showNewChatModalBottomSheet(context);
                            },
                            icon: SvgPicture.asset(
                              AppImages.newChatLargeIcon,
                            ),
                          ),
                        ],
                      ),
                    )
                  : ChatList(
                      chats: state.chats,
                      users: state.users,
                    ),
            ),
          ],
        );
      },
    );
  }

  void showNewChatModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: SvgPicture.asset(AppImages.cancelIcon),
              ),
            ),
            Expanded(
              child: Container(
                height: AppDimens.heightNewChat,
                decoration: BoxDecoration(
                  color: AppColors.of(context).white,
                ),
                child: Column(
                  children: <Widget>[
                    AppTextField(
                      controller: uuidController,
                      hintText: 'uuid'.tr(),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<MessagesBloc>(context).add(
                          NewChatEvent(uuid: uuidController.value.text),
                        );
                      },
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
                      child: Text('create'.tr()),
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
    super.dispose();
  }
}
