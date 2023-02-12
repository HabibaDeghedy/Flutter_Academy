import 'package:flutter/material.dart';
import 'package:groceries_app_ui/gridview_screen.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/assets/images/loginscreen.jpg"),
             // fit: BoxFit.cover,
            ),
          ),

          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 350,),
                const Text("Get your groceries with nectar",
                  style: TextStyle(
                    fontSize:25,
                    fontWeight: FontWeight.bold,
                  ),),
                const SizedBox(height: 10,),
                IntlPhoneField(
                  decoration: const InputDecoration(
                    helperMaxLines: 2,
                    hintText: 'phone number',
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (phone){
                    print(phone.completeNumber);
                  },
                  onCountryChanged: (country){
                    print('Country changed to: ' + country.name);
                  },
                ),
                const SizedBox(height: 10,),
                const Center(
                  child: Text("Or connect with social media",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize:11,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),),
                ),
                const SizedBox(height: 10,),
                Center(
                  child: Container(
                    width: 250,
                    height: 50,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: MaterialButton(
                      color: Colors.blue[400],
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => GridViewScreen(),
                        ));
                      }, child: Row(
                        children: [
                          ImageIcon(
                            AssetImage("lib/assets/images/google.png"),
                          ),
                          SizedBox(width: 15,),
                          Text('Continue with Google'),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                Center(
                  child:Container(
                    width: 250,
                    height: 50,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: MaterialButton(
                      color: Colors.blue[700],
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => GridViewScreen(),
                        ));
                      }, child: Row(
                      children: [
                        ImageIcon(
                          AssetImage("lib/assets/images/fb.png"),
                        ),
                        SizedBox(width: 15,),
                        Text('Continue with Facebook'),
                      ],
                    ),
                    ),
                  ),
                ),
              ],
            ),
          ) ,
        ),



    );
  }
}
