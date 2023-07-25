import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:messages/src/messages_bloc/messages_bloc.dart';
import 'package:messages/src/widgets/chats_list.dart';

class MessagesForm extends StatefulWidget {
  const MessagesForm({super.key});

  @override
  State<MessagesForm> createState() => _MessagesFormState();
}

class _MessagesFormState extends State<MessagesForm> {
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
                  BlocProvider.of<MessagesBloc>(context).add(NewChatEvent());
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
                              BlocProvider.of<MessagesBloc>(context)
                                  .add(NewChatEvent());
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
                    ),
            ),
          ],
        );
      },
    );
  }
}
