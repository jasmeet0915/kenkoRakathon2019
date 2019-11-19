import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math' as math;


class ProfilePageDesign extends StatefulWidget {
  @override
  _ProfilePageDesignState createState() => _ProfilePageDesignState();
}

class _ProfilePageDesignState extends State<ProfilePageDesign> {

  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Profile",
      home: ProfilePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProfilePage extends StatelessWidget {

  TextStyle _style(){
    return TextStyle(
      fontWeight: FontWeight.bold
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 26),
         children: <Widget>[Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
              SizedBox(height: 16,),
            Text("Name"),
            SizedBox(height: 4,),
            Text("Hiroshi Mikitani", style: _style(),),
            SizedBox(height: 16,),

            Text("Email"),
            SizedBox(height: 4,),
            Text("hiroshi@rakuten.com", style: _style(),),
            SizedBox(height: 16,),

            Text("Residential Address"),
            SizedBox(height: 4,),
            Text("A Block - 315, Kobe, Japan", style: _style(),),
            SizedBox(height: 16,),

            Text("Health Insurance"),
            SizedBox(height: 4,),
            Text("Yes", style: _style(),),
            SizedBox(height: 16,),

            Text("Organization"),
            SizedBox(height: 4,),
            Text("Rakuten", style: _style(),),
            SizedBox(height: 16,),

            Divider(color: Colors.grey,),
            SizedBox(height: 8,),
            Text("Birth Mark"),
            SizedBox(height: 4,),
            Text("Mole on left shoulder", style: _style(),),
            SizedBox(height: 16,),

            Text("Diabetes"),
            SizedBox(height: 4,),
            Text("Blood glucose high", style: _style(),),
            SizedBox(height: 16,),

            Text("Physically Challenged"),
            SizedBox(height: 4,),
            Text("None", style: _style(),),
            SizedBox(height: 8,),

            
            Divider(color: Colors.grey,),
            SizedBox(height: 13,),

            Center(
              child: new Text("Current Medications", style: _style(),),
            ),
            SizedBox(height: 15,),

            Text("Medicine: Ramipril", style: _style(),),
            SizedBox(height: 8,),
            Text("Dose : 5mg"),
            SizedBox(height: 8,),
            Text("Use : HyperTention"),
            SizedBox(height: 8,),
            Text("Side Effects: Patient may pass out, fever and chills"),
            SizedBox(height: 15,),
            

            Text("Medicine: Simvastatin", style: _style(),),
            SizedBox(height: 8,),
            Text("Dose : 40mg"),
            SizedBox(height: 8,),
            Text("Use :  Prevent heart strokes"),
            SizedBox(height: 8,),
            Text("Side Effects: Nausea and Kidney Failure in rare case"),
            SizedBox(height: 15,),
            
            
            Text("Medicine: Metoprolol", style: _style(),),
            SizedBox(height: 8,),
            Text("Dose : 20mg"),
            SizedBox(height: 8,),
            Text("Use : Treat chest pains"),
            SizedBox(height: 8,),
            Text("Side Effects: Slow heart beat Fainting"),
            SizedBox(height: 70,),
            
          ],
         ),
         ],
      ),
      
      floatingActionButton: FloatingActionButton.extended(
      onPressed: () {
        // Add your onPressed code here!
       _launchCaller();
      },
      label: Text('Emergency Call'),
      icon: Icon(Icons.phone),
      backgroundColor: Colors.pink,
       ),
      
    );
  }
}

_launchCaller() async {
    const url = "tel:8802327251";   
    if (await canLaunch(url)) {
       await launch(url);
    } else {
      throw 'Could not launch $url';
    }   
}

final String url = "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRN54EQqKXbDxcBCHrptRo9zbHDbO9j7oo7dewMJZ6VH0pRdGb9";

class CustomAppBar extends StatelessWidget
  with PreferredSizeWidget{

  @override
  Size get preferredSize => Size(double.infinity, 230);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        padding: EdgeInsets.only(top: 4),
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          boxShadow: [
            BoxShadow(
              color: Colors.red,
              blurRadius: 20,
              offset: Offset(0, 0)
            )
          ]
        ),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.menu, color: Colors.blueAccent,),
                  onPressed: (){},
                ),

                Text("Patient Details", style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),),

                IconButton(
                  icon: Icon(Icons.notifications, color: Colors.blueAccent,),
                  onPressed: (){},
                )
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                
                Column(
                  children: <Widget>[
                    Container(
                      width: 110,
                      height: 110,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(url)
                          )
                      ),
                    ),
                    
                    SizedBox(height: 16,),
                    
                    Text("  Hiroshi Mikitani", style: TextStyle(
                      color: Colors.white,
                      fontSize: 20
                    ),)
                  ],
                ),
        
                Column(
                  children: <Widget>[
                    Text("Blood Grp", style: TextStyle(
                      color: Colors.white
                    ),),
                    Text("A+", style: TextStyle(
                        fontSize: 20,
                        color: Colors.white
                    ),)
                  ],
                ),

                Column(
                  children: <Widget>[
                    Text("Age", style: TextStyle(
                        color: Colors.white
                    ),),
                    Text("54", style: TextStyle(
                        fontSize: 20,
                        color: Colors.white
                    ),)
                  ],
                ),


                Column(
                  children: <Widget>[
                    Text("Gender", style: TextStyle(
                        color: Colors.white
                    ),),
                    Text("M", style: TextStyle(
                        fontSize: 20,
                        color: Colors.white
                    ),)
                  ],
                ),
              ],
            ),
            
            

          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path>{

  @override
  Path getClip(Size size) {
    Path p = Path();

    p.lineTo(0, size.height);
    p.lineTo(size.width, size.height);

    p.lineTo(size.width, 0);

    p.close();

    return p;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}