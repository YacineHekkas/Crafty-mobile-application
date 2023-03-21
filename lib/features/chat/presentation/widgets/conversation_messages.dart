import 'package:cp_project/core/global/global.dart';
import 'package:cp_project/features/chat/data/datasources/remote_data_source/chat_source.dart';
import 'package:cp_project/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:cp_project/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConversationMessages extends StatelessWidget {
  final String id;
  final String receiver;
  final String name;
  final String avatar;

  ConversationMessages(
      {super.key,
      required this.id,
      required this.receiver,
      required this.name,
      required this.avatar});

  final message = TextEditingController();
  final scroll = ScrollController();
  final data = locator<ChatSource>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 2),
                CircleAvatar(
                  backgroundImage: NetworkImage(avatar),
                  maxRadius: 20,
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
                        name,
                        style: const TextStyle(
                            fontSize: 16,
                            fontFamily: 'Kumbh_Sans',
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        'Online',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Kumbh_Sans',
                            fontSize: 13),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: IconButton(
                      splashRadius: 20,
                      onPressed: () => {},
                      icon: const Icon(Icons.info_outline_rounded,
                          color: Colors.white)),
                )
              ],
            ),
          )),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 12),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(45), topRight: Radius.circular(45)),
            child: Container(
              color: Colors.white,
              child: Stack(
                children: <Widget>[
                  BlocBuilder<ChatBloc, ChatState>(builder: (context, state) {
                    if (state is LoadMessagesCompletedState) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: ListView.builder(
                            controller: scroll,
                            reverse: true,
                            padding: const EdgeInsets.only(top: 20, bottom: 80),
                            itemBuilder: (context, index) {
                              index = state.msgs.length - index - 1;
                              return Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 14, vertical: 8),
                                child: Align(
                                  alignment: (!state.msgs[index].isSender
                                      ? Alignment.topLeft
                                      : Alignment.topRight),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: (!state.msgs[index].isSender
                                            ? AppConst.gray
                                            : AppConst.darkBlue),
                                        borderRadius: BorderRadius.only(
                                            topLeft: const Radius.circular(20),
                                            topRight: const Radius.circular(20),
                                            bottomLeft: Radius.circular(
                                                state.msgs[index].isSender
                                                    ? 20
                                                    : 0),
                                            bottomRight: Radius.circular(
                                                state.msgs[index].isSender
                                                    ? 0
                                                    : 20))),
                                    padding: const EdgeInsets.all(16),
                                    child: Container(
                                      constraints: BoxConstraints(
                                          maxWidth: (MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2) -
                                              40),
                                      child: Text(
                                        state.msgs[index].body,
                                        style: TextStyle(
                                            color: state.msgs[index].isSender
                                                ? Colors.white
                                                : AppConst.textColor,
                                            fontSize: 15),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            itemCount: state.msgs.length),
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
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      margin: const EdgeInsets.all(16),
                      height: 62,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35.0),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(.5, .5),
                            blurRadius: 1,
                            color: Colors.black54,
                          )
                        ],
                      ),
                      child: Material(
                        borderRadius: BorderRadius.circular(35.0),
                        child: Row(
                          children: [
                            IconButton(
                                icon: const Icon(Icons.face,
                                    color: AppConst.orong),
                                onPressed: () {},
                                splashRadius: 20),
                            Expanded(
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  child: TextField(
                                    controller: message,
                                    expands: true,
                                    maxLines: null,
                                    keyboardType: TextInputType.multiline,
                                    textAlignVertical: TextAlignVertical.center,
                                    onTap: () => scroll.jumpTo(0), // reversed
                                    decoration: const InputDecoration(
                                        hintText: "Type message...",
                                        contentPadding:
                                            EdgeInsets.symmetric(vertical: 8),
                                        hintStyle: TextStyle(
                                            color: AppConst.textColor),
                                        border: InputBorder.none),
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.photo_library_rounded,
                                  color: AppConst.orong),
                              onPressed: () {},
                              splashRadius: 20,
                            ),
                            IconButton(
                                icon: const Icon(Icons.send_rounded,
                                    color: AppConst.orong),
                                splashRadius: 20,
                                onPressed: () {
                                  final msg = message.value.text;
                                  if (msg.isEmpty) {
                                    return;
                                  }
                                  message.clear();
                                  data.sendMessage(receiver, msg);
                                  BlocProvider.of<ChatBloc>(context)
                                      .add(LoadMessagesEvent(id: id));
                                })
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
