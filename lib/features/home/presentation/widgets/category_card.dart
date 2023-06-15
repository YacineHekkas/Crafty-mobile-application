import 'package:cp_project/core/global/global.dart';
import 'package:cp_project/core/util/app.dart';
import 'package:cp_project/features/favorite/presentation/pages/favorite_screen.dart';
import 'package:cp_project/features/home/domain/entities/service_entitie.dart';
import 'package:flutter/material.dart';

import '../../../../injection_container.dart';

class CategoryCard extends StatefulWidget {
  final Function() onSelected;
  //final Function( bool selected) addToFavorite;
  final ServiceEntity? serviceInfo;
  // im gonna add all of this in user entity and use it directly

  CategoryCard(
      {Key? key,
      required this.onSelected,
      required this.serviceInfo}) //required this.addToFavorite})
      : super(key: key);

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  late var isItInFavorite = locator<FavoriteScreen>()
      .dataValue
      .value
      .any((e) => e.id == widget.serviceInfo?.id);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: InkWell(
          onTap: () {
            widget.onSelected();
          },
          child: Container(
            height: MediaQuery.of(context).size.height / 6,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 2.0,
                  spreadRadius: 1.0,
                  offset: const Offset(0, 2),
                ),
                const BoxShadow(
                  color: Colors.transparent,
                  offset: Offset(-5, 0),
                )
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2.9,
                  height: MediaQuery.of(context).size.height / 6,
                  child: ClipRRect(
                    // this to change the shape of the child inside in our case thw img
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10)),
                    child: Image.network(
                      widget.serviceInfo!.images.displayImage.url
                              .contains('http')
                          ? widget.serviceInfo!.images.displayImage.url
                          : "https://crafty-server.azurewebsites.net/api/download/${widget.serviceInfo!.images.displayImage.url}",
                      headers: {
                        'Authorization': 'bb ${locator<App>().getUserToken()}'
                      },
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.7,
                  height: MediaQuery.of(context).size.height / 6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //icon rating
                      Column(
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.serviceInfo!.user.name,
                                style: const TextStyle(
                                    fontFamily: AppConst.font,
                                    color: AppConst.textColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              ),
                              InkWell(
                                onTap: () {
                                  if (!isItInFavorite) {
                                    final data = List<ServiceEntity>.from(
                                        locator<FavoriteScreen>()
                                            .dataValue
                                            .value)
                                      ..add(widget.serviceInfo!);
                                    locator<FavoriteScreen>().dataValue.value =
                                        data;
                                  } else {
                                    final data = List<ServiceEntity>.from(
                                        locator<FavoriteScreen>()
                                            .dataValue
                                            .value)
                                      ..remove(widget.serviceInfo!);

                                    locator<FavoriteScreen>().dataValue.value =
                                        data;
                                  }
                                  setState(() {
                                    isItInFavorite = !isItInFavorite;
                                  });
                                },
                                child: !isItInFavorite
                                    ? const Icon(
                                        Icons.favorite_border,
                                        color: Colors.grey,
                                      )
                                    : const Icon(
                                        Icons.favorite,
                                        color: AppConst.orong,
                                      ),
                              )
                            ],
                          ), // name text
                          const SizedBox(
                            height: 8,
                          ),
                          Container(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                textAlign: TextAlign.start,
                                widget.serviceInfo!.description,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontFamily: AppConst.font,
                                    color: AppConst.textColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 3,
                                child: Text(
                                  '${widget.serviceInfo!.user.location.state}, ${widget.serviceInfo!.user.location.district}', // i need to handel location somewher
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      color: AppConst.textColor,
                                      fontFamily: AppConst.font),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    '(${widget.serviceInfo!.user.rateCount})',
                                    style: const TextStyle(
                                      color: AppConst.textColor,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.star_rate_rounded,
                                    color: AppConst.orong,
                                  ),
                                  Text(
                                    '${widget.serviceInfo!.user.rate} ',
                                    style: const TextStyle(
                                        color: AppConst.orong,
                                        fontFamily: AppConst.font,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 4,
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
