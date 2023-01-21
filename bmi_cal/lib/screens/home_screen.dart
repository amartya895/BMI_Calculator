// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var bgColor = Colors.blue.shade100;

  var result = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BMI Calculator")),
      body: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(color: bgColor),
        child: Center(
          child: Column(
            children: [
              Text(
                "Weight Details",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: wtController,
                decoration: InputDecoration(
                    label: Text(
                      "Weight in Kgs",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.line_weight,
                      color: Colors.blue,
                    )),
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "Height Details",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              Row(
                children: <Widget>[
                  Flexible(
                    child: TextField(
                      controller: ftController,
                      decoration: InputDecoration(
                          label: Text(
                            "Height in Ft",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          prefixIcon: Icon(
                            Icons.height,
                            color: Colors.blue,
                          )),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Flexible(
                    child: TextField(
                      controller: inController,
                      decoration: InputDecoration(
                          label: Text(
                            "Height in Inch",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          prefixIcon: Icon(
                            Icons.height,
                            color: Colors.blue,
                          )),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      height: 70,
                      width: 150,
                      child: ElevatedButton(
                          onPressed: onPressedCal,
                          child: Text("Calulate",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.w400)))),
                  SizedBox(
                    width: 30,
                  ),
                  Container(
                      height: 70,
                      width: 150,
                      child: ElevatedButton(
                          onPressed: onPressedReset,
                          child: Text(
                            "Reset",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w400),
                          ))),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                result,
                style: TextStyle(
                    fontSize: 26,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onPressedCal() {
    FocusManager.instance.primaryFocus?.unfocus();
    var wt = wtController.text.toString();
    var ft = ftController.text.toString();
    var In = inController.text.toString();

    if (wt != "" && ft != "" && In != "") {
      //calulate BMI
      var iwt = int.parse(wt);
      var iFt = int.parse(ft);
      var iIn = int.parse(In);

      var tInch = (iFt * 12) + iIn;

      var tCm = tInch * 2.54;
      var tM = tCm / 100;
      var bmi = iwt / (tM * tM);

      var msg = "";

      if (bmi > 25) {
        msg = "You are Overweight..!!";
        bgColor = Colors.red.shade100;
      } else if (bmi < 18) {
        msg = "You are Underweight..!!";
        bgColor = Colors.orange.shade100;
      } else {
        msg = "You are Fit..!!";
        bgColor = Colors.green.shade100;
      }

      setState(() {
        result = "\t\t\t\t Your BMI : ${bmi.toStringAsFixed(2)} \n $msg";
      });
    } else {
      setState(() {
        result = "Please fill all the required field";
      });
    }
  }

  void onPressedReset() {
    setState(() {});
    bgColor = Colors.blue.shade100;

    wtController.clear();
    ftController.clear();
    inController.clear();
  }
}
