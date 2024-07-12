import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RegistrationProvider extends ChangeNotifier {
  TextEditingController numberofPropertycontroller = TextEditingController();
  PageController apartmentPagecontroller = PageController();
  //============================================================ Property Name & Type =============================================================-
  String propertyName = '';
  String propertyType = '';
  //============================================================ Multiple Property =================================================================
  int numberofProperty = 1;
  bool isSameAddress = true;
  //============================================================ Property Address ===================================================================
  String propertyCountry = '';
  String propertyStreetName = '';
  String propertyPostCode = '';
  String propertyCity = '';
  //============================================================= Bottom Sheets Open Bool Variable =====================================================
  bool livingRoomBottomSheet = false;
  bool otherSpaceBottomSheet = false;
  bool bedroomBottomSheet = false;
  int bedRoomSelectedIndex = 0;
  //============================================================= Property Detailes ======================================================================
  List _bedRoomList = [];
  List get bedRoomList => _bedRoomList;
  //============================================================= Living Room Bed Count ==================================================================
  int livingRoomSofaBed = 0;
  //============================================================== other Space Bed Count =========================================================================
  int otherSpaceSingleBed = 0;
  int otherSpaceOfDoubleBed = 0;
  int otherSpaceKingSizeBedCount = 0;
  int otherSpaceSuperKingSizeBedCount = 0;
  int otherSpaceBunkBed = 0;
  int otherSpaceSofaBed = 0;
  int otherSpaceFutonMat = 0;
  //============================================================== Bedroom  ================================================================================
  int bedroomSingleBed = 0;
  int bedroomOfDoubleBed = 0;
  int bedroomKingSizeBedCount = 0;
  int bedroomSuperKingSizeBedCount = 0;
  int bedroomBunkBed = 0;
  int bedroomSofaBed = 0;
  int bedroomFutonMat = 0;
  //============================================================== Number of Sofa Beds =====================================================================

//This Function will controlling page view, This function can easy to change the pages in the paview
  void goToPage(int page) {
    apartmentPagecontroller.animateToPage(
      page,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

// Setting The Admins how to many Properties have Property count variable saving the property count
  void setNumberProperties(int propertyCount) {
    numberofProperty = propertyCount;
    notifyListeners();
  }

//setting The Admins multiple properties are in a same Location or Differnt Location it has saving in a bool variable
  void setpropertiesLocationSatus(bool issameAddress) {
    isSameAddress = issameAddress;
    notifyListeners();
  }

//This function is for Numbrer input of Admins Proerty count side, The Number of Property variable increase when the increase button click
  void increaseNumberProperty() {
    numberofProperty++;
    notifyListeners();
  }

//This function is for Numbrer input of Admins Proerty count side, The Number of Property variable Decrease when the Decrease button click
  void decreaseNumberProperty() {
    if (numberofProperty < 2) {
      numberofProperty--;
      notifyListeners();
    }
  }

  //This function is setting the Property Name when the user click write in Textfield That Spot time it will be Assignn to Controller.text
  void setPropertyName(String value) {
    propertyName = value;
    notifyListeners();
  }

  void setPropertyCountry(String country) {
    propertyCountry = country;
    notifyListeners();
  }

  void setPropertyStreet(String street) {
    propertyStreetName = street;
    notifyListeners();
  }

  void setPropertyPostCode(String postCode) {
    propertyPostCode = postCode;
    notifyListeners();
  }

  void setPropertyCity(String city) {
    propertyCity = city;
    notifyListeners();
  }

  void openLivingRoomBottomSheet() {
    livingRoomBottomSheet = !livingRoomBottomSheet;
    otherSpaceBottomSheet = false;
    bedroomBottomSheet = false;
    notifyListeners();
  }

  void openOtherSpaceRoomBottomSheet() {
    otherSpaceBottomSheet = !otherSpaceBottomSheet;
    livingRoomBottomSheet = false;
    bedroomBottomSheet = false;
    notifyListeners();
  }

  void openBedRoomBottomSheet() {
    bedroomBottomSheet = !bedroomBottomSheet;
    livingRoomBottomSheet = false;
    otherSpaceBottomSheet = false;
    notifyListeners();
  }

  void disposeAllBottomSheet() {
    bedroomBottomSheet = false;
    livingRoomBottomSheet = false;
    otherSpaceBottomSheet = false;
    notifyListeners();
  }

  void incrementBedCount(String spaceType, int bedType) {
    if (spaceType == 'living') {
      livingRoomSofaBed++;
    } else if (spaceType == 'other') {
      if (bedType == 0) {
        otherSpaceSingleBed++;
      } else if (bedType == 1) {
        otherSpaceOfDoubleBed++;
      } else if (bedType == 2) {
        otherSpaceKingSizeBedCount++;
      } else if (bedType == 3) {
        otherSpaceSuperKingSizeBedCount++;
      } else if (bedType == 4) {
        otherSpaceBunkBed++;
      } else if (bedType == 5) {
        otherSpaceSofaBed++;
      } else if (bedType == 6) {
        otherSpaceFutonMat++;
      }
    } else if (spaceType == 'bedroom') {
      if (bedType == 0) {
        bedroomSingleBed++;
      } else if (bedType == 1) {
        bedroomOfDoubleBed++;
      } else if (bedType == 2) {
        bedroomKingSizeBedCount++;
      } else if (bedType == 3) {
        bedroomSuperKingSizeBedCount++;
      } else if (bedType == 4) {
        bedroomBunkBed++;
      } else if (bedType == 5) {
        bedroomSofaBed++;
      } else if (bedType == 6) {
        bedroomFutonMat++;
      }
    }
    notifyListeners();
  }

  void decrementBedCount(String spaceType, int bedType) {
    if (spaceType == 'living') {}
    if (bedType == 0 && livingRoomSofaBed > 0) {
      livingRoomSofaBed--;
    } else if (spaceType == 'other') {
      if (bedType == 0 && otherSpaceSingleBed > 0) {
        otherSpaceSingleBed--;
      } else if (bedType == 1 && otherSpaceOfDoubleBed > 0) {
        otherSpaceOfDoubleBed--;
      } else if (bedType == 2 && otherSpaceKingSizeBedCount > 0) {
        otherSpaceKingSizeBedCount--;
      } else if (bedType == 3 && otherSpaceSuperKingSizeBedCount > 0) {
        otherSpaceSuperKingSizeBedCount--;
      } else if (bedType == 4 && otherSpaceBunkBed > 0) {
        otherSpaceBunkBed--;
      } else if (bedType == 5 && otherSpaceSofaBed > 0) {
        otherSpaceSofaBed--;
      } else if (bedType == 6 && otherSpaceFutonMat > 0) {
        otherSpaceFutonMat--;
      }
    } else if (spaceType == 'bedroom') {
      if (bedType == 0 && bedroomSingleBed > 0) {
        bedroomSingleBed--;
      } else if (bedType == 1 && bedroomOfDoubleBed > 0) {
        bedroomOfDoubleBed--;
      } else if (bedType == 2 && bedroomKingSizeBedCount > 0) {
        bedroomKingSizeBedCount--;
      } else if (bedType == 3 && bedroomSuperKingSizeBedCount > 0) {
        bedroomSuperKingSizeBedCount--;
      } else if (bedType == 4 && bedroomBunkBed > 0) {
        bedroomBunkBed--;
      } else if (bedType == 5 && bedroomSofaBed > 0) {
        bedroomSofaBed--;
      } else if (bedType == 6 && bedroomFutonMat > 0) {
        bedroomFutonMat--;
      }
    }
    notifyListeners();
  }

  List<String> bedCount(spaceType) {
    if (spaceType == 'living') {
      return [livingRoomSofaBed.toString()];
    } else if (spaceType == 'other') {
      return [
        otherSpaceSingleBed.toString(),
        otherSpaceOfDoubleBed.toString(),
        otherSpaceKingSizeBedCount.toString(),
        otherSpaceSuperKingSizeBedCount.toString(),
        otherSpaceBunkBed.toString(),
        otherSpaceSofaBed.toString(),
        otherSpaceFutonMat.toString(),
      ];
    } else if (spaceType == 'bedroom') {
      return [
        bedroomSingleBed.toString(),
        bedroomOfDoubleBed.toString(),
        bedroomKingSizeBedCount.toString(),
        bedroomSuperKingSizeBedCount.toString(),
        bedroomBunkBed.toString(),
        bedroomSofaBed.toString(),
        bedroomFutonMat.toString(),
      ];
    }
    return [];
  }

  void addBedRoom() {
    final beds = {
      'bedRoomSingleBed': bedroomSingleBed,
      'bedRoomOfDoubleBed': bedroomOfDoubleBed,
      'bedRoomKingSizeBedCount': bedroomKingSizeBedCount,
      'bedRoomSuperKingSizeBedCount': bedroomSuperKingSizeBedCount,
      'bedRoomBunkBed': bedroomBunkBed,
      'bedRoomSofaBed': bedroomSofaBed,
      'bedRoomFutonMat': bedroomFutonMat,
    };
    _bedRoomList.add(beds);
  }

  ///===================================================Alternatives places----------------------------------

  // Alternative places variables
  final PageController placesPageController = PageController();
  int propertyTypes = 0;

  void nextPage(int pageIndex) {
    placesPageController.jumpToPage(pageIndex);
    notifyListeners();
  }

  void setpropertyType(int propertyType) {
    propertyTypes = propertyType;
    notifyListeners();
  }

  ///===================================================Hotels =============================================-
  final PageController hotelsPagecontroller = PageController();
  bool showMoreOptions = false;
  String? selectedOption;

  void goTonextPage(int pageIndex) {
    placesPageController.jumpToPage(pageIndex);
    notifyListeners();
  }

  void toggleMoreOptions() {
    showMoreOptions = !showMoreOptions;
    notifyListeners();
  }

  void selectOption(String option) {
    selectedOption = option;
    notifyListeners();
  }

  bool get isOptionSelected => selectedOption != null;

//================================================= Home Stay ================================================
  final PageController homeStaycontroller = PageController();
  int selectedProperty = 0; // Default selection

  void jumpPage(int pageIndex) {
    placesPageController.jumpToPage(pageIndex);
    notifyListeners();
  }

  void setSelectedProperty(int index) {
    selectedProperty = index;
    notifyListeners();
  }

  bool isPropertySelected() {
    return selectedProperty != -1;
  }

  List<bool> selectedCheckboxes = [false, false, false, false, false];

  void toggleCheckbox(int index) {
    selectedCheckboxes[index] = !selectedCheckboxes[index];
    notifyListeners();
  }

  bool isAnyCheckboxSelected() {
    return selectedCheckboxes.contains(true);
  }

}
