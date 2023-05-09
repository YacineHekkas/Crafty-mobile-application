import 'package:cp_project/core/global/global.dart';
import 'package:cp_project/core/util/app.dart';
import 'package:cp_project/injection_container.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final String avatar;
  final double? size;

  final bool isOnline;
  final DateTime? lastOnline;
  final Color backgroundColor;

  const Avatar({
    super.key,
    required this.avatar,
    required this.isOnline,
    this.lastOnline,
    this.size,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(
            avatar.contains('http')
                ? avatar
                : 'https://crafty-server.azurewebsites.net/api/download/$avatar',
            headers: {'Authorization': 'gg ${locator<App>().getUserToken()}'},
          ),
          foregroundColor: AppConst.darkBlue,
          maxRadius: size ?? 31,
        ),
        if (isOnline ||
            lastOnline != null &&
                DateTime.now().difference(lastOnline!).inMinutes < 59)
          Positioned(
            bottom: 0,
            right: isOnline ? 0 : -4,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Container(
                padding: const EdgeInsets.all(2),
                color: backgroundColor,
                child: isOnline
                    ? const Badge(
                        smallSize: 13,
                        backgroundColor: Color.fromARGB(255, 40, 227, 47),
                      )
                    : Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.green[50],
                        ),
                        child: Text(
                          '${DateTime.now().difference(lastOnline!).inMinutes + 1}m',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 9, fontWeight: FontWeight.w600),
                        ),
                      ),
              ),
            ),
          ),
      ],
    );
  }
}
