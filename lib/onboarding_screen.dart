import 'package:flutter/material.dart';
import 'package:groceries_app_ui/login_screen.dart';

class Onboarding_Screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/assets/images/onboarding.png"),
              // fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 350,),
                const Image(image: AssetImage("lib/assets/images/carrot.png"),
                  width: 25,
                  height: 25,),
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text('Welcome',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),),
                ),
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text('to our store',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),),
                ),
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text('Get your groceries in as fast as one hour',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),),
                ),
                const SizedBox(height: 15,),
                Container(
                  width: 250,
                  height: 70,
                  child: FloatingActionButton.extended(
                    label: const Align(
                      child: Text('Get started',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),),
                    ), // <-- Text
                    backgroundColor: Colors.green[500],
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),
                      ));
                    },
                  ),
                ),

              ],
            ),
          ),
        ),
    );
  }
}
