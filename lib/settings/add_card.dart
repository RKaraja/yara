import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:yara/components/constants.dart';
import 'package:yara/components/rounded_button.dart';
import 'package:yara/settings/card_details.dart';

// class CardTextField extends StatelessWidget {
//   const CardTextField({
//     required String hintText,
//     EdgeInsets padding = const EdgeInsets.only(left: 40),
//     Key? key,
//   })  : _hintText = hintText,
//         _padding = padding,
//         super(key: key);
//
//   final String _hintText;
//   final EdgeInsets _padding;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: 50,
//       decoration: ShapeDecoration(
//         color: kWhiteLightest,
//         shape: StadiumBorder(),
//       ),
//       child: TextField(
//         decoration: InputDecoration(
//           border: InputBorder.none,
//           hintText: _hintText,
//           hintStyle: TextStyle(
//             color: Colors.black26,
//           ),
//           contentPadding: _padding,
//         ),
//       ),
//     );
//   }
// }

// class NumTextField extends StatelessWidget {
//   const NumTextField({
//     required String hintText,
//     EdgeInsets padding = const EdgeInsets.only(left: 40),
//     Key? key,
//   })  : _hintText = hintText,
//         _padding = padding,
//         super(key: key);
//
//   final String _hintText;
//   final EdgeInsets _padding;
//   TextEditingController _cardNumber = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: 50,
//       decoration: ShapeDecoration(
//         color: kWhiteLightest,
//         shape: StadiumBorder(),
//       ),
//       child: TextField(
//         decoration: InputDecoration(
//           border: InputBorder.none,
//           hintText: _hintText,
//           hintStyle: TextStyle(
//             color: Colors.black26,
//           ),
//           contentPadding: _padding,
//         ),
//         keyboardType: TextInputType.number,
//       ),
//     );
//   }
// }

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

StreamController<CardDetails> events = StreamController<CardDetails>();

class _FormScreenState extends State<FormScreen> {
  late String NewFName;
  late String NewLName;
  late String NewCardNumber;
  late String NewCVV;
  late String NewMM;
  late String NewYY;

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
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: 'Card Number',
          border: InputBorder.none,
        ),
        validator: (String? value) {
          if (value!.isEmpty) {
            return 'Card number is required';
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
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: 'Security Code',
          border: InputBorder.none,
        ),
        validator: (String? value) {
          if (value!.isEmpty) {
            return 'Security code CVV is required';
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
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: 'MM',
          border: InputBorder.none,
        ),
        validator: (String? value) {
          if (value!.isEmpty) {
            return 'Month';
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
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: 'YY',
          border: InputBorder.none,
        ),
        validator: (String? value) {
          if (value!.isEmpty) {
            return 'Year';
          }
        },
        onChanged: (value) {
          NewYY = value;
        },
      ),
    );
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
              child: Container(
                height: size.height * 0.9,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {
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
                        events.add(CardDetails(
                            LName: NewLName,
                            FName: NewFName,
                            CVV: NewCVV,
                            YY: NewYY,
                            CardNumber: NewCardNumber,
                            MM: NewMM));
                        Navigator.of(context).pop();
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
