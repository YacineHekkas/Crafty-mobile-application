import 'dart:async';

import 'package:cp_project/core/global/global.dart';
import 'package:cp_project/features/chat/data/datasources/remote_data_source/chat_source.dart';
import 'package:cp_project/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:cp_project/features/chat/presentation/widgets/conversation.dart';
import 'package:cp_project/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:cp_project/core/global/Screens.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  int page = 1;
  final bloc = locator<ChatBloc>();
  final data = locator<ChatSource>();
  final scroll = ScrollController();
  late Timer timer;

  @override
  void initState() {
    super.initState();

    timeago.setLocaleMessages('inChat', TimeagoChatSettings());
    timeago.setLocaleMessages('inChatMessages', TimeagoChatMessagesSettings());
    timeago.setDefaultLocale(
      'inChat',
    );

    timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) => data.server.networkInfo.isConnected.then(
        (value) {
          if (value != bloc.state.isConnected) {
            bloc.add(
              ChatEventAddable(
                status: ChatStatus.checkConnection,
                result: value ? ChatResult.success : ChatResult.failure,
                isConnected: value,
              ),
            );
          }
        },
      ),
    );

    scroll.addListener(_onScroll);
  }

  @override
  void dispose() {
    timer.cancel();
    scroll
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom && bloc.state.conversationsPageInfo.page == page) {
      bloc.add(FetchConversations(page: ++page, forceNetworkFetch: true));
    }
  }

  bool get _isBottom =>
      scroll.hasClients &&
      scroll.offset >= scroll.position.maxScrollExtent * .8;
  @override
  Widget build(BuildContext context) {
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
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Conversations',
                  style: TextStyle(
                      fontSize: 32,
                      fontFamily: 'Kumbh_Sans',
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.green[50],
                    ),
                    child: const Text(
                      'Provider',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Kumbh_Sans',
                          fontWeight: FontWeight.bold),
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
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            child: RefreshIndicator(
              onRefresh: () async {
                // TODO: refactor this
                try {
                  final pagination = await data.getConversations(
                    cacheFetch: false,
                    forceNetworkFetch: true,
                  );
                  bloc.add(ChatEventAddable(
                    status: ChatStatus.fetchConversations,
                    result: ChatResult.success,
                    conversations: pagination.data,
                    conversationsPageInfo: pagination.pageInfo,
                  ));
                } catch (_) {
                  bloc.add(const ChatEventAddable(
                    status: ChatStatus.fetchConversations,
                    result: ChatResult.failure,
                  ));
                }
              },
              child: Material(
                color: Colors.white,
                child: BlocConsumer<ChatBloc, ChatState>(
                  bloc: bloc..add(const FetchConversations(forceRefresh: true)),
                  listenWhen: (_, c) =>
                      c.status == ChatStatus.fetchConversations,
                  listener: (context, state) =>
                      page = state.conversationsPageInfo.page,
                  buildWhen: (_, c) =>
                      c.status == ChatStatus.checkConnection ||
                      c.status == ChatStatus.fetchConversations,
                  builder: (context, state) => Stack(
                    children: [
                      if (state.result == ChatResult.failure ||
                          !state.isConnected)
                        Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              children: [
                                if (state.conversations.isEmpty)
                                  Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 32),
                                    child: SvgPicture.asset(
                                      'assets/images/chat/data_error.svg',
                                    ),
                                  ),
                                Container(
                                  color: Colors.white,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.error_outline_rounded,
                                        size: 18,
                                        color: Colors.red.shade400,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        state.isConnected
                                            ? 'Failed to fetch chats. Try again'
                                            : 'No internet connection',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.red.shade400,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      if (state.conversations.isNotEmpty)
                        ListView.builder(
                            controller: scroll,
                            padding: EdgeInsets.only(
                                top: state.result == ChatResult.failure
                                    ? 30
                                    : 10),
                            itemCount: state.conversations.length + 1,
                            physics: const AlwaysScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return index == state.conversations.length
                                  ? state.result == ChatResult.success &&
                                          state
                                              .conversationsPageInfo.hasNextPage
                                      ? const Padding(
                                          padding: EdgeInsets.only(
                                              top: 8, bottom: 100),
                                          child: LoadingWidget(),
                                        )
                                      : const Padding(
                                          padding: EdgeInsets.only(bottom: 100),
                                          child: SizedBox.shrink())
                                  : Conversation(
                                      id: state.conversations[index].id,
                                      name: state.conversations[index]
                                          .receiverUser.name,
                                      receiver: state
                                          .conversations[index].receiverUser.id,
                                      lastMessage: state
                                          .conversations[index].lastMessage!,
                                      avatar: state.conversations[index]
                                          .receiverUser.avatar
                                          .replaceFirst('man',
                                              'men'), // TODO: remove this
                                      time: timeago.format(state
                                          .conversations[index]
                                          .lastMessage!
                                          .createdAt),
                                      isRead: state.conversations[index].seen,
                                      isOnline: state.conversations[index]
                                          .receiverUser.online,
                                      lastOnline: state.conversations[index]
                                          .receiverUser.lastOnline,
                                    );
                            })
                      else if (state.result == ChatResult.success)
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          child: SvgPicture.asset(
                            'assets/images/chat/empty_chats.svg',
                            clipBehavior: Clip.none,
                            fit: BoxFit.scaleDown,
                          ),
                        )
                      else if (state.result == ChatResult.pending)
                        const LoadingWidget(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
