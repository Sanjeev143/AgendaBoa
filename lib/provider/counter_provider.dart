// Created by Sanjeev Sangral on 30/11/21.
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class CounterProvider with ChangeNotifier{
  int _count1 = 0;
  int _count2 = 0;
  int _count3 = 0;
  int _currentIndex = 0;

  int get count1 => _count1;
  int get count2 => _count2;
  int get count3 => _count3;

  int get selectedIndex => _currentIndex;

  void incrementCounterOne() async{
    _count1++;
    FirebaseFirestore.instance
        .collection("counter01")
        .doc("chatRoomId")
        .collection("counter_val").get();
    notifyListeners();
  }

  void incrementCounterTwo() {
    _count2++;
    notifyListeners();
  }

  void incrementCounterThree() {
    _count3++;
    notifyListeners();
  }

  void updateIndex(int index){
    _currentIndex = index;
    notifyListeners();
  }
}