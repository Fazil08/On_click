import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:on_click/Screens/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Google_SignIn/google.dart';

class Signing extends StatefulWidget {
  const Signing({Key? key}) : super(key: key);

  @override
  _SigningState createState() => _SigningState();
}

TextEditingController Email = new TextEditingController();
TextEditingController password = new TextEditingController();

double height(BuildContext context) => MediaQuery.of(context).size.height;
double width(BuildContext context) => MediaQuery.of(context).size.width;

void getdata() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setString("maill", Email.text);
  print(preferences.getString('maill'));
}

class _SigningState extends State<Signing> {
  final Forms = GlobalKey<FormState>();
  bool obs = false;
  var Email = new TextEditingController();
  var password = new TextEditingController();
  bool showspinner = false;
  //Spinner
  final spinkitNew = SpinKitWave(
    itemBuilder: (BuildContext context, int index) {
      return DecoratedBox(decoration: BoxDecoration(color: index.isEven ? Colors.blue : Colors.lightBlueAccent,));
    },
  );





  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return Scaffold(
      body: LoadingOverlay(
        isLoading:showspinner,
        progressIndicator:spinkitNew ,
        child: Stack(
          children: [
            Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  "assets/back.png",
                  fit: BoxFit.cover,
                )),
            ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 230, left: 40, right: 40),
                  child: Card(
                    child: Container(
                      //width: width(context) * 0.8,
                      //height: height(context) * 0.50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                offset: Offset(1.0, 3.0), //(x,y)
                                blurRadius: 10),
                          ]),
                      child: Form(
                        key: Forms,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                vertical: height(context) * 0.05),
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: Email,
                                  validator: (val) => val!.isEmpty ? '' : null,
                                  cursorColor:
                                      Color.fromRGBO(135, 135, 186, 10.0),
                                  style: TextStyle(
                                      color: Color.fromRGBO(135, 135, 186, 10.0)),
                                  keyboardType: TextInputType.emailAddress,
                                  textAlign: TextAlign.start,
                                  decoration:
                                      InputDecoration(labelText: "UserName"),
                                ),
                                SizedBox(
                                  height: height(context) * 0.01,
                                ),
                                TextFormField(
                                  controller: password,
                                  validator: (val) => val!.isEmpty ? '' : null,
                                  cursorColor:
                                      Color.fromRGBO(135, 135, 186, 10.0),
                                  obscureText: obs,
                                  style: TextStyle(
                                      color: Color.fromRGBO(135, 135, 186, 10.0)),
                                  keyboardType: TextInputType.text,
                                  textAlign: TextAlign.start,
                                  decoration: InputDecoration(
                                      labelText: "Password",
                                      suffixIcon: IconButton(
                                        icon: obs
                                            ? Icon(Icons.visibility)
                                            : Icon(Icons.visibility_off),
                                        onPressed: () {
                                          setState(() {
                                            if (obs) {
                                              obs = false;
                                            } else {
                                              obs = true;
                                            }
                                          });
                                        },
                                      )),
                                ),
      
                                SizedBox(height: 20),
                                GestureDetector(
                                  onTap: () {
                                    if (validateAndSave()) {
                                      setState(() {
                                        showspinner = true;
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => home(naa: Email.text,)));
                                      });
                                      showspinner =true;
                                    } else {
                                      setState(() {
                                        //showSpinner = false;
                                        toast();
                                      });
                                    }
                                  },
                                  child: Card(
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 45,
                                      decoration: BoxDecoration(
                                          color: Colors.orange,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))),
                                      child: Center(
                                        child: Text(
                                          'LOGIN',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                // Image.asset("assets/or.png"),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                          width: 30,
                                          height: 30,
                                          child: Image.asset("assets/f.png")),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                          width: 30,
                                          height: 30,
                                          child: Image.asset("assets/t.png")),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                        onTap: signIn,
                                        child: Container(
                                            width: 30,
                                            height: 30,
                                            child:
                                                Image.asset("assets/google.png")),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 620),
              child: Center(
                  child: Text(
                "version 1.0.0",
                style: TextStyle(color: Colors.white, fontSize: 10),
              )),
            )
          ],
        ),
      ),
    );
  }

  //to validate and the username and password
  bool validateAndSave() {
    final form = Forms.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void toast() async {
    Fluttertoast.showToast(
        msg: "UserName/Passwrod Required",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  String? GoogleUser;
  Future signIn() async {
    print("wkjekw");
    final Guser = await GoogleSignInApi.login();
    print(Guser!.email);
    print(Guser.displayName);
    print(Guser.photoUrl);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('GoogleUser', Guser.email.toString());
    preferences.setString('GoogleUserName', Guser.displayName.toString());
    preferences.setString('GoogleUrl', Guser.photoUrl.toString());
    print(preferences.getString('GoogleUrl'));
    GoogleUser = preferences.getString('GoogleUser');

    try {
      if (Guser.email.isEmpty) {
        print("No User fazil");
        // setState(() {
        //   showSpinner = true;
        // });
      } else {
        //getGoogleUserdata();
        setState(() {
          showspinner =true;
        });
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => home(naa: Guser.displayName,)));
            setState(() {
              showspinner=false;
            });
      }
    } catch (e) {
      print(e);
    }
  }
}
