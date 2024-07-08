import 'package:flutter/material.dart';

class GuestManagementProvider extends ChangeNotifier{
//its a desktop Guest screen tab Button selected Index
int tabButtonSelectedIndex = 0;
//Guest Search Controller of textfield in guestmanagement Screen
TextEditingController guestSearchController = TextEditingController();
//Spesified Guest Select or not checkbox Bool variable in the guest screen  
bool isSelectedGuest = false;
//Spesified select Guest from guest List
int guestSelectedIndex = 0; 
//The Occupent is Booked or Not
bool isBooked  = true;
//DropDown Room AVilbale 
String roomNumberfloor = 'Available Rooms';

//set floor and RoomNumber
void setfloor(value){
  roomNumberfloor = value;
  notifyListeners();
}

//Updating selectguest Index in guest screen
void setSelectGuestIndex(value){
  isSelectedGuest = value;
  notifyListeners();
}

//Updating The Selected new Index in The List View Builder
void settabButtonIndex(index){
  tabButtonSelectedIndex = index;
  notifyListeners();
}

//Updating The Selected New Index in The ListView Builder
void setGuestSelectedIndex(index){
  guestSelectedIndex = index;
  notifyListeners();
}
}