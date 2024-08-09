import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tuch_trip_crms/src/view/widgets/toast_message.dart';

class DashboardProvider extends ChangeNotifier {
  int navigationButtonsSelectedIndex = 0;
  var selectedProfileDropDown;

  void setSelectedButtonIndex(index) {
    navigationButtonsSelectedIndex = index;
    notifyListeners();
  }

  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////// Job Vacancy Provider ///////////////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  List jobsOffers = [];
  TextEditingController jobNameController = TextEditingController();
  TextEditingController numberofOpenings = TextEditingController();
  String jobLocationType = 'On-Site';
  TextEditingController jobCity = TextEditingController();
  TextEditingController jobArea = TextEditingController();
  TextEditingController jobPinCode = TextEditingController();
  TextEditingController jobstreetAddress = TextEditingController();
  List<String> jobTypesList = [];
  TextEditingController jobContrectLength = TextEditingController();
  String jobContractPeriod = 'Week(s)';
  String jobAmountStatus = 'Range';
  TextEditingController jobMinimumAmount = TextEditingController();
  TextEditingController jobMaximumAmount = TextEditingController();
  String jobRate = 'Per Year';
  TextEditingController jobDescriptionController = TextEditingController();
  List<TextEditingController> jobContactDetailes = [TextEditingController()];
  String jobCVStatus = 'Yes, require a Cv';
  bool isjobApplicationDeadline = false;
  TextEditingController jobApplicationDeadLineDate = TextEditingController();
  TextEditingController skillController = TextEditingController();
  String essentialstatus = 'Required';
  List jobSkillsList = [];

  void setlocationType(value) {
    jobLocationType = value;
    notifyListeners();
  }

  void setJobTypesFromTheWrap(value) {
    if (jobTypesList.contains(value)) {
      jobTypesList.remove(value);
    } else {
      jobTypesList.add(value);
    }
    // print(jobTypesList);
    notifyListeners();
  }

  void setAmountStatus(value) {
    jobAmountStatus = value;
    // print(jobAmountStatus);
    notifyListeners();
  }

  void setJobRate(value) {
    jobRate = value;
    notifyListeners();
  }

  void addContactDetailes() {
    jobContactDetailes.add(TextEditingController());
    // print(jobContactDetailes.length);
    notifyListeners();
  }

  void removeEmail(index) {
    if (jobContactDetailes.length > 1) {
      jobContactDetailes.removeAt(index);
    } else {
      // print('Contact Detailes is Empty');
    }
    notifyListeners();
  }

  void setjobCvOption(value) {
    jobCVStatus = value;
    notifyListeners();
  }

  void setjobApplicationDeadLineYesOrNo(value) {
    isjobApplicationDeadline = value;
    // print(isjobApplicationDeadline);
    notifyListeners();
  }

  void setJobContractPeriod(value) {
    jobContractPeriod = value;
    notifyListeners();
  }

  void addSkilltoSkillsList(String value,String essentialStatus,BuildContext context){
    final data = {
      'Skills' : value,
      'essentialStatus' : essentialStatus
    };
    if (jobSkillsList.isEmpty && value != '') {
      jobSkillsList.add(data);
      Navigator.pop(context);
    } else if (jobSkillsList.isNotEmpty && value != ''){
      for (var i = 0; i < jobSkillsList.length; i++) {
        if (jobSkillsList[i]['Skills'] != value) {
          jobSkillsList.add(data);
          Navigator.pop(context);
        }
      }
    } else {
      Timer(const Duration(seconds: 2), () {
        toastmessege(messege: 'Please fill in the field to add a skill.', textcolor: Colors.red);
        }
      );
    }
    notifyListeners();
  }

  void removeSkillsFromSkillsList(int index) {
    if (index >= 0) {
      jobSkillsList.removeAt(index);
      // print('remove successfully');
    }
    notifyListeners();
  }

  void setIsRequiredorNot(value){
    essentialstatus = value;
    notifyListeners();
  }
}

bool isLoading = false;
