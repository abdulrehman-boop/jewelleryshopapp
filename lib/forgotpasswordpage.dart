import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'loginpage.dart';
class Jewellery2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50),
            Center(
              child: Text("Rao Jewellery",
              style: GoogleFonts.dancingScript(
                fontSize: 55,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
                ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "Forgot Password!",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "Enter your Email to recieve a password reset link.",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            SizedBox(height:15 ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding : EdgeInsets.only(left: 15),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Email",
                    prefixIcon: Icon(Icons.mail,color:Colors.orange),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            ElevatedButton(onPressed: ()
            {

            },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  minimumSize: Size(300, 50),
                  // Change this to your desired color
                ),
                child: Text("Submit",
                  style: TextStyle(
                      color: Colors.white
                  ),)),
            SizedBox(height: 345),
            RichText(
              text: TextSpan(
                text: "Already have an account? ",
                style: TextStyle(fontSize: 18, color: Colors.black),
                children: [
                  WidgetSpan(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Jewellery1()),
                        );
                      },
                      child: Text(
                        "Sign in",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.orange),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }

}