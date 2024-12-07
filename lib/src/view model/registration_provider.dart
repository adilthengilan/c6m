import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:image_picker_web/image_picker_web.dart';

class RegistrationProvider extends ChangeNotifier {
  TextEditingController numberofPropertycontroller = TextEditingController();
  PageController apartmentPagecontroller = PageController();
  PageController finalPagePageviewcontroller = PageController();
  PageController ratePlansPageviewController = PageController();
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  int numberOfOwnedProperties = 1;
  //============================================================ Multiple Property =================================================================
  bool isAllOwnedPropertiesAreSameAddress = true;
  //============================================================ Property Name =============================================================-
  String propertyName = '';
  //============================================================ Property Address ===================================================================
  String propertyCountry = '';
  String propertyStreetName = '';
  String propertyPostCode = '';
  String propertyCity = '';
  String propertyLocationMapLink = '';
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  //============================================================= Living Room Bed Count ==================================================================
  int livingRoomSofaBedCount = 0;
  //============================================================= Bed Room Detailes ======================================================================
  List bedRoomList = [];
  List otherSpaceDetailsList = [];
  List aminitiesList = [];
  List servicesAvailableInProperty = [];
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  String bedRoomType = "";
  int bedRoomCount = 1;
  List bedRoomBedDetailsList = [];
  List otherSpaceBedDetailsList = [];
  Map<String, Object?> breakFastDetailsMap = {};
  String parkingOption = 'No';
  Map<String, Object?> hostProfileDetailsMap = {};

  //============================================================== Allow Children & children coats ========================================================================
  bool isallowChildren = false;
  bool isAllowCoats = false;
  //============================================================== How many Guest Can Stay ===============================================================
  int guestCapacity = 1;
  int bathRoomCount = 0;
  List bedDetailsList = [];

  bool isEntirePlace = true;
  //============================================================ Property Place Category ===============================================================
  String? stayCategoryOption = '';
  //============================================================= Bottom Sheets Open Bool Variable =====================================================
  bool isOpenLivingRoomBottomSheet = false;
  bool isOpenOtherSpaceBottomSheet = false;
  bool isOpenBedroomBottomSheet = false;
  int bedRoomSelectedIndex = 0;

  //============================================================== other Space Bed Count =========================================================================
  int otherSpaceSingleBed = 0;
  int otherSpaceOfDoubleBed = 0;
  int otherSpaceKingSizeBedCount = 0;
  int otherSpaceSuperKingSizeBedCount = 0;
  int otherSpaceBunkBed = 0;
  int otherSpaceSofaBed = 0;
  int otherSpaceFutonMat = 0;
  //============================================================== Bedroom  ================================================================================
  int bedroomSingleBed = 1;
  int bedroomOfDoubleBed = 0;
  int bedroomKingSizeBedCount = 0;
  int bedroomSuperKingSizeBedCount = 0;
  int bedroomBunkBed = 0;
  int bedroomSofaBed = 0;
  int bedroomFutonMat = 0;

  TextEditingController bedRoomCountController = TextEditingController();
  TextEditingController guestCapacityController = TextEditingController();
  TextEditingController bathRoomCountController = TextEditingController();

  //============================================================== Aminities Of Property ===========================================================================
  // General Amenities
  bool airConditioning = false;
  bool heating = false;
  bool freeWifi = false;
  bool evChargingStation = false;

  // Cooking and Cleaning
  bool kitchen = false;
  bool kitchenette = false;
  bool washingMachine = false;

  // Entertainment
  bool flatScreenTV = false;
  bool swimmingPool = false;
  bool hotTub = false;
  bool minibar = false;
  bool sauna = false;

  // Outside and View
  bool balcony = false;
  bool gardenView = false;
  bool terrace = false;
  bool view = false;
//================================================================ Property Service  ==============================================================================
  bool isServeBreakfast = false;
  bool isBrakFastIncludedCost = true;
  TextEditingController breakFastCostController = TextEditingController();
  List offeredbreakTypeFastList = [];
  //for State Management Not A Data
  bool isBreakFastSelected = false;
  //================================================================ Staff Languages ===========================================================================
  List<String> staffSpeakingLanguagesList = [];
  // for state managemnet not a data
  String selectedLanguage = '';

  ///================================================================ House Roles ==============================================================================
  String? checkInFrom = '15:00';
  String? checkInUntil = '18:00';
  String? checkOutFrom = '08:00';
  String? checkOutUntil = '11:00';
  bool issmokingAllowedHouseRules = false;
  bool isallowPetshouseRules = false;
  bool iseventsAllowedHouseRules = false;

  ///================================================================ Host Profile ==============================================================================
  bool isShowPropertyFieldOpen = true;
  bool isShowHostDetailsAboutPropertyOpen = false;
  bool isShowAboutNeighborhoodOpen = false;
  TextEditingController aboutThePropertyController = TextEditingController();
  TextEditingController aboutTheNeighbourhoodController = TextEditingController();
  TextEditingController theHostNameController = TextEditingController();
  TextEditingController aboutTheHostController = TextEditingController();
  //=================================================================== Property images ======================================================================
  List<Uint8List>? propertyImagesList = [];
  //==================================================================== Receive bookings =====================================================================
  bool isAllGuestscCanBookInstantly = true; //this variable is All Guests Can Book Instantly, when its True. When the value is false it means All Guests Will Need Request To Book
  //==================================================================== Property Price per Night =============================================================
  TextEditingController priceController = TextEditingController();
  double propertyPricePerNight = 0;
  //====================================================================== Goods & Services Tax = ==============================================================
  bool isForGstPurpuse = false;
  bool isFourthCharecterOfPanOpen = true;
  TextEditingController panNoController = TextEditingController();
  TextEditingController adharCarNumerController = TextEditingController();
  TextEditingController tradeNameController = TextEditingController();
  TextEditingController GsGSTINController = TextEditingController();
  //=================================================================== Cancellation policies =============================================================
  int freeCancelationButtonIndex = 0;
  final List<String> days = ['1 day', '5 days', '14 days', '30 days'];
  int freeCancellationDaysOfBooking = 1; // Variable to store the selected number of days
  bool isprotectionAgainstAccidentalBookings = true;
  //=================================================================== Price per group size ===============================================================
  bool isGroupDiscountUpdateAnyTimeEnabled = false;
  TextEditingController disCountRateController = TextEditingController();
  int groupDiscountPersentage = 0;
  double totalForTwoGuests = 56778.00;
  double totalForOneGuest = 56778.00;

  bool _asSoonAsPossible = true;
  DateTime _selectedDate = DateTime.now();

  TextEditingController webcontroller = TextEditingController();

  bool get asSoonAsPossible => _asSoonAsPossible;
  DateTime get firstDayGuestCanCheckInSelectedDate => _selectedDate;
  DateTime get nextMonth => DateTime(firstDayGuestCanCheckInSelectedDate.year, firstDayGuestCanCheckInSelectedDate.month + 1, firstDayGuestCanCheckInSelectedDate.day);
  int _selectThreeAvailability = 0;

  int get selectThreeAvailability => _selectThreeAvailability;
  String syncAvailabilityfromAnotherorChanelManager = "";
  int maxReservationNumberOfNights = 0;

  TextEditingController propertyFirstNameStatedOnID = TextEditingController();
  TextEditingController propertyMiddleNameStatedOnID = TextEditingController();
  TextEditingController propertyLastNameStatedOnID = TextEditingController();
  TextEditingController propertyOfficialEmail = TextEditingController();
  TextEditingController propertyPhoneNumber = TextEditingController();

  TextEditingController propertyLegalName = TextEditingController();
  TextEditingController registerdCountryOrRegion = TextEditingController();
  TextEditingController registerdAddressLine1 = TextEditingController();
  TextEditingController registerdAddressLine2 = TextEditingController();
  TextEditingController registeredCity = TextEditingController();
  TextEditingController registeredZipCode = TextEditingController();

  bool isAllowNecesseryLicense = true;
  bool isIHaveReadAndAccepted = false;

  //===================================================================

//This Function will controlling page view, This function can easy to change the pages in the paview
  void goToPage(int page, pageviewController) {
    pageviewController.animateToPage(
      page,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

// NumberProperties [1]
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  void setStayCategoryOption(String value) {
    stayCategoryOption = value;
    notifyListeners();
  }

// Setting The Admins how to many Properties have Property count variable saving the property count
  void setNumberProperties(dynamic propertyCount) {
    if (propertyCount == "") {
      numberofPropertycontroller.clear();
      return;
    }
    numberOfOwnedProperties = (propertyCount is String) ? int.tryParse(propertyCount) ?? 0 : propertyCount;

    if (propertyCount is String) {
      numberofPropertycontroller.clear();
    }
    notifyListeners();
  }

//This function is for Numbrer input of Admins Proerty count side, The Number of Property variable increase when the increase button click
  void increaseNumberProperty() {
    numberOfOwnedProperties++;
    notifyListeners();
  }

//This function is for Numbrer input of Admins Proerty count side, The Number of Property variable Decrease when the Decrease button click
  void decreaseNumberProperty() {
    if (numberOfOwnedProperties > 2) {
      numberOfOwnedProperties--;
      notifyListeners();
    }
  }

//setting The Admins multiple properties are in a same Location or Differnt Location it has saving in a bool variable
  void setAllPropertiesAreSameAddress(bool isSameAddress) {
    isAllOwnedPropertiesAreSameAddress = isSameAddress;
    notifyListeners();
  }

// Property Name [2]
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////
//This function is setting the Property Name when the user click write in Textfield That Spot time it will be Assignn to Controller.text
  void setPropertyName(String value) {
    propertyName = value;
    notifyListeners();
  }

// Property Address [3]
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

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

// Property Location Map Link [4]
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  void setpropertyLocationMapLink(String value) {
    propertyLocationMapLink = value;
    notifyListeners();
  }

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  void openBedDetailsBottomSheet(String sheetType) {
    isOpenLivingRoomBottomSheet = sheetType == "livingRoom" && !isOpenLivingRoomBottomSheet;
    isOpenOtherSpaceBottomSheet = sheetType == "otherSpace" && !isOpenOtherSpaceBottomSheet;
    isOpenBedroomBottomSheet = sheetType == "bedroom" && !isOpenBedroomBottomSheet;
    notifyListeners();
  }

  void incrementBedCount(String spaceType, int bedType) {
    if (spaceType == 'living') {
      livingRoomSofaBedCount++;
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
    if (spaceType == 'living') {
      if (bedType == 0 && livingRoomSofaBedCount > 0) {
        livingRoomSofaBedCount--;
      }
      ///////////////////////////////////////////////////
    } else if (spaceType == 'other') {
      if (bedType == 0 && otherSpaceSingleBed > 0) {
        otherSpaceSingleBed--;
        //======================================================
      } else if (bedType == 1 && otherSpaceOfDoubleBed > 0) {
        otherSpaceOfDoubleBed--;
        //============================================================
      } else if (bedType == 2 && otherSpaceKingSizeBedCount > 0) {
        otherSpaceKingSizeBedCount--;
        //=============================================================
      } else if (bedType == 3 && otherSpaceSuperKingSizeBedCount > 0) {
        otherSpaceSuperKingSizeBedCount--;
        //======================================================
      } else if (bedType == 4 && otherSpaceBunkBed > 0) {
        otherSpaceBunkBed--;
        //======================================================
      } else if (bedType == 5 && otherSpaceSofaBed > 0) {
        otherSpaceSofaBed--;
        //======================================================
      } else if (bedType == 6 && otherSpaceFutonMat > 0) {
        otherSpaceFutonMat--;
      }
      ////////////////////////////////////////////////////////////////
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

  void addToOtherSpaceBedList() {
    // Map of bed descriptions to their respective counts
    final bedDetailsMap = {
      "Single bed": otherSpaceSingleBed,
      "Double bed": otherSpaceOfDoubleBed,
      "Large bed (King size)": otherSpaceKingSizeBedCount,
      "Extra-large double bed (Super-king size)": otherSpaceSuperKingSizeBedCount,
      "Bunk bed": otherSpaceBunkBed,
      "Sofa bed": otherSpaceSofaBed,
      "Futon Mat": otherSpaceFutonMat,
    };

    otherSpaceDetailsList.clear();

    bedDetailsMap.forEach((key, value) {
      if (value > 0) {
        otherSpaceDetailsList.add("$key $value");
      }
    });
    //Reset Bed Detailes
    otherSpaceSingleBed = 0;
    otherSpaceOfDoubleBed = 0;
    otherSpaceKingSizeBedCount = 0;
    otherSpaceSuperKingSizeBedCount = 0;
    otherSpaceBunkBed = 0;
    otherSpaceSofaBed = 0;
    otherSpaceFutonMat = 0;
  }

  List<String> bedCount(spaceType) {
    if (spaceType == 'living') {
      return [livingRoomSofaBedCount.toString()];
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

  void addNewBedRoom() {
    bedDetailsList = [
      "Single bed $bedroomSingleBed",
      "Double bed $bedroomOfDoubleBed",
      "Large bed (King size) $bedroomKingSizeBedCount",
      "Extra-large double bed (Super-king size) $bedroomSuperKingSizeBedCount",
      "Bunk bed $bedroomBunkBed",
      "Sofa bed $bedroomSofaBed",
      "Futon Mat $bedroomFutonMat",
    ];

    final newBedRoom = {
      "bedRoomType": bedRoomType,
      "bedRoomCount": bedRoomCount,
      "bedRoomBedDetailsList": bedDetailsList,
      "guestCapacity": guestCapacity,
      "bathRoomCount": bathRoomCount,
      "isallowChildren": isallowChildren,
      "isAllowCoats": isAllowCoats,
    };

    bedRoomList.add(newBedRoom);
    bedRoomType = "";
    bedDetailsList = [];
    bedRoomCount = 0;
    bedroomSingleBed = 0;
    bedroomOfDoubleBed = 0;
    bedroomKingSizeBedCount = 0;
    bedroomSuperKingSizeBedCount = 0;
    bedroomBunkBed = 0;
    bedroomSofaBed = 0;
    bedroomFutonMat = 0;
    isallowChildren = false;
    isAllowCoats = false;
    guestCapacity = 1;
    bathRoomCount = 0;
    notifyListeners();
  }

  void removeBedRoom(int index) {
    if (index >= 0 && index < bedRoomList.length) {
      bedRoomList.removeAt(index);
    } else {
      print('Index out of range');
    }
    notifyListeners();
  }

  void setBedRoomType(newValue) {
    bedRoomType = newValue;
    notifyListeners();
  }

  void setBedRoomCount(newValue) {
    bedRoomCount = int.parse(newValue);
    bedRoomCountController.clear();
    notifyListeners();
  }

  void incrementBedroomCount() {
    bedRoomCount++;
    notifyListeners();
  }

  void decrementBedroomCount() {
    if (bedRoomCount > 1) {
      bedRoomCount--;
      notifyListeners();
    }
  }

  void setingAllowChildren(value) {
    isallowChildren = value;
    notifyListeners();
  }

  void setAllowCoats(value) {
    isAllowCoats = value;
    notifyListeners();
  }

  void increamentGuestCapacityAndBathroomCount(counterIndex) {
    if (counterIndex == 0) {
      guestCapacity++;
    } else if (counterIndex == 1) {
      bathRoomCount++;
    }
    notifyListeners();
  }

  void decrementGuestCapacityAndBathroomCount(int counterIndex) {
    if (counterIndex == 0) {
      if (guestCapacity > 0) {
        guestCapacity--;
      }
    } else if (counterIndex == 1) {
      if (bathRoomCount > 0) {
        bathRoomCount--;
      }
    }
    notifyListeners();
  }

  void setGuestCapacityAndBathroomCount(index, newValue) {
    if (index == 0) {
      guestCapacity = int.parse(newValue);
      guestCapacityController.clear();
    } else if (index == 1) {
      bathRoomCount = int.parse(newValue);
      bathRoomCountController.clear();
    }
    notifyListeners();
  }

//================================================  /// Property Location =========================================================================
  void launchMaps(String latitude, String longitude) async {
    final url = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  // ================================================== Setting  Hotel Aminitiest =====================================================================
  // ================================================  // General Amenities =========================================================================

  void setPropertyAminities(String propertyName, dynamic value) {
    switch (propertyName) {
      // Additional Properties
      case 'airConditioning':
        airConditioning = value;
        break;
      case 'heating':
        heating = value;
        break;
      case 'freeWifi':
        freeWifi = value;
        break;
      case 'evChargingStation':
        evChargingStation = value;
        break;

      // Cooking and Cleaning Properties
      case 'kitchen':
        kitchen = value;
        break;
      case 'kitchenette':
        kitchenette = value;
        break;
      case 'washingMachine':
        washingMachine = value;
        break;

      // Entertainment Properties
      case 'flatScreenTV':
        flatScreenTV = value;
        break;
      case 'swimmingPool':
        swimmingPool = value;
        break;
      case 'hotTub':
        hotTub = value;
        break;
      case 'minibar':
        minibar = value;
        break;
      case 'sauna':
        sauna = value;
        break;

      // Outside and View Properties
      case 'balcony':
        balcony = value;
        break;
      case 'gardenView':
        gardenView = value;
        break;
      case 'terrace':
        terrace = value;
        break;
      case 'view':
        view = value;
        break;

      default:
        return;
    }
    notifyListeners();
  }

  void addAminitiesToAminitiesList() {
    aminitiesList.clear(); // Clear the list before adding new items

    // Add Cooking and Cleaning Properties
    if (kitchen) aminitiesList.add('Kitchen');
    if (kitchenette) aminitiesList.add('Kitchenette');
    if (washingMachine) aminitiesList.add('Washing machine');

    // Add Entertainment Properties
    if (flatScreenTV) aminitiesList.add('Flat-screen TV');
    if (swimmingPool) aminitiesList.add('Swimming pool');
    if (hotTub) aminitiesList.add('Hot tub');
    if (minibar) aminitiesList.add('Minibar');
    if (sauna) aminitiesList.add('Sauna');

    // Add Outside and View Properties
    if (balcony) aminitiesList.add('Balcony');
    if (gardenView) aminitiesList.add('Garden view');
    if (terrace) aminitiesList.add('Terrace');
    if (view) aminitiesList.add('View');

    // Add Additional Properties
    if (airConditioning) aminitiesList.add('Air conditioning');
    if (heating) aminitiesList.add('Heating');
    if (freeWifi) aminitiesList.add('Free WiFi');
    if (evChargingStation) aminitiesList.add('Electric vehicle charging station');

    // Print the list for debugging (Optional)
  }

  //Parkin Option String
  void setParkingOption(String value) {
    parkingOption = value;
    notifyListeners();
  }

  void addOfferedBreakfastDetailsToBreakFastDetailsList() {
    breakFastDetailsMap.clear();
    final serveBreakfast = isServeBreakfast ? " Yes, we offer breakfast" : "No, we do not offer breakfast";
    final breakFastPriceIsIncludedOrNot = isServeBreakfast
        ? isBrakFastIncludedCost
            ? "The breakfast cost is included in the price."
            : "No, the breakfast comes with an extra charge"
        : "";
    final offeredBreakFastTypeList = offeredbreakTypeFastList;
    final breakFastCost = isServeBreakfast && !isBrakFastIncludedCost ? breakFastCostController.text : "";
    final dataToAdd = {
      "isServeBreakfast": serveBreakfast,
      "breakFastPriceIsIncludedOrNot": breakFastPriceIsIncludedOrNot,
      "breakfastCost": breakFastCost,
      "offeredBreakFastTypeList": offeredBreakFastTypeList,
    };
    breakFastDetailsMap = dataToAdd;
    print(breakFastDetailsMap);
  }

  void setServeBreakfast(bool value) {
    isServeBreakfast = value;
    notifyListeners();
  }

  void setbraekFastCostIncluded(value) {
    isBrakFastIncludedCost = value;
    notifyListeners();
  }

  void settingOfferdBreakFast(brakFast, isSelected) {
    if (isSelected) {
      offeredbreakTypeFastList.remove(brakFast);
    } else {
      offeredbreakTypeFastList.add(brakFast);
    }
    notifyListeners();
  }

//=============================================================== Staff Languages ========================================================================
  void addingStaffLanguages(isSelected, language) {
    if (isSelected) {
      staffSpeakingLanguagesList.remove(language);
    } else {
      staffSpeakingLanguagesList.add(language);
    }
    // print(staffSpeakingLanguagesList);
    notifyListeners();
  }

//=============================================================== House Rules ========================================================================
  void setCheckInFrom(String newValue) {
    checkInFrom = newValue;
    notifyListeners();
  }

  void setCheckInUntil(String newValue) {
    checkInUntil = newValue;
    notifyListeners();
  }

  void setCheckOutFrom(String newValue) {
    checkOutFrom = newValue;
    notifyListeners();
  }

  void setCheckOutUntil(String newValue) {
    checkOutUntil = newValue;
    notifyListeners();
  }

  void setSmokingAllowed(value) {
    issmokingAllowedHouseRules = value;
    notifyListeners();
  }

  void setEventAllowed(value) {
    iseventsAllowedHouseRules = value;
    notifyListeners();
  }

  void setPetsAllowed(value) {
    isallowPetshouseRules = value;
    notifyListeners();
  }
//============================================================== Property Host ====================================================================

  void toggleProperty(bool value) {
    isShowPropertyFieldOpen = value;
    notifyListeners();
  }

  void toggleHost(bool value) {
    isShowHostDetailsAboutPropertyOpen = value;
    notifyListeners();
  }

  void toggleNeighborhood(bool value) {
    isShowAboutNeighborhoodOpen = value;
    notifyListeners();
  }

  void toggleAll(bool value) {
    isShowPropertyFieldOpen = !value;
    isShowHostDetailsAboutPropertyOpen = !value;
    isShowAboutNeighborhoodOpen = !value;
    notifyListeners();
  }

  void addHostProfileDetailsTohostProfileDetailsMap() {
    hostProfileDetailsMap.clear();
    final hostData = {
      "aboutTheProperty": isShowPropertyFieldOpen ? aboutThePropertyController.text : "",
      "aboutTheHostName": isShowHostDetailsAboutPropertyOpen ? theHostNameController.text : "",
      "aboutTheHostDescription": isShowHostDetailsAboutPropertyOpen ? aboutTheHostController.text : "",
      "aboutTheNeighbourhood": isShowAboutNeighborhoodOpen ? aboutTheNeighbourhoodController.text : "",
    };
    hostProfileDetailsMap = hostData;
  }

//================================================================ Property images ====================================================================

  Future<void> galleryImagePicker() async {
    List<Uint8List>? _images = await ImagePickerWeb.getMultiImagesAsBytes();
    propertyImagesList = _images;
    notifyListeners();
  }

  Future<void> removeImage(index) async {
    propertyImagesList!.removeAt(index);
    notifyListeners();
  }

//================================================================ Receive bookings =================================================================
  void setallGuestscCanBookInstantly(value) {
    //this variable is All Guests Can Book Instantly, when its True.
    if (value) {
      isAllGuestscCanBookInstantly = true;
    } else {
      //When the value is false it means All Guests Will Need Request To Book
      isAllGuestscCanBookInstantly = false;
    }
    notifyListeners();
  }

//================================================================= Property Price per Night ========================================================
  void setPropertyPricePerNight(value) {
    if (priceController.text != '') {
      final price = double.parse(priceController.text);
      final commision = price - (price * 15) / 100;
      propertyPricePerNight = commision;
    } else {
      propertyPricePerNight = 0.0;
    }
    notifyListeners();
  }

//================================================================== Goods & Services Tax ===============================================================
  void setGstPurpuse(value) {
    isForGstPurpuse = value;
    notifyListeners();
  }

  void setFourthCharecterOfPanHorP(value) {
    isFourthCharecterOfPanOpen = value;
    notifyListeners();
  }

//=================================================================== Cancellation policies =============================================================
  void setCancellationPeriod(bool selected, int index) {
    freeCancelationButtonIndex = selected ? index : freeCancelationButtonIndex;
    freeCancellationDaysOfBooking = int.parse(days[freeCancelationButtonIndex].split(' ')[0]);
    notifyListeners();
  }

  void setBookingProtection(value) {
    isprotectionAgainstAccidentalBookings = value;
    notifyListeners();
  }

//=================================================================== Price per group size ===============================================================
  void setPricePerGroupSizeEnabled(value) {
    isGroupDiscountUpdateAnyTimeEnabled = value;
    notifyListeners();
  }

  void setDiscountRate(value) {
    int newValue = int.tryParse(value) ?? 0;
    if (newValue >= 0 && newValue <= 100) {
      groupDiscountPersentage = newValue;
      totalForOneGuest = totalForOneGuest * (groupDiscountPersentage / 100);
      notifyListeners();
    }
    notifyListeners();
  }

  void setAsSoonAsPossible(bool value) {
    _asSoonAsPossible = value;
    notifyListeners();
  }

  void setSelectedDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }

  void setIsAllowNecesseryLicense(value) {
    isAllowNecesseryLicense = value;
    notifyListeners();
  }

  void setIsIHaveReadAndAccepted(value) {
    isIHaveReadAndAccepted = value;
    notifyListeners();
  }

//===============================================================================================================
//===============================================================================================================
//===============================================================================================================
//===============================================================================================================
//===============================================================================================================
//===============================================================================================================
//===============================================================================================================
//===============================================================================================================
//===============================================================================================================
//========================================= Alternatives places  ===============================================

  // Alternative places variables
  final PageController placesPageController = PageController();
  int propertyTypes = 0;

  void setpropertyType(int propertyType) {
    propertyTypes = propertyType;
    notifyListeners();
  }

//===============================================================================================================
//===============================================================================================================
//===============================================================================================================
//===============================================================================================================
//============================================ Hotels ===========================================================
//===============================================================================================================
//===============================================================================================================
//===============================================================================================================
//============================================================================================================
  final PageController hotelsPagecontroller = PageController();
  bool showMoreOptions = false;

  void toggleMoreOptions(bool value) {
    showMoreOptions = value;
    notifyListeners();
  }

  void selectOption(String option) {
    stayCategoryOption = option;
    notifyListeners();
  }

  bool get isStayCategoryOption => stayCategoryOption != null;

//===============================================================================================================
//===============================================================================================================
//===============================================================================================================
//===============================================================================================================
//===============================================================================================================
//===============================================================================================================
//===============================================================================================================
//===============================================================================================================
//================================================= Home Stay ===================================================
  final PageController homeStaycontroller = PageController();
  int selectedProperty = 0; // Default selection

  void setStayTypeEntireOrPrivatePlace(value) {
    isEntirePlace = value;
    notifyListeners();
  }

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

  //=================================================================================== Availability =============================================

  int _selectedRadioIndex = -1; // Initialize with -1 to indicate none selected
  bool _showAsSoonContainer = false;
  bool _showSpecificDateContainer = false;
  //==================================date initialize
  DateTime? availablitySelectedDate;

  int get selectedRadioIndex => _selectedRadioIndex;
  bool get showAsSoonContainer => _showAsSoonContainer;
  bool get showSpecificDateContainer => _showSpecificDateContainer;
  //get==========================
  DateTime? get selecteDate => _selectedDate;

  void setSelectedRadioIndex(int index) {
    _selectedRadioIndex = index;
    if (index == 0) {
      _showAsSoonContainer = true;
      _showSpecificDateContainer = false;
    } else if (index == 1) {
      _showAsSoonContainer = false;
      _showSpecificDateContainer = true;
    }
    notifyListeners();
  }

//============================================================
  void setAvailablitySelectedDatee(DateTime selectedDay) {
    _selectedDate = selectedDay;
    notifyListeners();
  }

//=================================================================== select three option sync=====================================================
//==================================================================================================================================================

  void setSelectThreeAvailability(int value) {
    _selectThreeAvailability = value;
    if (_selectThreeAvailability == 2) {
      syncAvailabilityfromAnotherorChanelManager = "connect with a Channel Manager";
    } else if (_selectThreeAvailability == 3) {
      syncAvailabilityfromAnotherorChanelManager = "No, won’t sync";
    }
    notifyListeners();
  }

  //==============================================================================================================================================
  //==============================================================================================================================================
  //====================================================Reservation yes or no ===================================================================
  bool _isAllowedOver30nightstay = true; // Initialize with -1 to indicate none selected
  bool get isAllowedOver30nightstays => _isAllowedOver30nightstay;

  void setAllowedOver30nightstays(bool value) {
    _isAllowedOver30nightstay = value;
    notifyListeners();
  }

  void setMaxReservationNumberOfNights(int value) {
    maxReservationNumberOfNights = value;
    // print(maxReservationNumberOfNights);
    notifyListeners();
  }

//==============================================================================================================================================
  bool _nonRefundableRatePlan = false; // New toggle state

  bool get nonRefundableRatePlan => _nonRefundableRatePlan; // Getter for new toggle state

  void setNonRefundableRatePlan(bool value) {
    _nonRefundableRatePlan = value;
    notifyListeners();
  }

//====================================================================================================================
  TextEditingController guestDiscountcontroller = TextEditingController();

  int _numberOfGuests = 0;
  double _guestDiscount = 0.0;

  int get numberOfGuests => _numberOfGuests;
  double get guestDiscount => _guestDiscount;

  void increaseNumberGuests() {
    _numberOfGuests++;
    notifyListeners();
  }

  void decreaseNumberGuests() {
    if (_numberOfGuests > 0) {
      _numberOfGuests--;
      notifyListeners();
    }
  }

  void increaseGuestDiscount() {
    if (_guestDiscount < 100) {
      _guestDiscount++;
      notifyListeners();
    }
  }

  void decreaseGuestDiscount() {
    if (_guestDiscount > 0) {
      _guestDiscount--;
      notifyListeners();
    }
  }

  int _discountRate = 0;
  int get discountRate => _discountRate;
  TextEditingController _discountRateController = TextEditingController();
  TextEditingController get discountRateController => _discountRateController;

  void increaseDiscountRate() {
    _discountRate++;
    notifyListeners();
  }

  void decreaseDiscountRate() {
    if (_discountRate > 0) {
      _discountRate--;
      notifyListeners();
    }
  }

  void setWeeklydiscoutRate(value) {
    _discountRate = int.parse(value);
    _discountRateController.clear();
    notifyListeners();
  }

//==================================================== Property listing ======================================================
  bool isBussnessCorporation = true;

  void setIndividual(bool value) {
    isBussnessCorporation = value;
    notifyListeners();
  }

  void addApartmnetList() {
    final apartment = {
      "stayCategoryOption": stayCategoryOption,
      'number_of_property': numberOfOwnedProperties,
      'isAllOwnedPropertiesAreSameAddress': isAllOwnedPropertiesAreSameAddress,
      "propertyDetails": {
        'property_Name': propertyName,
        'propertyCountry': propertyCountry,
        'propertyStreetName': propertyStreetName,
        'propertyPostCode': propertyPostCode,
        'propertyCity': propertyCity,
        "propertyLocationMapLink": propertyLocationMapLink,
      },
      "roomDetails": {
        'livingRoomSofaBedCount': livingRoomSofaBedCount,
        "bedRoomList": bedRoomList,
        "otherSpaceDetailsList": otherSpaceDetailsList,
      },
      "aminitiesList": aminitiesList,
      "breakFastDetailsList": breakFastDetailsMap,
      "parkingOption": parkingOption,
      "staffLanguagesList": staffSpeakingLanguagesList,
      "checkInAndCheckoutDetailes": {
        "checkInFrom": checkInFrom,
        "checkInUntil": checkInUntil,
        "checkOutFrom": checkOutFrom,
        "checkOutUntil": checkOutUntil,
      },
      "houseRules": {
        "issmokingAllowedHouseRules": issmokingAllowedHouseRules,
        "isallowPetshouseRules": isallowPetshouseRules,
        "iseventsAllowedHouseRules": iseventsAllowedHouseRules,
      },
      "hostProfileDetailsMap": hostProfileDetailsMap,
      "propertyImagesList": propertyImagesList,
      "bookingDetails": {
        "allGuestscCanBookInstantly": isAllGuestscCanBookInstantly,
        "propertyPricePerNight": propertyPricePerNight,
        "cancelationPolicy": {
          "freeCancellationDaysOfBooking": freeCancellationDaysOfBooking,
          "isProtectionAgainstAccidentalBookings": isprotectionAgainstAccidentalBookings,
        },
      },
      "groupDisCount": {
        "isGroupDiscountUpdateAnyTimeEnabled": isGroupDiscountUpdateAnyTimeEnabled,
        "groupDiscountPersentage": groupDiscountPersentage,
      },
      "availability": {
        "firstDayGuestCanCheckIn": asSoonAsPossible ? "As soon us possible" : firstDayGuestCanCheckInSelectedDate,
        "syncAvailabilityfromAnotherorChanelManager": _selectThreeAvailability == 1 ? syncAvailabilityfromAnotherorChanelManager : webcontroller.text,
        "maxReservationNumberOfNights": _isAllowedOver30nightstay ? "Over 30 Nights" : maxReservationNumberOfNights,
      },
      "GoodsAndServicesTax": {
        "isRegisteredForGSTPurpose": isForGstPurpuse,
        "tradeName": tradeNameController.text,
        "GSTIN": GsGSTINController.text,
        "PANCardNumber": panNoController.text,
        "isFourthOfPanCardPOrH": isFourthCharecterOfPanOpen,
        "adharNumber": adharCarNumerController.text,
      },
      "listingPropertyBusinessOrIndividual": {
        "isBussnessCorporation": isBussnessCorporation,
        "PropertyLegalName": propertyLegalName.text,
        "registerdCountryOrRegion": registerdCountryOrRegion.text,
        "registerdAddressLine1": registerdAddressLine1.text,
        "registerdAddressLine2": registerdAddressLine2.text,
        "registeredCity": registeredCity.text,
        "registeredZipCode": registeredZipCode.text,
        "propertyFirstNameStatedOnID": propertyFirstNameStatedOnID.text,
        "propertyMiddleNameStatedOnID": propertyMiddleNameStatedOnID.text,
        "propertyLastNameStatedOnID": propertyLastNameStatedOnID.text,
        "propertyOfficialEmail": propertyOfficialEmail.text,
        "propertyPhoneNumber": propertyPhoneNumber.text,
      },
    };
    print(apartment);
  }
}

////////////// Availbaility //////////////////////////////////////////////////
extension DateTimeExtension on DateTime {
  String toShortDateString() {
    return "$day/$month/$year";
  }
}
