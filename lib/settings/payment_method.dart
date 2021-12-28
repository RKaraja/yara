import 'package:flutter/material.dart';
import 'package:yara/settings/add_card.dart';
import 'package:yara/components/constants.dart';
import 'package:yara/settings/card.dart';
import 'package:yara/settings/card_details.dart';

class PaymentMethod extends StatelessWidget {
  static const routeName = "/paymentScreen";

  const PaymentMethod({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: kBlueColor,
          elevation: 3,
          toolbarHeight: 60,
          title: Text(
            'PAYMENT METHOD',
            style: TextStyle(
              fontFamily: 'moneta',
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 30),
                    child: Row(
                      children: [
                        Text(
                          "Customize your payment method",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: CardUser(),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
            Align(
              alignment: FractionalOffset.bottomCenter,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 40),
                child: FormScreen(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
