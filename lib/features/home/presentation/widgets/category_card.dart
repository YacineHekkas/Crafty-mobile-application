import 'package:cp_project/core/global/global.dart';
import 'package:cp_project/core/util/app.dart';
import 'package:cp_project/features/home/domain/entities/service_entitie.dart';
import 'package:flutter/material.dart';

import '../../../../injection_container.dart';

class CategoryCard extends StatelessWidget {
  final Function() onSelected;

  final ServiceEntity? serviceInfo;
  // im gonna add all of this in user entity and use it directly


  const CategoryCard(
      {Key? key,
      required this.onSelected, required this.serviceInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 10),
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
                Container(
                  width: MediaQuery.of(context).size.width/2.9,
                  child:ClipRRect(
                    // this to change the shape of the child inside in our case thw img
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10)),
                    child: Image.network(serviceInfo!.images.displayImage.url.contains('http') ? serviceInfo!.images.displayImage.url :
                    "https://crafty-server.azurewebsites.net/api/download/${serviceInfo!.images.displayImage.url}",
                      headers: {
                        'Authorization': 'bb ${locator<App>().getUserToken()}'
                      },
                      fit: BoxFit.fill,
                    ),
                  ) ,
                )
                ,
                const SizedBox(
                  width: 8,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.7,
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
                            serviceInfo!.user.name,
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
                      SizedBox(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child:
                            Text(
                              textAlign:TextAlign.start,
                              serviceInfo!.description,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontFamily: AppConst.font,
                                  color: AppConst.textColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width /3,
                            child: Text(
                              '${serviceInfo!.user.location.state}, ${serviceInfo!.user.location.district}', // i need to handel location somewher
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
                      const SizedBox(
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
