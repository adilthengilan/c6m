import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RegistrationProvider extends ChangeNotifier {
  TextEditingController numberofPropertycontroller = TextEditingController();
  PageController apartmentPagecontroller = PageController();
  PageController finalPagePageviewcontroller = PageController();
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
  int bedroomSingleBed = 1;
  int bedroomOfDoubleBed = 0;
  int bedroomKingSizeBedCount = 0;
  int bedroomSuperKingSizeBedCount = 0;
  int bedroomBunkBed = 0;
  int bedroomSofaBed = 0;
  int bedroomFutonMat = 0;
  //============================================================== Allow Children =====================================================================
  bool isallowChildren = true;
  bool allowCoats = true;
  //============================================================== How many Guest Can Stay ========================================================================
  int guestCapacity = 1;
  int bathRoomCount = 0;
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
  bool serveBreakfast = false;
  String parkingOption = 'No';
  bool isBrakFastIncludedCost = true;
  TextEditingController breackFastCostController = TextEditingController();
  List offeredbreakFastList = [];
  //for State Management Not A Data
  bool isBreakFastSelected = false;
  //================================================================ Staff Languages ===========================================================================
  List<String> staffLanguagesList = [];
  // for state managemnet not a data
  String selectedLanguage = '';

  ///================================================================ House Roles ==============================================================================
  String? checkInFrom = '15:00';
  String? checkInUntil = '18:00';
  String? checkOutFrom = '08:00';
  String? checkOutUntil = '11:00';
  bool issmokingAllowed = false;
  bool isallowPets = false;
  bool iseventsAllowed = false;

  ///================================================================ House Roles ==============================================================================
  bool isshowProperty = true;
  bool isshowHost = false;
  bool isshowNeighborhood = false;
  //=================================================================== Property images ======================================================================
  final ImagePicker _picker = ImagePicker();
  Uint8List? proImage;
  //==================================================================== Receive bookings =====================================================================
  bool allGuestscCanBookInstantly =
      true; //this variable is All Guests Can Book Instantly, when its True. When the value is false it means All Guests Will Need Request To Book
  //==================================================================== Property Price per Night =============================================================
  TextEditingController priceController = TextEditingController();
  double propertyPricePerNight = 0;
  //==================================================================== Partner verification ==================================================================
  String ownershipType = 'business';
  TextEditingController fullNameBusinessEntity = TextEditingController();
  TextEditingController addressBusinessEntity = TextEditingController();
  TextEditingController zipCodeBussinessEntity = TextEditingController();
  TextEditingController cityBussinessEntity = TextEditingController();
  TextEditingController countryBussinessEntity = TextEditingController();
  //====================================================================== Goods & Services Tax = ==============================================================
  bool isGstPurpuse = false;
  TextEditingController panController = TextEditingController();
  bool isFourthCharecterOfPanHorP = true;
  TextEditingController panNoController = TextEditingController();
  TextEditingController tradeNameController = TextEditingController();
  TextEditingController GsGSTINController = TextEditingController();

  get selectedDate => null;

//This Function will controlling page view, This function can easy to change the pages in the paview
  void goToPage(int page, pageviewController) {
    pageviewController.animateToPage(
      page,
      duration: const Duration(milliseconds: 500),
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
    notifyListeners();
  }

  void removeBedRoom(int index) {
    if (index >= 0 && index < _bedRoomList.length) {
      _bedRoomList.removeAt(index);
    } else {
      print('Index out of range');
    }
    notifyListeners();
  }

  void setingAllowChildren(value) {
    isallowChildren = value;
    notifyListeners();
  }

  void setAllowCoats(value) {
    allowCoats = value;
    notifyListeners();
  }

  void increamentGuestCounter(counterIndex) {
    if (counterIndex == 0) {
      guestCapacity++;
    } else if (counterIndex == 1) {
      bathRoomCount++;
    }
    notifyListeners();
  }

  void decrementGuestCounter(int counterIndex) {
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
//================================================== Setting  Hotel Aminitiest =====================================================================

  //================================================  // General Amenities =========================================================================
  void setAirConditioning(bool value) {
    airConditioning = value;
    notifyListeners();
  }

  void setHeating(bool value) {
    heating = value;
    notifyListeners();
  }

  void setFreeWifi(bool value) {
    freeWifi = value;
    notifyListeners();
  }

  void setEvChargingStation(bool value) {
    evChargingStation = value;
    notifyListeners();
  }

  //================================================  /// Cooking and Cleaning =========================================================================
  void setKitchen(bool value) {
    kitchen = value;
    notifyListeners();
  }

  void setKitchenette(bool value) {
    kitchenette = value;
    notifyListeners();
  }

  void setWashingMachine(bool value) {
    washingMachine = value;
    notifyListeners();
  }

  //================================================  // Entertainment =========================================================================
  void setFlatScreenTV(bool value) {
    flatScreenTV = value;
    notifyListeners();
  }

  void setSwimmingPool(bool value) {
    swimmingPool = value;
    notifyListeners();
  }

  void setHotTub(bool value) {
    hotTub = value;
    notifyListeners();
  }

  void setMinibar(bool value) {
    minibar = value;
    notifyListeners();
  }

  void setSauna(bool value) {
    sauna = value;
    notifyListeners();
  }

//=================================================  // Outside and View =========================================================================
  void setBalcony(bool value) {
    balcony = value;
    notifyListeners();
  }

  void setGardenView(bool value) {
    gardenView = value;
    notifyListeners();
  }

  void setTerrace(bool value) {
    terrace = value;
    notifyListeners();
  }

  void setView(bool value) {
    view = value;
    notifyListeners();
  }

//=================================================  Property Service =========================================================================
  void setServeBreakfast(bool value) {
    serveBreakfast = value;
    notifyListeners();
  }

  //Parkin Option String
  void setParkingOption(String value) {
    parkingOption = value;
    notifyListeners();
  }

  void setbraekFastCostIncluded(value) {
    isBrakFastIncludedCost = value;
    notifyListeners();
  }

  void settingOfferdBreakFast(brakFast, isSelected) {
    if (isSelected) {
      offeredbreakFastList.remove(brakFast);
    } else {
      offeredbreakFastList.add(brakFast);
    }
    notifyListeners();
  }

//=============================================================== Staff Languages ========================================================================
  void addingStaffLanguages(isSelected, language) {
    if (isSelected) {
      staffLanguagesList.remove(language);
    } else {
      staffLanguagesList.add(language);
    }
    print(staffLanguagesList);
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
    print('sssssssssssssssssssj');
    checkOutFrom = newValue;
    notifyListeners();
  }

  void setCheckOutUntil(String newValue) {
    print('aaaaaaaaaaaaaaaaaaaaaaa');
    checkOutUntil = newValue;
    notifyListeners();
  }

  void setSmokingAllowed(value) {
    issmokingAllowed = value;
    notifyListeners();
  }

  void setEventAllowed(value) {
    iseventsAllowed = value;
    notifyListeners();
  }

//============================================================== Property images ====================================================================

  void toggleProperty(bool value) {
    isshowProperty = value;
    notifyListeners();
  }

  void toggleHost(bool value) {
    isshowHost = value;
    notifyListeners();
  }

  void toggleNeighborhood(bool value) {
    isshowNeighborhood = value;
    notifyListeners();
  }

  void toggleAll(bool value) {
    isshowProperty = !value;
    isshowHost = !value;
    isshowNeighborhood = !value;
    notifyListeners();
  }

//============================================================== Pets and Childrens Allowed or Not ================================================

  void setPetsAllowed(value) {
    isallowPets = value;
    notifyListeners();
  }

//============================================================== Property images ====================================================================
  Future<void> pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      final bytes = await image.readAsBytes();
      proImage = bytes;
    }
    notifyListeners();
  }

//================================================================ Receive bookings =================================================================
  void setallGuestscCanBookInstantly(value) {
    //this variable is All Guests Can Book Instantly, when its True.
    if (value) {
      allGuestscCanBookInstantly = true;
    } else {
      //When the value is false it means All Guests Will Need Request To Book
      allGuestscCanBookInstantly = false;
    }
    notifyListeners();
  }

//================================================================= Property Price per Night ========================================================
  void setPropertyPricePerNight(value) {
    if (priceController.text != '') {
      propertyPricePerNight = double.parse(priceController.text);
    } else {
      propertyPricePerNight = 0.0;
    }
    notifyListeners();
  }

//================================================================== Partner verification ============================================================
  void setPartnerVerification(value) {
    ownershipType = value;
    notifyListeners();
  }

//====================================================================== Goods & Services Tax = ==============================================================
  void setGstPurpuse(value) {
    isGstPurpuse = value;
    notifyListeners();
  }

  void setFourthCharecterOfPanHorP(value) {
    isFourthCharecterOfPanHorP = value;
    notifyListeners();
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

  final PageController homeStayController = PageController();
  int selectedProperty = -1; // Default selection (-1 means no selection)
  int currentPage = 0; // Track the current page

  void jumpPage(int pageIndex, PageController pageController) {
    homeStayController.jumpToPage(pageIndex);
    currentPage = pageIndex; // Update the current page
    notifyListeners();
  }

  void setSelectedProperty(int index) {
    selectedProperty = index;
    notifyListeners();
  }

  bool get isoptionSelected => selectedProperty != -1;

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
  DateTime? _selectedDate;

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
  void setSelectedDate(DateTime selectedDay) {
    _selectedDate = selectedDay;
    notifyListeners();
  }

//=================================================================== select three option sync=====================================================
//==================================================================================================================================================
  int _selectedRadio = 0;

  int get selectedRadio => _selectedRadio;

  void setSelectedRadio(int value) {
    _selectedRadio = value;
    notifyListeners();
  }

  //==============================================================================================================================================
  //==============================================================================================================================================
  //====================================================Reservation yes or no ===================================================================
  int _selectRadioIndex = -1; // Initialize with -1 to indicate none selected
  bool _acceptReservationsOver30Nights = false;
  bool _notacceptReservations = false;

  int get selectRadioIndex => _selectRadioIndex;
  bool get acceptReservationsOver30Nights => _acceptReservationsOver30Nights;
  bool get notacceptReservations => _notacceptReservations;

  void setSelectRadioIndex(int index) {
    _selectRadioIndex = index;
    if (index == 0) {
      _acceptReservationsOver30Nights = true;
      _notacceptReservations = false;
    } else if (index == 1) {
      _acceptReservationsOver30Nights = false;
      _notacceptReservations = true;
    }
    notifyListeners();
  }

  void setMaxNightsPreferred(int i) {}

//==============================================================================================================================================
  bool _nonRefundableRatePlan = false; // New toggle state

  bool get nonRefundableRatePlan =>
      _nonRefundableRatePlan; // Getter for new toggle state

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

  //=========================================================================================================
  //===========================int _discountRate = 0;
  int _discountRate = 23;
  final double _basePrice = 56778.00;
  TextEditingController discountController = TextEditingController();

  RegistrationProvider() {
    discountController.text = _discountRate.toString();
  }

  int get discountRate => _discountRate;
  double get basePrice => _basePrice;

  double get nonRefundablePrice =>
      _basePrice - (_basePrice * _discountRate / 100);

  void increaseDiscountRate() {
    _discountRate++;
    discountController.text = _discountRate.toString();
    notifyListeners();
  }

  void decreaseDiscountRate() {
    if (_discountRate > 0) {
      _discountRate--;
      discountController.text = _discountRate.toString();
      notifyListeners();
    }
  }

}
