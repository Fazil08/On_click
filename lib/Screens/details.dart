import 'package:checkbox_formfield/checkbox_list_tile_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class details extends StatefulWidget {
  String name;
  String special;
  String no;
  String address;
  // String cash;
  String email;
 

  details(
      {Key? key,
      required this.name,
      required this.special,
      required this.no,
      required this.address,
      // required this.cash,
      required this.email,
      })
      : super(key: key);

  @override
  _detailsState createState() => _detailsState();
}

class _detailsState extends State<details> {
  double height(BuildContext context) => MediaQuery.of(context).size.height;
  double width(BuildContext context) => MediaQuery.of(context).size.width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(49, 43, 71, 8),
        title: Text(widget.special),
      ),
      body: ListView(
        children: [
         
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Container(
                margin: EdgeInsets.only(
                    left: width(context) * 0.035,
                    right: width(context) * 0.035),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(1.0, 3.0), //(x,y)
                        blurRadius: 40),
                  ],
                ),
                child: Column(children: [
                  Stack(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10,left: 25),
                            child: Text("Name:" + " "+ widget.name.toString(),style: TextStyle(fontSize: 20),),
                          ),
                          SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.only(left: 25),
                            child: Text("Specialisation:" + " "+ widget.special.toString(),style: TextStyle(fontSize: 20),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                          ),
                          ExpansionTile(title: Text('More Details'),
                              // subtitle: Text(''),
                              children: [
                                Padding(
                                  padding: const  EdgeInsets.only(right: 100,bottom: 20,left: 15),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Mobile No:"+" "+ widget.no.toString()),
                                      SizedBox(height: 10,),
                                      Text("Mail ID:"+ widget.email),
                                      SizedBox(height: 10,),
                                      Text("Address:"+ " "+ widget.address)
                                    ],
                                  ),
                                )
                              ]),
                        ],
                      ),
                    ],
                  ),
                ])),
          ),
        ],
      ),
    );
  }
}
