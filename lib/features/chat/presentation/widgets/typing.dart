import 'dart:async';

import 'package:cp_project/core/global/global.dart';
import 'package:cp_project/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Typing extends StatefulWidget {
  final String id;
  const Typing({super.key, required this.id});

  @override
  State<Typing> createState() => _TypingState();
}

class _TypingState extends State<Typing> {
  static const _stats = [MessageStatus.typing, MessageStatus.none];
  Timer? _timer;
  bool _toggleAlign = false;
  MessageStatus _messageStatus = MessageStatus.none;

  @override
  void dispose() {
    if (_timer != null && _timer!.isActive) _timer!.cancel();

    super.dispose();
  }

  // TODO: move this to cm
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatMessagesBloc, ChatMessagesSate>(
      listenWhen: (_, c) => c.status == ChatStatus.messageOperation && _stats.contains(c.messageStatus),
      listener: (c, s) {
        _messageStatus = s.messageStatus ?? MessageStatus.none;

        if (_timer == null ||
            !_timer!.isActive ||
            _messageStatus == MessageStatus.none) {
          if (_timer != null && _timer!.isActive) {
            _timer!.cancel();

            return;
          }

          _timer = Timer.periodic(const Duration(milliseconds: 900), (_) {
            if (_messageStatus == MessageStatus.none) {
              _timer?.cancel();
              return;
            }

            setState(() => _toggleAlign = !_toggleAlign);
          });
        }
      },
      buildWhen: (_, c) => c.status == ChatStatus.messageOperation && _stats.contains(c.messageStatus),
      builder: (ctx, state) {
        return _messageStatus == MessageStatus.typing
            ? Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, top: 12, right: 18),
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 56, maxHeight: 40),
                    decoration: BoxDecoration(
                      color: AppConst.gray,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [300, 600, 900]
                          .map(
                            (ms) => Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 600 == ms ? 2 : 0,
                              ),
                              child: AnimatedAlign(
                                alignment: _toggleAlign
                                    ? Alignment.topLeft
                                    : Alignment.centerLeft,
                                duration: Duration(milliseconds: ms),
                                child: Badge(
                                  smallSize: 9,
                                  backgroundColor: Colors.grey[350],
                                ),
                              ),
                            ),
                          )
                          .toList(growable: false),
                    ),
                  ),
                ),
              )
            : const SizedBox.shrink();
      },
    );
  }
}
