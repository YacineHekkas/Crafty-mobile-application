import 'package:cp_project/core/global/global.dart';
import 'package:flutter/material.dart';

class searchBar extends StatelessWidget {

  const searchBar({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        // navigate to search page
      },
      child:Container(
        width: MediaQuery.of(context).size.width/1.1,
        height: 50,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 5.0,
              spreadRadius: 1.0,
              offset: Offset(0,5),
            ),
            const BoxShadow(
              color: Colors.white,
              offset: Offset(-5,0),
            )

          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Stack(
          children:  const [
            Align(
              alignment: Alignment(-1, 0),
              child: Icon(
                color: Colors.black87,
                Icons.search,
                size: 35.0,
              ),
            ),
            Align(
              alignment: Alignment(-0.7, 0),
              child: Text(
                'Search',
                style: TextStyle(
                  fontFamily: AppConst.font,
                  fontSize: 20,
                  color: AppConst.textColor
                ),
              ),
            ),

          ],
        ),

      ),
    );
  }
}

