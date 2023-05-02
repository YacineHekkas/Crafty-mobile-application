import 'package:any_link_preview/any_link_preview.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cp_project/core/global/global.dart';
import 'package:cp_project/features/chat/data/datasources/remote_data_source/chat_source.dart';
import 'package:cp_project/features/chat/data/models/message_model.dart';
import 'package:cp_project/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:cp_project/features/chat/presentation/widgets/image.dart';
import 'package:cp_project/features/home/presentation/pages/services_pages/photo_Gallery_screen.dart';
import 'package:cp_project/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:insta_assets_picker/insta_assets_picker.dart';
import 'package:intl/intl.dart' as intl;
import 'package:timeago/timeago.dart' as timeago;

class MessageWidget extends StatefulWidget {
  final bool sender;
  final bool seen;
  final bool deleted;
  final bool lastSender;
  final bool nextSender;
  final bool hasSep;
  final bool nextHasSep;
  final bool firstMessage;
  final bool padWithTopDate;

  final DateTime sentAt;
  final DateTime? seenAt;
  final DateTime? editAt;
  final DateTime? delAt;
  final DateTime? nextSentAt;

  final MessageStatus status;

  final String body;
  final String id;
  final String receiver;
  final String name;
  final String conversation;

  final Attachments? attachments;
  final List<AssetEntity>? localAttchmentsList;

  const MessageWidget({
    super.key,
    required this.sender,
    required this.body,
    required this.id,
    required this.receiver,
    required this.status,
    required this.seen,
    required this.sentAt,
    required this.nextSentAt,
    required this.lastSender,
    required this.nextSender,
    required this.hasSep,
    required this.nextHasSep,
    required this.firstMessage,
    required this.padWithTopDate,
    required this.deleted,
    required this.name,
    required this.conversation,
    this.seenAt,
    this.editAt,
    this.delAt,
    this.localAttchmentsList,
    this.attachments,
  });

  @override
  State<MessageWidget> createState() => MessageWidgetState();
}

class MessageWidgetState extends State<MessageWidget> {
  late final bloc = locatorMessagesBloc(instanceName: widget.conversation);

  late var id = widget.id;

  late var status = widget.status;
  late var body = widget.body;

  late var seen = widget.seen;
  late var deleted = widget.deleted;

  late var seenAt = widget.seenAt;
  late var delAt = widget.delAt;
  late var editAt = widget.editAt;

  late final roundTopLeft = !widget.lastSender &&
          !widget.nextSender &&
          !widget.sender &&
          !widget.hasSep ||
      !widget.sender && (widget.nextSender || widget.firstMessage);
  late final roundTopRight = widget.lastSender &&
          widget.nextSender &&
          widget.sender &&
          !widget.hasSep ||
      widget.sender && !widget.nextSender;
  late final roundBottomLeft =
      widget.sender || widget.nextSender || widget.firstMessage;
  late final roundBottomRight =
      widget.sender && widget.nextSender && !widget.nextHasSep;
  final data = locator<ChatSource>();
  final message = TextEditingController();

  final List<String> _images = [];
  bool showSeenSent = false;
  bool showLink = false;
  String? link;
  int _count = 0;

  @override
  void initState() {
    super.initState();

    setSeenStatus();

    if (status == MessageStatus.sending && widget.localAttchmentsList == null) {
      print('${id} sendd');
      sendMessage();
    }

    getFirstLink().then((value) {
      if (value == null) {
        link = '';
      } else {
        if (mounted) {
          setState(() {
            link = value;
            showLink = true;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    message.dispose();

    super.dispose();
  }

  void onTap() {
    setState(
      () {
        showSeenSent = !showSeenSent;
      },
    );
  }

  void setSeenStatus() {
    if (!widget.sender && !seen) {
      bloc.add(UpdateMessage(
        MessageStatus.seen,
        result: ChatResult.success,
        id: id,
      ));
      bloc.add(FetchMessages(
        widget.conversation,
        page: bloc.state.messagesPageInfo.page,
        forceRefresh: true,
        forceNetworkFetch: true,
      ));
    }
  }

  void sendMessage({
    Attachments? attachments,
  }) {
    bloc.add(UpdateMessage(
      MessageStatus.sent,
      result: ChatResult.success,
      id: id,
    ));
    data.sendMessage(widget.receiver, body, attachments: attachments).then(
      (v) {
        bloc.add(
          UpdateMessage(
            MessageStatus.delivered,
            result: ChatResult.success,
            id: id,
            newId: v,
            attachments: attachments,
          ),
        );
        data.getMessages(
          widget.conversation,
          page: 1,
          cacheFetch: false,
          forceNetworkFetch: true,
        );
      },
      onError: (_) => bloc.add(
        UpdateMessage(MessageStatus.error, result: ChatResult.failure, id: id),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      onLongPress: () {
        // TODO: WET code, refactor this
        if (!deleted &&
            widget.sender &&
            status != MessageStatus.error &&
            status != MessageStatus.sending &&
            status != MessageStatus.sent) {
          showDialog(
            context: context,
            builder: (ctxMenu) {
              // return alert dialog object
              return AlertDialog(
                title: const Text('Message'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () => showDialog(
                        context: context,
                        builder: (ctxConfirm) {
                          // return alert dialog object
                          return AlertDialog(
                            title: const Text('Edit Message'),
                            content: Form(
                              child: TextFormField(
                                controller: message,
                                minLines: 1,
                                maxLines: 6,
                                textAlignVertical: TextAlignVertical.center,
                                validator: (value) => widget.attachments == null
                                    ? value!.isEmpty
                                        ? 'Empty messages are not allowed'
                                        : null
                                    : null,
                                decoration: const InputDecoration(
                                  hintText: "New message...",
                                  contentPadding: EdgeInsets.all(8),
                                  hintStyle:
                                      TextStyle(color: AppConst.textColor),
                                ),
                              ),
                            ),
                            actions: [
                              InkWell(
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle(
                                        fontSize: 18, color: AppConst.darkBlue),
                                  ),
                                ),
                                onTap: () {
                                  Navigator.of(ctxConfirm).pop();
                                },
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              InkWell(
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Edit',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: AppConst.darkBlue,
                                    ),
                                  ),
                                ),
                                onTap: () async {
                                  final old = body;
                                  Navigator.of(ctxConfirm).pop();
                                  Navigator.of(ctxMenu).pop();

                                  bloc.add(
                                    UpdateMessage(
                                      MessageStatus.edit,
                                      result: ChatResult.success,
                                      body: message.value.text,
                                      id: id,
                                    ),
                                  );
                                  data
                                      .editMessage(
                                         id, message.value.text)
                                      .then((value) {
                                    data.getMessages(
                                      widget.conversation,
                                      forceNetworkFetch: true,
                                    );
                                  }, onError: (_) {
                                    bloc.add(
                                      UpdateMessage(
                                        MessageStatus.edit,
                                        result: ChatResult.failure,
                                        body: old,
                                        id: id,
                                      ),
                                    );
                                    Fluttertoast.showToast(
                                      msg: 'Failed to edit message',
                                      fontSize: 16.0,
                                    );
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
                          Icon(Icons.edit_rounded, color: AppConst.darkBlue),
                          SizedBox(width: 2),
                          Text('Edit'),
                        ]),
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(ctxMenu).pop();
                        bloc.add(UpdateMessage(
                          MessageStatus.remove,
                          result: ChatResult.success,
                          id: id,
                        ));
                        data.deleteMessage( id).then((value) {
                          data.getMessages(
                            widget.conversation,
                            cacheFetch: false,
                            forceNetworkFetch: true,
                          );
                        }, onError: (_) {
                          bloc.add(UpdateMessage(
                            MessageStatus.remove,
                            result: ChatResult.failure,
                            id: id,
                          ));
                          Fluttertoast.showToast(
                            msg: 'Failed to delete message',
                            fontSize: 16.0,
                          );
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(children: const [
                          Icon(Icons.delete_rounded, color: AppConst.darkBlue),
                          SizedBox(
                            width: 2,
                          ),
                          Text('Remove'),
                        ]),
                      ),
                    )
                  ],
                ),
              );
            },
          );
        }
      },
      child: BlocConsumer<ChatMessagesBloc, ChatMessagesSate>(
        bloc: bloc,
        listenWhen: (_, c) =>
            c.status == ChatStatus.messageOperation && c.messageID == id,
        listener: (_, state) {
          final updatedMessage = state.getMessage(
            state.messageStatus == MessageStatus.delivered
                ? state.messageNewID!
                : id,
          );

          status = state.messageStatus!;

          body = updatedMessage.body;
          seen = updatedMessage.seen;
          deleted = updatedMessage.deleted;

          editAt = updatedMessage.editAt;
          seenAt = updatedMessage.seenAt;
          delAt = updatedMessage.delAt;

          if (status == MessageStatus.delivered) {
            setState(() {
              id = state.messageNewID!;
            });
          } 
        },
        buildWhen: (_, c) =>
            c.status == ChatStatus.messageOperation && c.messageID == id,
        builder: (_, __) => Column(
          crossAxisAlignment:
              widget.sender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            if (widget.padWithTopDate || widget.hasSep || showSeenSent)
              buildDateSpearetor(widget.sentAt),
            if (!deleted) buildAttachments(),
            Stack(
              clipBehavior: Clip.none,
              children: [
                if (body.isNotEmpty || deleted)
                  Padding(
                    padding: EdgeInsets.only(
                        left: !widget.sender ? 8 : 0,
                        top: widget.sender != widget.lastSender ? 12 : 1,
                        right: widget.sender ? 18 : 0,
                        bottom: showSeenSent || status.index == 3 ? 15 : 0),
                    child: Container(
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * .7),
                      decoration: BoxDecoration(
                          color: deleted
                              ? Colors.transparent
                              : (!widget.sender
                                  ? AppConst.gray
                                  : AppConst.darkBlue),
                          border:
                              deleted ? Border.all(color: AppConst.gray) : null,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(roundTopLeft ? 4 : 24),
                              topRight: Radius.circular(roundTopRight ? 4 : 24),
                              bottomLeft:
                                  Radius.circular(roundBottomLeft ? 24 : 4),
                              bottomRight:
                                  Radius.circular(roundBottomRight ? 4 : 24))),
                      padding: const EdgeInsets.all(13),
                      child: Text(
                        deleted
                            ? '${widget.sender ? 'You' : widget.name.split(' ')[0]} unsent a message'
                            : body,
                        style: TextStyle(
                            color: deleted
                                ? AppConst.textColor
                                : (widget.sender
                                    ? Colors.white
                                    : AppConst.textColor),
                            fontStyle: deleted ? FontStyle.italic : null,
                            fontSize: deleted ? 15 : 17),
                      ),
                    ),
                  ),
                if (!deleted && widget.sender && !seen)
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: Icon(
                        status.index == 3
                            ? Icons.error_outline_rounded
                            : status.index == 0
                                ? Icons.circle_outlined
                                : status.index == 1
                                    ? Icons.check_circle_outline_rounded
                                    : Icons.check_circle_rounded,
                        color: AppConst.orong,
                        size: 14,
                      ),
                    ),
                  ),
                if (showSeenSent || status.index == 3)
                  Positioned(
                    bottom: -2,
                    right: widget.sender ? 18 : null,
                    left: !widget.sender ? 8 : null,
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: Text(
                        getMessageCaption(),
                        style: TextStyle(
                            color: status.index == 3
                                ? Colors.red.shade400
                                : AppConst.textColor,
                            fontSize: 13),
                      ),
                    ),
                  ),
                const SizedBox.shrink()
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildAttachments() => Column(
        children: [
          if (widget.attachments != null &&
                  widget.attachments!.images != null ||
              widget.localAttchmentsList != null)
            Container(
              padding: EdgeInsets.only(
                top: 2,
                bottom: !body.isNotEmpty &&
                        !deleted &&
                        (showSeenSent || status.index == 3)
                    ? 15
                    : 2,
                left: !widget.sender ? 8 : 0,
                right: widget.sender ? 18 : 0,
              ),
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width / 2,
              ),
              child: Directionality(
                textDirection:
                    widget.sender ? TextDirection.rtl : TextDirection.ltr,
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 6,
                    mainAxisSpacing: 4,
                  ),
                  itemCount: widget.localAttchmentsList != null
                      ? widget.localAttchmentsList!.length
                      : widget.attachments!.images!.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => onTap(),
                      onDoubleTap: () {
                        if (widget.attachments == null) return;

                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return PhotoGallery(
                                imgList: widget.attachments!.images!
                                    .map((e) =>
                                        'https://crafty-server.azurewebsites.net/api/download/$e')
                                    .toList(),
                                initialPage: index,
                              );
                            },
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black54,
                              offset: Offset(.5, .5),
                              blurRadius: 1.8,
                            )
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: widget.attachments != null
                              ? CachedNetworkImage(
                                  imageUrl:
                                      'https://crafty-server.azurewebsites.net/api/download/${widget.attachments!.images![index]}',
                                  httpHeaders: const {
                                    'Authorization':
                                        'gg eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImMzMTJkYmJjYTRlNGFhOTdkZDMxYWVhMiIsImlhdCI6MTY3OTY2ODE2NywiZXhwIjoxNzExMjI1NzY3fQ.R3CAE1dEbYKCAvRr2Ayzt9DM5klpuSkPSZeoqoehlyo'
                                  },
                                  fit: BoxFit.cover,
                                  progressIndicatorBuilder:
                                      (context, url, progress) => Padding(
                                    padding: const EdgeInsets.all(18),
                                    child: CircularProgressIndicator(
                                      color: AppConst.darkBlue,
                                      value: progress.progress,
                                    ),
                                  ),
                                )
                              : ImageWidget(
                                  key: ValueKey(
                                    widget.localAttchmentsList![index].id,
                                  ),
                                  conversation: widget.conversation,
                                  asset: widget.localAttchmentsList![index],
                                  status: status,
                                  onCompleted: (url, err) {
                                    int len =
                                        widget.localAttchmentsList!.length;

                                    if (status == MessageStatus.error) return;

                                    if (err || url == null) {
                                      _count++;

                                      if (_count < len) {
                                        return;
                                      }

                                      bloc.add(
                                        UpdateMessage(
                                          MessageStatus.error,
                                          result: ChatResult.failure,
                                          id: id,
                                        ),
                                      );
                                      return;
                                    }

                                    _images.add(url);
                                    if (len == (_images.length + _count)) {
                                      sendMessage(
                                        attachments: Attachments(
                                          images: List.of(_images),
                                        ),
                                      );
                                      _images.clear();
                                    }
                                  },
                                ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          if (link != null && link!.isNotEmpty)
            Padding(
              padding: EdgeInsets.only(
                top: 4,
                bottom: 4,
                left: !widget.sender ? 8 : 0,
                right: widget.sender ? 18 : 0,
              ),
              child: Container(
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width / 2),
                child: AnyLinkPreview(
                  link: link!,
                  backgroundColor: Colors.white,
                  bodyMaxLines: 2,
                  previewHeight: 150,
                  errorBody: '',
                ),
              ),
            )
        ],
      );

  Widget buildDateSpearetor(DateTime date) {
    var dateString = 'at ${intl.DateFormat.jm().format(date)}';

    if (DateTime.now().difference(date).inDays > 0) {
      dateString =
          '${timeago.format(date, locale: 'inChatMessages')} $dateString';
    }

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Text(
          dateString.toUpperCase(),
          style: TextStyle(
              color: AppConst.textColor.withOpacity(.6),
              fontSize: 14,
              fontFamily: 'Kumbh_Sans'),
        ),
      ),
    );
  }

  String getMessageCaption() {
    if (status.index == 3) {
      return 'Failed to send';
    } else if (status.index == 1) {
      return 'Sent';
    } else if (status.index == 0) {
      return 'Sending';
    }

    String caption = !seen ? 'Delivred' : 'Seen';

    if (deleted || editAt != null) {
      caption += '\u{30FB}';
      if (deleted) {
        caption += 'Removed${formatDate(delAt!)}';
      } else {
        caption += 'Edited${formatDate(editAt!)}';
      }
    } else if (seen) {
      caption += formatDate(seenAt!);
    }

    return caption;
  }

  Future<String?> getFirstLink() async {
    final reg = RegExp(r'(https?:\/\/)?[\w-.]+\.\w{2,6}',
        multiLine: true, caseSensitive: false);
    final match = reg.firstMatch(body);

    if (match != null && match.group(0) != null) {
      var matchString = match.group(0)!;
      if (!matchString.startsWith('http')) {
        matchString = 'http://$matchString';
      }
      try {
        final mt = await AnyLinkPreview.getMetadata(link: matchString);
        if (mt == null ||
            mt.image == null ||
            mt.title == null ||
            mt.desc == null) return null;

        return matchString;
      } catch (_) {}
    }

    return null;
  }

  String formatDate(DateTime date) =>
      ' at ${intl.DateFormat.jm().format(date)}';
}
