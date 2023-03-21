import 'package:cp_project/core/global/global.dart';
import 'package:cp_project/features/chat/data/datasources/remote_data_source/chat_source.dart';
import 'package:cp_project/features/chat/data/models/message_model.dart';
import 'package:cp_project/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:cp_project/features/chat/presentation/widgets/conversation_messages.dart';
import 'package:cp_project/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Conversation extends StatelessWidget {
  final String id;
  final String receiver;
  final Message lastMessage;
  final String name;
  final String avatar;
  final String time;
  final bool isRead;

  const Conversation(
      {super.key,
      required this.id,
      required this.name,
      required this.receiver,
      required this.lastMessage,
      required this.avatar,
      required this.time,
      required this.isRead});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        BlocProvider.of<ChatBloc>(context).add(LoadMessagesEvent(id: id));
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: BlocProvider.of<ChatBloc>(context),
                  child: ConversationMessages(
                      id: id, receiver: receiver, name: name, avatar: avatar),
                )));
        if (!isRead) {
          locator<ChatSource>().seenMessage(lastMessage.id);
        }
      },
      child: Container(
        padding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Stack(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(avatar),
                        foregroundColor: AppConst.darkBlue,
                        maxRadius: 30,
                      ),
                    ],
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
                          Text(name,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: !isRead
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                                fontFamily: 'Kumbh_Sans',
                              )),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            lastMessage.body.length > 40
                                ? '${lastMessage.body.substring(0, 40)}...'
                                : lastMessage.body,
                            style: TextStyle(
                                fontSize: 14,
                                color: AppConst.textColor,
                                fontFamily: 'Kumbh_Sans',
                                fontWeight: !isRead
                                    ? FontWeight.bold
                                    : FontWeight.normal),
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
                  fontWeight: !isRead ? FontWeight.bold : FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }
}
