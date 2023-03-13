import 'package:cp_project/core/global/global.dart';
import 'package:cp_project/featurs/home/domain/entities/service_entitie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final Function() onSelected;

  final ServiceEntity? serviceInfo;
  // im gonna add all of this in user entity and use it directly


  CategoryCard(
      {Key? key,
      required this.onSelected, required this.serviceInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: InkWell(
          onTap: () {
            onSelected();
          },
          child: Container(
            height: MediaQuery.of(context).size.height / 6.5,
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
                ClipRRect(
                  // this to change the shape of the child inside in our case thw img
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                  child: Image.asset(
                    'assets/images/feed_home_page.png',
                    width: MediaQuery.of(context).size.width / 2.5,
                    height: MediaQuery.of(context).size.height / 6,
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.9,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //icon rating
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Text(
                            '${serviceInfo!.user.name}',
                            style: const TextStyle(
                                fontFamily: AppConst.font,
                                color: AppConst.textColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ), // name text
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Text(
                          '${serviceInfo!.description}',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontFamily: AppConst.font,
                              color: AppConst.textColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width /4,
                            child: Text(
                              'wilaya,comun', // i need to handel location somewher
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
                                  '(${serviceInfo!.user.rateCount})',
                                  style: const TextStyle(
                                    color: AppConst.textColor,
                                  ),
                              ),
                              const Icon(
                                Icons.star_rate_rounded,
                                color: AppConst.orong,
                              ),
                              Text(
                                '${serviceInfo!.user.rate} ',
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
                        height: 10,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
