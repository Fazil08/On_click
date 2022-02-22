import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_click/Screens/dashboard.dart';
import 'package:on_click/Screens/login.dart';

import 'Screens/Splash_Screen/splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const on_click());
}

class on_click extends StatelessWidget {
  const on_click({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ScreenUtilInit(
        designSize: const Size(375, 794),
        builder: () => const MaterialApp(
            debugShowCheckedModeBanner: false, home: SplashScreen()));
  }
}

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
      required this.email})
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
            padding: const EdgeInsets.all(15),
            child: SizedBox(
              width: 230.w,
              height: 200.h,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.green.withOpacity(0.5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25, top: 10),
                      child: Text(
                        "Name:" + "  " + widget.name.toString(),
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 25,
                      ),
                      child: Text(
                        "Speacialisation:" + " " + widget.special.toString(),
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(
                            left: width(context) * 0.035,
                            right: width(context) * 0.035),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                offset: Offset(1.0, 3.0), //(x,y)
                                blurRadius: 40),
                          ],
                        ),
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
                                ),
                                ExpansionTile(
                                    title: Text('Areas of Improvement'),
                                    // subtitle: Text(''),
                                    children: [
                                      Container(
                                        width: 230.w,
                                        height: 200.h,
                                        color: Colors.green.withOpacity(0.5),
                                      )
                                    ]),
                              ],
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
