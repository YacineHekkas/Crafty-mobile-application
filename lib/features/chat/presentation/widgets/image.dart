import 'package:cp_project/core/global/global.dart';
import 'package:cp_project/features/chat/data/datasources/remote_data_source/chat_source.dart';
import 'package:cp_project/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:cp_project/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:insta_assets_picker/insta_assets_picker.dart';

class ImageWidget extends StatefulWidget {
  final AssetEntity asset;
  final String conversation;
  final MessageStatus status;

  final void Function(String?, bool)? onCompleted;

  const ImageWidget({
    super.key,
    required this.asset,
    required this.conversation,
    required this.status,
    this.onCompleted,
  });

  @override
  State<ImageWidget> createState() => ImageWidgetState();
}

class ImageWidgetState extends State<ImageWidget> {
  final data = locator<ChatSource>();

  bool error = false;
  bool loading = true;

  double? progress;

  void _progressCallback(int count, int total) {
    if (mounted && !error) {
      setState(() {
        progress = count / total;
        if (progress == 1.0) {
          progress = null;
        }
      });
    }
  }

  Future<void> _uploadAsset() async {
    try {
      final file = await widget.asset.file;
      final url = await data.uploadImage(
        widget.conversation,
        file!.path,
        mimeType: widget.asset.mimeType,
        callback: _progressCallback,
      );
      if (mounted) {
        setState(() {
          loading = false;
        });
        if (widget.onCompleted != null) {
          widget.onCompleted!(url!, error);
        }
      }
    } catch (_) {
      if (mounted) {
        setState(() {
          error = true;
        });
        if (widget.onCompleted != null) {
          widget.onCompleted!(null, error);
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();

    error = widget.status == MessageStatus.error;
    if (widget.status == MessageStatus.sending && loading) {
      _uploadAsset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image(
          image: AssetEntityImageProvider(widget.asset, isOriginal: false),
          fit: BoxFit.fill,
        ),
        if (loading || error)
          ModalBarrier(
            dismissible: false,
            color: Colors.black.withOpacity(.75),
          ),
        if (error)
          const Icon(
            Icons.error_outline_rounded,
            color: AppConst.orong,
            size: 26,
          ),
        if (loading && !error)
          Padding(
            padding: const EdgeInsets.all(48),
            child: CircularProgressIndicator(
              color: AppConst.orong,
              value: progress,
            ),
          )
      ],
    );
  }
}
