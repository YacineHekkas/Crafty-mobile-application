import 'package:cp_project/core/global/global.dart';
import 'package:cp_project/features/chat/data/datasources/remote_data_source/chat_source.dart';
import 'package:cp_project/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:cp_project/features/chat/presentation/widgets/conversation.dart';
import 'package:cp_project/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timeago/timeago.dart' as timeago;

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: place this where it blong
    locator<ChatBloc>().add(LoadConversationsEvent());
    timeago.setLocaleMessages('en', TimeagoSettings());
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppConst.darkBlue,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          surfaceTintColor: Colors.transparent,
          shadowColor: Colors.transparent,
          backgroundColor: AppConst.darkBlue,
          flexibleSpace: SafeArea(
              child: Container(
            height: 65,
            padding: const EdgeInsets.only(left: 18, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(top: 12),
                  child: Text(
                    'Conversations',
                    style: TextStyle(
                        fontSize: 32,
                        fontFamily: 'Kumbh_Sans',
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.green[50],
                      ),
                      child: Row(
                        children: const [
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                'Provider',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Kumbh_Sans',
                                    fontWeight: FontWeight.bold),
                              )),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 12),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(45),
                topRight: Radius.circular(45)),
            child: RefreshIndicator(
              onRefresh: () async =>
                locator<ChatBloc>().add(LoadConversationsCompletedEvent(convs: await locator<ChatSource>().getConversations(forceNetworkFetch: true))),
              child: Material(
                color: Colors.white,
                child: Stack(
                  children: <Widget>[
                    BlocBuilder<ChatBloc, ChatState>(
                      bloc: locator<ChatBloc>(),
                        buildWhen: (_, c) =>
                            c is! LoadMessagesCompletedState,
                        builder: (context, state) {
                          if (state is LoadConversationsCompletedState) {
                            return SizedBox(
                              height: MediaQuery.of(context).size.height,
                              child: ListView.builder(
                                  padding: const EdgeInsets.only(top: 20),
                                  itemCount: state.convs.length,
                                  itemBuilder: (context, index) {
                                    return Conversation(
                                      id: state.convs[index].id,
                                      name: state
                                          .convs[index].receiverUser.name,
                                      receiver: state
                                          .convs[index].receiverUser.id,
                                      lastMessage:
                                          state.convs[index].lastMessage,
                                      avatar:
                                          'https://randomuser.me/api/portraits/men/$index.jpg',
                                      time: timeago.format(state
                                          .convs[index]
                                          .lastMessage
                                          .createdAt),
                                      isRead: state.convs[index].seen,
                                    );
                                  }),
                            );
                          } else {
                            return const Center(
                              child: SizedBox(
                                height: 70,
                                width: 70,
                                child: CircularProgressIndicator(),
                              ),
                            );
                          }
                        }),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
