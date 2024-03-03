import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_smart_home/SmartDevice.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List mySmartDevices = [
    ["Smart Light", "assets/icons/light-bulb.png",true],
    ["Smart AC", "assets/icons/air-conditioner.png",false],
    ["Smart TV", "assets/icons/smart-tv.png",false],
    ["Smart Fan", "assets/icons/fan.png",false],
  ];

  void powerSwitchChanged(bool value, int index){
    setState(() {
      mySmartDevices[index][2]=value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
          child: Column(
        children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset("assets/icons/menu.png",
              height: 45,
              color: Colors.grey[800],
              ),
              Icon(Icons.person,size: 45,color: Colors.grey[800],)
            ],
          ),
         ),
          SizedBox(
            height: 20,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal:30, vertical: 25 ),
          child: Column(
            children: [
              Text("Welcome to our Home",
                style: TextStyle(
                  fontSize: 20,color: Colors.grey.shade800
                ),
              ),
              Text("Vipin's Villa",style: GoogleFonts.bebasNeue(fontSize: 72),
              ),
            ],
          ),
      ),
          SizedBox(
            height: 25,
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Divider(
            thickness: 1,
            color: Color.fromARGB(255, 204, 204, 204),
          ),
    ),
          SizedBox(
            height: 25,
          ),
          Text("Smart Devices",style: TextStyle(
            fontWeight:  FontWeight.bold,
            fontSize: 24,
            color: Colors.grey.shade800,
          ),),
          SizedBox(height: 25,
          ),
          Expanded(
            child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1/1.3,
          ),
          itemCount: mySmartDevices.length,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 20),
            itemBuilder: (context, index){
            return SmartDevice(
              smartDeviceName:mySmartDevices[index][0],
              iconPath:mySmartDevices[index][1],
              powerOn:mySmartDevices[index][2],
              onChanged: (value) => powerSwitchChanged(value, index),
            );
            }

          ),
          ),
        ],
      )),
    );
  }
}