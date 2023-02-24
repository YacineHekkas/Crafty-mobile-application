import 'package:cp_project/core/global/global.dart';
import 'package:flutter/material.dart';

import '../login_Screen.dart';

class chooseS_P extends StatefulWidget {
  const chooseS_P({Key? key}) : super(key: key);
  @override
  State<chooseS_P> createState() => _chooseS_PState();
}

class _chooseS_PState extends State<chooseS_P> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child:Container(
                  decoration: const BoxDecoration(
                    color: AppConst.bleusky,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight:Radius.circular(20)),
                  ),
                  alignment: const Alignment(0,0.9),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height/4.5,

                ),
              ),
              Align(
                alignment: Alignment(0,0.65),
                child:SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height:MediaQuery.of(context).size.height/5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      cardtyp('assets/images/findservice.png','Looking for Services ?'),
                      cardtyp('assets/images/provideservice.jpg','Provide some Services'),
                    ],
                  ),
                ),
              )
            ],
          ),
        )
    );
  }

  Widget cardtyp(String imgLien,String txtdesc){
    return InkWell(
      onTap:(){
        if(txtdesc == "Looking for Services ?"){
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => LoginScreen()),
          );
          // here we need to do some logic to see whether we are going to work with client or both
        }else{
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => LoginScreen()),
          );
        }
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        child:Stack(
          children: [
            ClipRRect(// this to change the shape of the childe inside in our case thw img
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              child: Image.asset(
                imgLien,
                width:MediaQuery.of(context).size.width/2.5,
                height:MediaQuery.of(context).size.height/5.5 ,
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
                    0.3,1
                  ]
                )
              ),
              height:MediaQuery.of(context).size.height/5.5 ,
              width:MediaQuery.of(context).size.width/2.5,

              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.symmetric(
                vertical:10,
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
