import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:yara/components/constants.dart';
import 'package:yara/components/search_field.dart';
import 'package:yara/library/body.dart';
import 'package:yara/settings/settings.dart';
import 'package:yara/store/book_controller.dart';
import 'package:yara/store/store.dart';
import '../store/book_products.dart';
import '../store/book_data.dart';

class Library extends StatelessWidget {
  static const routeName = "/library";
  final int selectedPage;
  //final tabBarController = TabController(length: 3, vsync: this);
  //final index;
  Library({
    Key? key,
    required this.selectedPage,
    //this.index
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: selectedPage,
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 2,
          toolbarHeight: 20,
          backgroundColor: kBlueColor,
          titleTextStyle: TextStyle(
            color: kBeigeLightColor,
            //fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          bottom: TabBar(
            indicatorColor: kBeigeColor,
            indicatorWeight: 3,
            tabs: [
              Tab(
                icon: Image.asset('icons/library.png'),
              ),
              Tab(
                icon: Image.asset('icons/store.png'),
              ),
              Tab(
                icon: Image.asset('icons/settings.png'),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Body(),
            Store(),
            Settings(),
          ],
        ),
      ),
    );
  }
}
