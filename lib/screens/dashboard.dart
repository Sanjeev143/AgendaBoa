// Created by Sanjeev Sangral on 30/11/21.
import 'package:agenda_boa/provider/counter_provider.dart';
import 'package:agenda_boa/screens/counter_one.dart';
import 'package:agenda_boa/screens/counter_three.dart';
import 'package:agenda_boa/screens/counter_two.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*List of widgets as per selection of bottom nav tab*/
    List<Widget> _list=<Widget>[
      const CounterOne(),
      const CounterTwo(),
      const CounterThree(),
    ];

    /*PageView controller*/
    PageController controller=PageController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [IconButton(onPressed: (){
          context.read<CounterProvider>().resetCounter();
        }, icon: const Icon(Icons.refresh))],
      ),
      body: PageView(
          children: _list,
          controller: controller,
          scrollDirection: Axis.horizontal,
          onPageChanged: (index){
            context.read<CounterProvider>().updateIndex(index);
          }
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: context.watch<CounterProvider>().selectedIndex,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: (index){
          context.read<CounterProvider>().updateIndex(index);
          controller.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: const Icon(Icons.home),
            title: const Text('Counter 01'),
            activeColor: Colors.blue,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.add_box_rounded),
            title: const Text('Counter 02'),
            activeColor: Colors.blue,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.add_comment),
            title: const Text('Counter 03'),
            activeColor: Colors.blue,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
