import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:yara/components/constants.dart';
import 'package:yara/settings/add_card.dart';
import 'package:yara/settings/card_details.dart';

class CardUser extends StatefulWidget {
  @override
  _CardUserState createState() => _CardUserState();
}

//StreamController<CardDetails> events = StreamController<CardDetails>();

class _CardUserState extends State<CardUser> {
  final List<CardDetails> cardNodes = [];
  final StreamController<bool> streamController =
      StreamController<bool>.broadcast();
  //StreamController<CardDetails> event = StreamController<CardDetails>();
  //final _liveClassController = StreamController<CardDetails>.broadcast();

  @override
  initState() {
    super.initState();
    events.stream.listen((data) {
      cardNodes.add(data);
      setState(() {
        cardNodes;
      });
    });
  }
  // @override
  // initState() {
  //   super.initState();
  //   events.stream.listen((data) {
  //     cardNodes.add(data);
  //     setState(() {
  //       cardNodes;
  //     });
  //   });
  // }

  void dispose() {
    super.dispose();
    streamController.close();
  }

  // @override
  // void dispose() {
  //   events.stream.listen((data) {
  //     cardNodes.add(data);
  //     setState(() {});
  //   });
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      child: Stack(
        children: [
          SafeArea(
            child: Column(
              children: cardNodes.map((node) {
                return Container(
                  // height: 170,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, 0),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 20,
                    ),
                    child: Column(
                      children: [
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              node.FName,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              node.LName,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                        Divider(
                          color: Colors.black26,
                          thickness: 1,
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 40,
                              child: Image.asset('images/payment/visa.png'),
                            ),
                            Text(node.CardNumber),
                            OutlinedButton(
                              style: ButtonStyle(
                                  side: MaterialStateProperty.all(
                                    BorderSide(
                                      color: kBlueColor,
                                    ),
                                  ),
                                  shape: MaterialStateProperty.all(
                                    StadiumBorder(),
                                  ),
                                  foregroundColor:
                                      MaterialStateProperty.all(kBlueColor)),
                              onPressed: () {
                                setState(() {
                                  cardNodes.remove(node);
                                });
                              },
                              child: Text("Delete Card"),
                            )
                          ],
                        ),
                        Divider(
                          color: Colors.black26,
                          thickness: 1,
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text('Expiry'),
                            SizedBox(
                              width: 15,
                            ),
                            Text(node.MM),
                            SizedBox(
                              width: 15,
                            ),
                            Text(node.YY),
                            SizedBox(
                              width: 230,
                            ),
                            Text('CVV'),
                            SizedBox(
                              width: 15,
                            ),
                            Text(node.CVV),
                          ],
                        )
                      ],
                    ),
                  ),
                );

                //FormScreen(),
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
