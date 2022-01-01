import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yara/components/constants.dart';
import 'package:yara/components/rounded_button.dart';
import 'package:yara/settings/card_details.dart';

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

StreamController<CardDetails> events =
    StreamController<CardDetails>.broadcast();

class _FormScreenState extends State<FormScreen> {
  late String NewFName;
  late String NewLName;
  late String NewCardNumber;
  late String NewCVV;
  late String NewMM;
  late String NewYY;
  TextEditingController _FName = new TextEditingController();
  TextEditingController _LName = new TextEditingController();
  TextEditingController _CardNumber = new TextEditingController();
  TextEditingController _CVV = new TextEditingController();
  TextEditingController _MM = new TextEditingController();
  TextEditingController _YY = new TextEditingController();
  final _cardKey = GlobalKey<FormState>();
  String error = '';

  @override
  Widget BFName() {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: kWhiteLightest,
        borderRadius: BorderRadius.circular(29),
      ),
      child: TextFormField(
        controller: _FName,
        decoration: InputDecoration(
          hintText: 'First Name',
          border: InputBorder.none,
        ),
        validator: (String? value) {
          if (value!.isEmpty) {
            return 'First name is required';
          }
          return null;
        },
        onChanged: (value) {
          NewFName = value;
        },
      ),
    );
  }

  Widget BLName() {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: kWhiteLightest,
        borderRadius: BorderRadius.circular(29),
      ),
      child: TextFormField(
        controller: _LName,
        decoration: InputDecoration(
          hintText: 'Last Name',
          border: InputBorder.none,
        ),
        validator: (String? value) {
          if (value!.isEmpty) {
            return 'Last name is required';
          }
        },
        onChanged: (value) {
          NewLName = value;
        },
      ),
    );
  }

  Widget BCardNumber() {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: kWhiteLightest,
        borderRadius: BorderRadius.circular(29),
      ),
      child: TextFormField(
        controller: _CardNumber,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: 'Card Number',
          border: InputBorder.none,
        ),
        validator: (String? value) {
          if (value!.isEmpty) {
            return 'Card number is required';
          } else if (value.length > 16) {
            return 'Insert 16 digits';
          } else if (value.length < 16) {
            return 'Insert 16 digits';
          }
        },
        onChanged: (value) {
          NewCardNumber = value;
        },
      ),
    );
  }

  Widget BCVV() {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: kWhiteLightest,
        borderRadius: BorderRadius.circular(29),
      ),
      child: TextFormField(
        controller: _CVV,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: 'Security Code',
          border: InputBorder.none,
        ),
        validator: (String? value) {
          if (value!.isEmpty) {
            return 'Security code CVV is required';
          } else if (value.length > 3) {
            return 'Insert 3 digits';
          } else if (value.length < 3) {
            return 'Insert 3 digits';
          }
        },
        onChanged: (value) {
          NewCVV = value;
        },
      ),
    );
  }

  Widget BMM() {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: kWhiteLightest,
        borderRadius: BorderRadius.circular(29),
      ),
      child: TextFormField(
        controller: _MM,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: 'MM',
          border: InputBorder.none,
        ),
        validator: (String? value) {
          if (value!.isEmpty) {
            return 'Month';
          } else if (value.length > 2) {
            return '2 digits';
          }
        },
        onChanged: (value) {
          NewMM = value;
        },
      ),
    );
  }

  Widget BYY() {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: kWhiteLightest,
        borderRadius: BorderRadius.circular(29),
      ),
      child: TextFormField(
        controller: _YY,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: 'YY',
          border: InputBorder.none,
        ),
        validator: (String? value) {
          if (value!.isEmpty) {
            return 'Year';
          } else if (value.length > 2) {
            return '2 digits';
          }
        },
        onChanged: (value) {
          NewYY = value;
        },
      ),
    );
  }

  Future clearText() async {
    _FName.clear();
    _LName.clear();
    _CardNumber.clear();
    _CVV.clear();
    _MM.clear();
    _YY.clear();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return RoundedButton(
      press: () {
        showModalBottomSheet(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          isScrollControlled: true,
          isDismissible: false,
          context: context,
          builder: (context) {
            return Form(
              key: _cardKey,
              child: Container(
                height: size.height * 0.9,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {
                            clearText();
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.clear,
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        children: [
                          Text(
                            "Add Credit/Debit Card",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Divider(
                        color: Colors.black26,
                        thickness: 1.5,
                        height: 40,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: BCardNumber(),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 52.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Expiry"),
                          SizedBox(
                            width: 100,
                            child: BMM(),
                          ),
                          SizedBox(
                            width: 100,
                            child: BYY(),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: BCVV(),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: BFName(),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: BLName(),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RoundedButton(
                      press: () {
                        if (_cardKey.currentState!.validate()) {
                          events.add(CardDetails(
                              LName: NewLName,
                              FName: NewFName,
                              CVV: NewCVV,
                              YY: NewYY,
                              CardNumber: NewCardNumber,
                              MM: NewMM));
                          Navigator.of(context).pop();
                          clearText();
                        }

                        // events.add(CardDetails(
                        //     LName: NewLName,
                        //     FName: NewFName,
                        //     CVV: NewCVV,
                        //     YY: NewYY,
                        //     CardNumber: NewCardNumber,
                        //     MM: NewMM));
                        // Navigator.of(context).pop();
                      },
                      text: 'Save',
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      text: 'Add Card',
    );
  }
}
