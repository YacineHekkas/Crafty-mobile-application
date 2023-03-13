import 'package:cp_project/core/global/global.dart';
import 'package:cp_project/featurs/home/domain/entities/service_entitie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ServiceDetails extends StatelessWidget {

  final ServiceEntity? serviceInfo;
  const ServiceDetails({Key? key,required this.serviceInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            top: false,
            child:Stack(
              children: [
                CustomScrollView(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    SliverAppBar(
                      expandedHeight: 275.0,
                      backgroundColor: Colors.white,
                      elevation: 0.0,
                      pinned: true,
                      stretch: true,
                      flexibleSpace: FlexibleSpaceBar(
                        background: Image.asset(
                          'assets/images/placeholder.webp',
                          fit: BoxFit.cover,
                        ),
                        stretchModes: const [
                          StretchMode.zoomBackground,
                        ],
                      ),
                      bottom: PreferredSize(
                        preferredSize: const Size.fromHeight(0.0),
                        child: Container(
                          height: 32.0,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(32.0),
                              topRight: Radius.circular(32.0),
                            ),
                          ),
                          child: Container(
                            width: 40.0,
                            height: 5.0,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(100.0),
                            ),
                          ),
                        ),
                      ),
                      leadingWidth: 80.0,
                      // leading: Container(
                      //
                      //   width: 10,
                      //   height: 10,
                      //   margin: const EdgeInsets.only(left: 24.0),
                      //   child: ClipRRect(
                      //     borderRadius: BorderRadius.circular(56.0),
                      //     child: BackdropFilter(
                      //       filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                      //       child: Container(
                      //         height: 36.0,
                      //         width: 36.0,
                      //         alignment: Alignment.center,
                      //         decoration: BoxDecoration(
                      //           shape: BoxShape.circle,
                      //           color: Colors.white.withOpacity(0.20),
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                '${serviceInfo!.user.name}',
                                style: const TextStyle(
                                    fontFamily: AppConst.font,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold
                                )
                            ),
                            const SizedBox(height: 8.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                    'Setif, setif',
                                    style: TextStyle(
                                        color: AppConst.textColor,
                                        fontFamily: AppConst.font,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500
                                    )
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
                            const SizedBox(height: 20.0),
                            Text(
                                '${serviceInfo!.category}, ${serviceInfo!.subcategory}',
                                style: const TextStyle(
                                    fontFamily: AppConst.font,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500
                                )
                            ),
                            const SizedBox(height: 16.0),

                            const Divider(color: Colors.black, height: 1.0,endIndent: 20,),
                            const SizedBox(height: 16.0),
                            Text(
                              'Description',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              '${serviceInfo!.description} '
                                  'lorerererferrrf erferferf fer fge rg ergsgesrgwomveprmg jw  wergrgwe Your recipe has been uploaded, you can see it on your',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: Colors.black),
                            ),
                            const SizedBox(height: 16.0),
                            const Divider(color: Colors.black, height: 1.0),
                            const SizedBox(height: 16.0),
                            Text(
                              'Reviews',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(height: 6.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width/2,
                                  child:Stack(
                                    children: [
                                      Positioned(
                                        child: Card(
                                          color: Color.fromARGB(255, 0, 255, 0),
                                          shape: CircleBorder(),
                                          child: Container(
                                            width: 50,
                                            height: 50,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 30,
                                        child: Card(
                                          color: Colors.blueAccent,
                                          shape: CircleBorder(),
                                          child: Container(
                                            width: 50,
                                            height: 50,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 60,
                                        child: Card(
                                          color: Colors.purpleAccent,
                                          shape: CircleBorder(),
                                          child: Container(
                                            width: 50,
                                            height: 50,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 90,
                                        child: Card(
                                          color: Colors.greenAccent,
                                          shape: CircleBorder(),
                                          child: Container(
                                            width: 50,
                                            height: 50,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ) ,
                                ),
                                Text(
                                  '+${serviceInfo!.reviewCount} other people',
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                              ],
                            ),
                            // adding reviews
                            const SizedBox(height: 16.0),
                            const Divider(color: Colors.black, height: 1.0),
                            const SizedBox(height: 16.0),
                            Text(
                              'Images',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(height: 16.0),
                            const SizedBox(height: 150.0),
                            const Divider(color: Colors.black, height: 1.0),
                            // Center(
                            //   child:InkWell(
                            //     onTap: (){
                            //
                            //     },
                            //     child: Container(
                            //       height: 60,
                            //       decoration: BoxDecoration(
                            //           borderRadius: BorderRadius.circular(50),
                            //           color: AppConst.orong
                            //       ),
                            //       width: MediaQuery.of(context).size.width/1.2,
                            //     ),
                            //   ) ,
                            // )
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
                Padding(
                    padding: EdgeInsets.all(10),
                  child:Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: MediaQuery.of(context).size.width/1.5,
                        height: 50,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 1,
                                blurRadius: 2,
                                offset: Offset(0, 3),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(50),
                            color: AppConst.orong
                        ),
                        child:const Center(
                          child:Text(
                              'Contact',
                            style: TextStyle(
                              color: CupertinoColors.white,
                              fontFamily: AppConst.font,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1
                            ),
                          ),
                        ) ,

                      )
                  ) ,
                )
              ],
            )
        )
    );
  }
}

// Row(
//     children: [
//       const Text('Food'),
//       const SizedBox(width: 8.0),
//       Container(
//         height: 5.0,
//         width: 5.0,
//         decoration: const BoxDecoration(
//           color: Colors.black,
//           shape: BoxShape.circle,
//         ),
//       ),
//       const SizedBox(width: 8.0),
//       const Text('60 mins'),
//     ],
//   ),

