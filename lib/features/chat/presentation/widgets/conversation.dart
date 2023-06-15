import 'package:cp_project/core/global/global.dart';
import 'package:cp_project/features/chat/data/models/message_model.dart';
import 'package:cp_project/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:cp_project/features/chat/presentation/widgets/avatar.dart';
import 'package:cp_project/features/chat/presentation/widgets/conversation_messages.dart';
import 'package:cp_project/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class Conversation extends StatelessWidget {
  static const stats = [MessageStatus.typing, MessageStatus.none];

  final String id;
  final String receiver;
  final Message lastMessage;
  final String name;
  final String avatar;
  final String time;
  final bool isRead;
  final bool isOnline;
  final DateTime? lastOnline;

  const Conversation({
    super.key,
    required this.id,
    required this.name,
    required this.receiver,
    required this.lastMessage,
    required this.avatar,
    required this.time,
    required this.isRead,
    required this.isOnline,
    required this.lastOnline,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        PersistentNavBarNavigator.pushNewScreen(
          context,
          screen: ConversationMessages(
            id: id,
            receiver: receiver,
            name: name,
            avatar: avatar,
            isOnline: isOnline,
            lastOnline: lastOnline,
          ) ,
          withNavBar: false, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Avatar(
                    avatar: avatar,
                    isOnline: isOnline,
                    backgroundColor: Colors.white,
                    lastOnline: lastOnline,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            name,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight:
                                  !isRead ? FontWeight.bold : FontWeight.normal,
                              fontFamily: 'Kumbh_Sans',
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          BlocBuilder<ChatMessagesBloc, ChatMessagesSate>(
                            bloc: locatorMessagesBloc(instanceName: id),
                            buildWhen: (_, c) =>
                                c.status == ChatStatus.messageOperation &&
                                stats.contains(c.messageStatus),
                            builder: (_, s) => Text(
                              s.messageStatus == MessageStatus.typing
                                  ? 'Typing...'
                                  : lastMessage.body.length > 40
                                      ? '${lastMessage.body.substring(0, 40)}...'
                                      : lastMessage.body.isEmpty
                                          ? '${lastMessage.isSender ? 'You' : name.split(' ')[0]} ${lastMessage.deleted ? 'unsent a message' : 'sent an attachment'}'
                                          : lastMessage.body,
                              style: TextStyle(
                                fontSize: 14,
                                color: AppConst.textColor,
                                fontFamily: 'Kumbh_Sans',
                                fontWeight: !isRead
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (!isRead)
              const Badge(
                largeSize: 14,
                smallSize: 12,
                backgroundColor: AppConst.orong,
              ),
            const SizedBox(width: 5),
            Text(
              time,
              style: TextStyle(
                fontSize: 12,
                fontWeight: !isRead ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
