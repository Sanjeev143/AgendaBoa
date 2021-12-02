// Created by Sanjeev Sangral on 30/11/21.
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class CounterProvider with ChangeNotifier{
  int _count1 = 0;
  int _count2 = 0;
  int _count3 = 0;
  int _currentIndex = 2;

  int get count1 => _count1;
  int get count2 => _count2;
  int get count3 => _count3;

  int get selectedIndex => _currentIndex;

  CollectionReference counterOne = FirebaseFirestore.instance.collection('counter01');
  CollectionReference counterTwo = FirebaseFirestore.instance.collection('counter02');
  CollectionReference counterThree = FirebaseFirestore.instance.collection('counter03');


  void incrementCounterOne() async{
    _count1++;
    counterOne
        .doc('ya21DOKtyhEdJlFKFBKA')
        .update({'counter_val': _count1})
        .then((value) => print("CounterOne Updated"))
        .catchError((error) => print("Failed to update user: $error"));
    getCounterOneVal();
    notifyListeners();
  }

  void incrementCounterTwo() {
    _count2++;
    counterTwo
        .doc('jkNsVKQ4ULKRnpqFWbx4')
        .update({'counter_val': _count2})
        .then((value) => print("CounterTwo Updated"))
        .catchError((error) => print("Failed to update counter two: $error"));
    notifyListeners();
  }

  void incrementCounterThree() {
    _count3++;
    counterThree
        .doc('DwZSAqUT4TfBCM4C8Cg9')
        .update({'counter_val': _count3})
        .then((value) => print("CounterThree Updated"))
        .catchError((error) => print("Failed to update counter three: $error"));
    notifyListeners();
  }

  void updateIndex(int index){
    _currentIndex = index;
    notifyListeners();
  }

  void getCounterOneVal() async {
    FirebaseFirestore.instance
        .collection('counter01')
        .doc("ya21DOKtyhEdJlFKFBKA")
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        var data  = documentSnapshot.data() as Map;
        _count1 = data["counter_val"]as int;
      } else {
        print('Document does not exist on the database');
      }
    });
    notifyListeners();
  }

  void getCounterTwoVal() async {
    FirebaseFirestore.instance
        .collection('counter02')
        .doc("jkNsVKQ4ULKRnpqFWbx4")
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print('Document data: ${documentSnapshot.data()}');
        var data  = documentSnapshot.data() as Map;
        _count2 = data["counter_val"]as int;
      } else {
        print('Document does not exist on the database');
      }
    });
    notifyListeners();
  }
  void getCounterThreeVal() async {
    FirebaseFirestore.instance
        .collection('counter03')
        .doc("DwZSAqUT4TfBCM4C8Cg9")
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print('Document data: ${documentSnapshot.data()}');
        var data  = documentSnapshot.data() as Map;
        _count3 = data["counter_val"] as int;
      } else {
        print('Document does not exist on the database');
      }
    });
    notifyListeners();
  }

  void resetCounter(){
    /*Reset counters value*/
    _count1 = 0;
    _count2 = 0;
    _count3 = 0;

    counterOne
        .doc('ya21DOKtyhEdJlFKFBKA')
        .update({'counter_val': 0})
        .then((value) => print("CounterOne Updated"))
        .catchError((error) => print("Failed to update user: $error"));
    counterTwo
        .doc('jkNsVKQ4ULKRnpqFWbx4')
        .update({'counter_val': 0})
        .then((value) => print("CounterTwo Updated"))
        .catchError((error) => print("Failed to update counter two: $error"));

    counterThree
        .doc('DwZSAqUT4TfBCM4C8Cg9')
        .update({'counter_val': 0})
        .then((value) => print("CounterThree Updated"))
        .catchError((error) => print("Failed to update counter three: $error"));
    /*After reset fetch the updated value from firebase*/
    fetchAllCounterValue();
    notifyListeners();
  }

  void fetchAllCounterValue(){
    getCounterOneVal();
    getCounterTwoVal();
    getCounterThreeVal();
  }
}