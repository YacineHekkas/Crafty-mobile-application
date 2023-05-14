import 'package:cp_project/core/global/global.dart';
import 'package:cp_project/core/util/app.dart';
import 'package:cp_project/features/registration/presentation/pages/login/login_page.dart';
import 'package:cp_project/features/registration/presentation/pages/signup_pages/first_page.dart';
import 'package:cp_project/injection_container.dart';
import 'package:flutter/material.dart';


class chooseS_P extends StatefulWidget {
  const chooseS_P({Key? key}) : super(key: key);
  @override
  State<chooseS_P> createState() => _chooseS_PState();
}

class _chooseS_PState extends State<chooseS_P> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
      child: Stack(
        children: [
          const Align(
            alignment: Alignment(-0.75, -0.85),
            child: Text(
              'Welcome to',
              style: TextStyle(
                color: AppConst.darkBlue,
                fontFamily: AppConst.font,
                fontSize: 28,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Align(
            alignment: Alignment(-0.75, -0.75),
            child: Text(
              'Crafty',
              style: TextStyle(
                color: AppConst.darkBlue,
                fontFamily: AppConst.font,
                fontSize: 40,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: const BoxDecoration(
                color: AppConst.skyBlue,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              alignment: const Alignment(0, 0.9),
              height: MediaQuery.of(context).size.height / 4.5,
            ),
          ),
          Align(
            alignment: const Alignment(0, 0.65),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  cardtyp('assets/images/find.jpg', 'Looking for Services'),
                  cardtyp('assets/images/provide.jpg', 'Provide some Services'),
                ],
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0, 0.85),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsetsDirectional.only( end: 10.0),
                  width: MediaQuery.of(context).size.width/ 7,
                  height: 3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color:Colors.black,
                  ),

                ),
                const Text(
                  "OR",
                  style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),

                ),
                Container(
                  margin: const EdgeInsetsDirectional.only( start: 10.0),
                  width: MediaQuery.of(context).size.width/ 7,
                  height: 3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color:Colors.black,
                  ),

                )
              ],
            ),
          ),
          Container(
            // continue as guest Container
            alignment: const Alignment(0, 0.95),
            child: GestureDetector(
              onTap: () async {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Loginscreen()
                    )
                );

                final app = locator<App>();

                if (app.getShowIntro() == null) {
                  await app.setShowIntro();
                }
              },
              child: const Text(
                'Login',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }

  Widget cardtyp(String imgLien, String txtdesc) {
    return InkWell(
      onTap: () async {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FirstPage()),
        );

        final app = locator<App>();

        app.setProvider(value: txtdesc != "Looking for Services");
        if (app.getShowIntro() == null) {
          await app.setShowIntro();
        }
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        child: Stack(
          children: [
            ClipRRect(
              // this to change the shape of the childe inside in our case thw img
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              child: Image.asset(
                imgLien,
                width: MediaQuery.of(context).size.width / 2.5,
                height: MediaQuery.of(context).size.height / 5.5,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0),
                        Colors.black.withOpacity(0.9)
                      ],
                      stops: const [
                        0.3,
                        1
                      ])),
              height: MediaQuery.of(context).size.height / 5.5,
              width: MediaQuery.of(context).size.width / 2.5,
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: Text(
                txtdesc,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
