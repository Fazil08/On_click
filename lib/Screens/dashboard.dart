import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart';
import 'package:loading_overlay/loading_overlay.dart';

import 'package:http/http.dart' as http;
import 'package:on_click/Screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Google_SignIn/google.dart';
import 'details.dart';

class home extends StatefulWidget {
  String? naa;
   home({Key? key,
  this.naa}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  void initState() {
    alldetails();
    getdats();
    super.initState();
  }

  var detail;
  var detai;
  var images = [];
  var abd = [];
  alldetails() async {
    setState(() {
      isSpinner = true;
    });
    var url = "http://doctors.smartersvision.com/mock/doctors/all.json";
    final responce = await http.get(Uri.parse(url));
    // print(responce);
    detail = json.decode(responce.body);
    if (detail['message'] == "Success") {
      print("Datas:");
      //print(detail['data'][0]['name']);
      detai = detail['data'];
      print(detai[0]['speciality']);
      for (int ine = 0; ine < detai.length; ine++) {
        abd.add(detai[ine]['media'][0]['url']);
      }
      print(abd[0]);
      setState(() {
        isSpinner = false;
      });
    } else {
      print("notihn");
    }
  }

  String? nam;
  void getdats() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      nam = preferences.getString('maill');
      nam = preferences.getString('GoogleUserName');
    });
  }

  bool isSpinner = false;
 //Spinner
  final spinkitNew = SpinKitWave(
    itemBuilder: (BuildContext context, int index) {
      return DecoratedBox(decoration: BoxDecoration(color: index.isEven ? Colors.blue : Colors.lightBlueAccent,));
    },
  );



    //for logout (Working)
  Future<bool?> showWarn(BuildContext context) async => showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
            title: Text("Do you want to Logout?"),
            actions: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.white),
                onPressed: () async {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) =>Signing()),
                      (Route<dynamic> route) => false);
                  await GoogleSignInApi.logout();
                 },
                child: Text(
                  "Yes",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  onPressed: () {
                    Navigator.pop(context, false);
                    // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>login()), (route) => false);
                  },
                  child: Text(
                    "No",
                    style: TextStyle(color: Colors.blue),
                  ))
            ],
          ));


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromRGBO(49, 43, 71, 8),
      appBar: AppBar(
        leading:  Icon(Icons.menu),
        backgroundColor:  Color.fromRGBO(49, 43, 71, 8),
        elevation: 1.2,
        title: Row(
          children: [
            Text(
              "Hello",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(child: Text(widget.naa.toString()))
          ],
        ),
        actions: [
          Padding(
            padding:  EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap:(){
                showWarn(context);
              },
              child: Container(
                  width: 50.w,
                  height: 50.h,
                  color: Colors.transparent,
                  child: const Icon(
                    Icons.logout,
                    size: 30,
                    color: Colors.white,
                  )),
            ),
          ),
        ],
      ),
      body: LoadingOverlay(
        isLoading: isSpinner,
        progressIndicator: spinkitNew,
        child: ListView(
          children: [
            if (detai != null)
              for (int index = 0; index < detai.length; index++)
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => details(
                                  name: detai[index]['name'],
                                  special: detai[index]['speciality']['name'],
                                  no: detai[index]['phone'],
                                  email: detai[index]['email'],
                                  address: detai[index]['address'],
                                )));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 300,
                      height: 100,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: Colors.lightBlueAccent.withOpacity(0.5),
                        child: Row(
                          children: [
                            //for(int ind =0; ind < abd.length; ind++)
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Container(
                                height: 80.h,
                                width: 80.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(80)),
                                child: Image.network(
                                  abd[index],
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Text(detai[index]['name'])
                          ],
                        ),
                      ),
                    ),
                  ),
                )
          ],
        ),
      ),
    );
  }
}
