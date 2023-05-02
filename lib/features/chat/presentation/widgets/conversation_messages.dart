import 'dart:async';

import 'package:cp_project/core/global/Screens.dart';
import 'package:cp_project/core/global/global.dart';
import 'package:cp_project/features/chat/data/datasources/remote_data_source/chat_source.dart';
import 'package:cp_project/features/chat/data/models/message_model.dart';
import 'package:cp_project/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:cp_project/features/chat/presentation/widgets/avatar.dart';
import 'package:cp_project/features/chat/presentation/widgets/message.dart';
import 'package:cp_project/features/chat/presentation/widgets/typing.dart';
import 'package:cp_project/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:insta_assets_picker/insta_assets_picker.dart';

import 'package:timeago/timeago.dart' as timeago;
import 'package:uuid/uuid.dart';

class ConversationMessages extends StatefulWidget {
  final String id;
  final String receiver;
  final String name;
  final String avatar;
  final bool isOnline;
  final DateTime? lastOnline;

  const ConversationMessages({
    super.key,
    required this.id,
    required this.receiver,
    required this.name,
    required this.avatar,
    required this.isOnline,
    this.lastOnline,
  });

  @override
  State<ConversationMessages> createState() => _ConversationMessagesState();
}

class _ConversationMessagesState extends State<ConversationMessages> {
  int page = 1;
  Timer? timer;
  List<Message> messages = [];
  List<AssetEntity> assets = [];

  late final bloc = locatorMessagesBloc(instanceName: widget.id);
  late var isOnline = widget.isOnline;
  late var lastOnline = widget.lastOnline;
  late Timer cnxTimer;

  final message = TextEditingController();
  final scroll = ScrollController();
  final data = locator<ChatSource>();
  final picker = InstaAssetPicker();
  final provider = DefaultAssetPickerProvider(
    maxAssets: 6,
    initializeDelayDuration: Duration.zero,
  );

  @override
  void initState() {
    super.initState();

    cnxTimer = Timer.periodic(
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

    messages = bloc.state.getMessages;
    scroll.addListener(_onScroll);
  }

  @override
  void dispose() {
    cnxTimer.cancel();
    if (timer != null) timer!.cancel();

    scroll
      ..removeListener(_onScroll)
      ..dispose();
    message.dispose();
    picker.dispose();
    provider.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom && bloc.state.messagesPageInfo.page == page) {
      bloc.add(
        FetchMessages(
          widget.id,
          page: ++page,
          forceNetworkFetch: true,
        ),
      );
    }
  }

  bool get _isBottom =>
      scroll.hasClients &&
      scroll.offset >= scroll.position.maxScrollExtent * .85;

  Future<void> openPicker() async {
    final res = await picker.restorableAssetsPicker(
      context,
      provider: provider,
      title: 'Select images',
      closeOnComplete: true,
      onCompleted: (stm) {},
    );

    if (res != null) {
      setState(() {
        assets = res;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (bloc.state.pendingMessages.isNotEmpty || bloc.state.messages.isEmpty) {
      bloc.add(
        FetchMessages(
          widget.id,
          page: page,
          forceRefresh: true,
          forceNetworkFetch: true,
        ),
      );
    }

    return BlocProvider.value(
      value: bloc,
      child: SafeArea(
        child: WillPopScope(
          onWillPop: () async {
            locator<ChatBloc>().add(
              const FetchConversations(
                forceRefresh: true,
                forceNetworkFetch: true,
              ),
            );
            await Future.delayed(const Duration(milliseconds: 100));
            return true;
          },
          child: Scaffold(
            backgroundColor: AppConst.darkBlue,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              shadowColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              backgroundColor: AppConst.darkBlue,
              flexibleSpace: SafeArea(
                child: Container(
                  height: 65,
                  padding: const EdgeInsets.only(right: 16),
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        splashRadius: 20,
                        onPressed: () => Navigator.of(context).maybePop(),
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 2),
                      BlocConsumer<ChatBloc, ChatState>(
                        bloc: locator<ChatBloc>(),
                        listener: (c, s) {
                          try {
                            final conv = s.conversations
                                .firstWhere((e) => e.id == widget.id);
                            isOnline = conv.receiverUser.online;
                            lastOnline = conv.receiverUser.lastOnline;
                          } catch (_) {}
                        },
                        builder: (context, state) => Expanded(
                          child: Row(
                            children: [
                              Avatar(
                                avatar: widget.avatar,
                                size: 22,
                                backgroundColor: AppConst.darkBlue,
                                isOnline: isOnline,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      widget.name,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'Kumbh_Sans',
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    if (isOnline ||
                                        lastOnline != null &&
                                            DateTime.now()
                                                    .difference(lastOnline!)
                                                    .inDays ==
                                                0)
                                      Padding(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: Text(
                                          isOnline
                                              ? 'Active now'
                                              : 'Active ${timeago.format(lastOnline!, locale: 'en')}',
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Kumbh_Sans',
                                            fontSize: 13,
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: IconButton(
                          splashRadius: 20,
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (ctxMenu) {
                                // return alert dialog object
                                return AlertDialog(
                                  title: const Text('Conversation'),
                                  content: Material(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        InkWell(
                                          onTap: () => showDialog(
                                            context: context,
                                            builder: (ctxConfirm) {
                                              // return alert dialog object
                                              return AlertDialog(
                                                title: const Text(
                                                    'Are you sure that you want to delete your conversation copy?'),
                                                actions: [
                                                  InkWell(
                                                    child: const Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: Text(
                                                        'Cancel',
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color: AppConst
                                                                .darkBlue),
                                                      ),
                                                    ),
                                                    onTap: () {
                                                      Navigator.of(ctxConfirm)
                                                          .pop();
                                                    },
                                                  ),
                                                  const SizedBox(
                                                    width: 2,
                                                  ),
                                                  InkWell(
                                                    child: const Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: Text(
                                                        'Delete',
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color: AppConst
                                                                .darkBlue),
                                                      ),
                                                    ),
                                                    onTap: () async {
                                                      Navigator.of(ctxConfirm)
                                                          .pop();
                                                      Navigator.of(ctxMenu)
                                                          .pop();
                                                      Fluttertoast.showToast(
                                                          msg:
                                                              'Removing conversation..',
                                                          fontSize: 16.0);
                                                      data
                                                          .deleteConversation(
                                                              widget.id)
                                                          .then((value) {
                                                        Navigator.of(context)
                                                            .maybePop();
                                                      }, onError: (_) {
                                                        Fluttertoast.showToast(
                                                            msg:
                                                                'Failed to delete conversation',
                                                            fontSize: 16.0);
                                                      });
                                                    },
                                                  ),
                                                ],
                                              );
                                            },
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(children: const [
                                              Icon(Icons.delete_rounded),
                                              SizedBox(
                                                width: 2,
                                              ),
                                              Text('Remove'),
                                            ]),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          icon: const Icon(
                            Icons.info_outline_rounded,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.only(top: 12),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(45),
                  topRight: Radius.circular(45),
                ),
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      BlocBuilder<ChatMessagesBloc, ChatMessagesSate>(
                        buildWhen: (p, c) =>
                            c.status == ChatStatus.checkConnection ||
                            c.status == ChatStatus.fetchMessages,
                        builder: (con, state) => Column(
                          children: [
                            if (state.result == ChatResult.failure ||
                                !state.isConnected)
                              Container(
                                color: Colors.white,
                                padding: const EdgeInsets.all(16),
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
                                          ? 'Failed to fetch messages. Try again'
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
                      BlocConsumer<ChatMessagesBloc, ChatMessagesSate>(
                        listenWhen: (p, c) =>
                            c.status == ChatStatus.fetchMessages &&
                            c.result == ChatResult.success,
                        listener: (context, state) {
                          messages = state.getMessages;
                          page = state.messagesPageInfo.page;
                        },
                        buildWhen: (p, c) =>
                            c.status == ChatStatus.fetchMessages &&
                            c.result == ChatResult.success,
                        builder: (context, state) => Expanded(
                          child: Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              if (state.result == ChatResult.pending)
                                const LoadingWidget()
                              else
                                ListView.builder(
                                  controller: scroll,
                                  shrinkWrap: true,
                                  reverse: true,
                                  physics: const BouncingScrollPhysics(),
                                  padding: EdgeInsets.only(
                                      top: state.result == ChatResult.failure
                                          ? 12
                                          : 20),
                                  itemBuilder: (context, index) {
                                    if (index == 0) {
                                      return Typing(id: widget.id);
                                    } else {
                                      --index;
                                    }

                                    if (index == messages.length) {
                                      return state.result ==
                                                  ChatResult.success &&
                                              state.messagesPageInfo.hasNextPage
                                          ? const Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 8),
                                              child: LoadingWidget(),
                                            )
                                          : null;
                                    }

                                    DateTime? nextDate = index > 0
                                        ? messages[index - 1].createdAt
                                        : null;
                                    final dd = nextDate != null
                                        ? messages[index]
                                            .createdAt
                                            .difference(nextDate)
                                            .inMinutes
                                        : 0;
                                    final nextHasSep = dd < -50 ||
                                        nextDate != null &&
                                            nextDate
                                                    .difference(messages[index]
                                                        .createdAt)
                                                    .inDays !=
                                                0;
                                    DateTime? lastDate =
                                        index < messages.length - 1
                                            ? messages[index + 1].createdAt
                                            : null;
                                    final dd2 = lastDate != null
                                        ? messages[index]
                                            .createdAt
                                            .difference(lastDate)
                                            .inMinutes
                                        : 0;
                                    final hasSep =
                                        index == messages.length - 1 ||
                                            dd2 > 50;
                                    var nextisSender = index > 0
                                        ? messages[index - 1].isSender
                                        : false;
                                    var lastisSender =
                                        index < messages.length - 1
                                            ? messages[index + 1].isSender
                                            : true;
                                    return MessageWidget(
                                      key: ValueKey(messages[index].id),
                                      id: messages[index].id,
                                      receiver: widget.receiver,
                                      conversation: widget.id,
                                      name: widget.name,
                                      body: messages[index].body,
                                      seen: messages[index].seen,
                                      deleted: messages[index].body.isEmpty &&
                                              messages[index].attachments ==
                                                  null &&
                                              messages[index]
                                                      .localAttchmentsList ==
                                                  null ||
                                          messages[index].deleted,
                                      status: messages[index].status,
                                      seenAt: messages[index].seenAt,
                                      editAt: messages[index].editAt,
                                      delAt: messages[index].delAt,
                                      sentAt: messages[index].createdAt,
                                      nextSentAt: nextDate,
                                      sender: messages[index].isSender,
                                      lastSender: lastisSender,
                                      nextSender: nextisSender,
                                      hasSep: hasSep,
                                      nextHasSep: nextHasSep,
                                      firstMessage: index == 0,
                                      padWithTopDate:
                                          index == messages.length - 1,
                                      attachments: messages[index].attachments,
                                      localAttchmentsList:
                                          messages[index].localAttchmentsList,
                                    );
                                  },
                                  itemCount: messages.length + 2,
                                ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        constraints: const BoxConstraints(minHeight: 50),
                        child: Material(
                          color: Colors.white,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: TextField(
                                        controller: message,
                                        minLines: 1,
                                        maxLines: 6,
                                        keyboardType: TextInputType.multiline,
                                        textAlignVertical:
                                            TextAlignVertical.center,
                                        onTap: () => scroll.jumpTo(0),
                                        onChanged: (str) {
                                          if (timer != null) {
                                            if (timer!.isActive &&
                                                str.isNotEmpty) {
                                              return;
                                            }

                                            timer!.cancel();
                                          } else {
                                            data.typeMessage(
                                              widget.id,
                                              str.isNotEmpty,
                                            );
                                            timer = Timer(
                                              const Duration(seconds: 1),
                                              () {},
                                            );

                                            return;
                                          }

                                          timer = Timer(
                                            const Duration(seconds: 2),
                                            () => data.typeMessage(
                                              widget.id,
                                              str.isNotEmpty,
                                            ),
                                          );
                                        }, // reversed
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors.grey[1],
                                          hintText: "Type message...",
                                          contentPadding:
                                              const EdgeInsets.all(8),
                                          hintStyle: const TextStyle(
                                              color: AppConst.textColor),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.photo_library_rounded,
                                      color: AppConst.orong,
                                    ),
                                    onPressed: openPicker,
                                    splashRadius: 20,
                                  ),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.send_rounded,
                                      color: AppConst.orong,
                                    ),
                                    splashRadius: 20,
                                    onPressed: () {
                                      final msg = Message(
                                        id: const Uuid().v1(),
                                        body: message.value.text,
                                        isSender: true,
                                        seen: false,
                                        deleted: false,
                                        createdAt: DateTime.now(),
                                        localAttchmentsList: assets.isNotEmpty
                                            ? List.of(assets)
                                            : null,
                                        status: MessageStatus.sending,
                                      );

                                      if (msg.body.isEmpty && assets.isEmpty) {
                                        return;
                                      }

                                      setState(() {
                                        assets.clear();
                                        message.clear();
                                        scroll.jumpTo(0);
                                      });

                                      if (timer != null && timer!.isActive) {
                                        timer!.cancel();
                                      }

                                      data.typeMessage(
                                        widget.id,
                                        false,
                                      );

                                      bloc.add(
                                        ChatEventAddable(
                                          status: ChatStatus.fetchMessages,
                                          result: ChatResult.success,
                                          pendingMessage: msg,
                                        ),
                                      );
                                    },
                                  )
                                ],
                              ),
                              if (assets.isNotEmpty)
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 6),
                                  child: GridView.builder(
                                    shrinkWrap: true,
                                    physics: const BouncingScrollPhysics(),
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      crossAxisSpacing: 6,
                                      childAspectRatio: 7 / 5,
                                      mainAxisSpacing: 2,
                                    ),
                                    itemCount: assets.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return InkWell(
                                        onTap: openPicker,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            image: DecorationImage(
                                              scale: 0.8,
                                              image: AssetEntityImageProvider(
                                                  assets[index],
                                                  isOriginal: false),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
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
