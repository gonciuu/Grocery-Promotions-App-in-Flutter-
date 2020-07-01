import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SpinKitDoubleBounce(
              size: 70.0,
              color: Colors.white,
            ),SizedBox(height: 13.0,),
            SizedBox(
              width: 149.0,
              child: TyperAnimatedTextKit(
                  onTap: () {
                    print("Tap Event");
                  },
                  text: [
                    "Loading...",
                  ],
                  textStyle: TextStyle(fontSize: 30.0, fontFamily: "mont",color: Colors.white,fontWeight: FontWeight.w600),
                  textAlign: TextAlign.start,
                  alignment:
                      AlignmentDirectional.topStart // or Alignment.topLeft
                  ),
            )
          ],
        ),
      ),
    );
  }
}
