import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tuch_trip_crms/src/view%20model/registration_provider.dart';
import 'package:tuch_trip_crms/src/view/desktop/dashboard/dashboard.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/apartment/apartment_page_1.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/apartment/apartment_page_2.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/apartment/apartment_page_4.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/apartment/aprtment_page_3.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/apartment/property_location.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/registration_menu.dart';
import 'package:tuch_trip_crms/src/view/widgets/custom_container.dart';

class Apartment extends StatelessWidget {
  const Apartment({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final person = Provider.of<RegistrationProvider>(context, listen: false);
    return Scaffold(
      appBar: RegistrationAppBar(height, width),
      backgroundColor: backgroundColor,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: person.apartmentPagecontroller,
        children: [
          const PropertyLocationPage(gotToNextPage: 5,goToBackPage: 3),
          const ApartmentPage1(),
          const ApartmentPage2(),
          const ApartmentPage3(),
          const ApartmentPage4(),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: width * 0.1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sizedBox(height * 0.06, 0.0),
                  CustomContainer(
                    boxShadow: true,
                    width: width * 0.35,
                    padding: EdgeInsets.symmetric(vertical: height * 0.025, horizontal: width * 0.02),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        sizedBox(height * 0.04, width),
                        Text('Property details',style: largeTextStyleBold),
                        sizedBox(height * 0.04, width),
                        Text('Where can people sleep?',style: smallTextStyleBold),
                        sizedBox(height * 0.025, width),
                        //=========================================================== Bed Rooms List ===============================================================
                        Consumer<RegistrationProvider>(
                        builder: (context, person, child) { 
                          print(person.bedRoomList);
                          return Column(
                            children: List.generate(person.bedRoomList.length, (index) => 
                             person.bedRoomList.isNotEmpty?
                              Padding(
                                padding: EdgeInsets.only(bottom: height * 0.03,right: width * 0.04),
                                child: Column(
                                  children: [
                                    CustomContainer(
                                        height: height * 0.1,
                                        width: width,
                                        color: Colors.white,
                                        boxShadow: true,
                                        child: TextButton(
                                          style: TextButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(0)
                                            ),
                                          ),
                                          onPressed: () {
                                            person.openBedRoomBottomSheet();
                                            person.bedRoomSelectedIndex = index;
                                          },
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text('Bed Room',style: smallTextStyle),
                                                  sizedBox(height * 0.01, 0.0),
                                                  Text('3 Beds',style: smallTextStyle)
                                                ],
                                              ),
                                              Icon(person.bedroomBottomSheet && index == person.bedRoomSelectedIndex? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,color: Colors.grey)
                                            ],
                                          ),
                                        ),
                                      ),
                                      sizedBox(height * 0.01, 0.0),
                                      person.bedroomBottomSheet && index == person.bedRoomSelectedIndex?
                                      CustomContainer(
                                      height: height * 0.1,
                                      width: width,
                                      color: Colors.white,
                                      boxShadow: true,
                                      child: bedSelectionDropDown(height, width, 'bedroom'),
                                    ): const SizedBox()
                                  ],
                                ),
                              ) : SizedBox(),
                            ),
                          );
                         }
                        ),
                        //============================================= Living Room and Otherspace ===========================================
                        for (int i = 0; i < 3; i ++) 
                        Padding(
                          padding: EdgeInsets.only(bottom: height * 0.03,right: width * 0.04),
                          child: Consumer<RegistrationProvider>(
                            builder: (context, person, child) => 
                            Column(
                              children: [
                                //================================================== Add Rooms Button ==============================================
                                i == 2?
                                TextButton.icon(
                                  onPressed: () {
                                    person.addBedRoom();
                                  },
                                  label: Text('add Bedroom'),
                                  icon: Icon(Icons.add),
                                ):
                                CustomContainer(
                                  height: height * 0.1,
                                  width: width,
                                  color: Colors.white,
                                  boxShadow: true,
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(0)
                                      ),
                                    ),
                                    onPressed: i == 0? 
                                    () {
                                      person.openLivingRoomBottomSheet();
                                    } : () {
                                      person.openOtherSpaceRoomBottomSheet();
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(i == 0?'Living room' : 'Other Spaces',style: smallTextStyle),
                                            sizedBox(height * 0.01, 0.0),
                                            Text(i == 0
                                            ?'${person.livingRoomSofaBed} beds': 
                                            '${person.otherSpaceSingleBed + 
                                              person.otherSpaceOfDoubleBed +
                                              person.otherSpaceKingSizeBedCount + 
                                              person.otherSpaceSuperKingSizeBedCount +
                                              person.otherSpaceBunkBed + 
                                              person.bedroomSofaBed + 
                                              person.bedroomFutonMat} beds',style: smallTextStyle),
                                          ],
                                        ),
                                        Icon(person.livingRoomBottomSheet && i == 0 || i == 1 && person.otherSpaceBottomSheet? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,color: Colors.grey)
                                      ],
                                    ),
                                  ),
                                ),
                                sizedBox(height * 0.01, 0.0),
                                i == 0?
                                person.livingRoomBottomSheet?
                                CustomContainer(
                                  width: width,
                                  color: Colors.white,
                                  padding: EdgeInsets.symmetric(horizontal: width * 0.01,vertical: height * 0.01),
                                  boxShadow: true,
                                  child:  livingRoomBedCount(width, height, person),
                                ): const SizedBox() : 
                                person.otherSpaceBottomSheet && i == 1?
                                CustomContainer(
                                  boxShadow: true,
                                  width: width,
                                  color: Colors.white,
                                  padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                                  child: bedSelectionDropDown(height, width,'other'),
                                ): const SizedBox()
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row livingRoomBedCount(double width, double height, RegistrationProvider person) {
    return Row(
                                            children: <Widget>[
                                              const Icon(Icons.bed_outlined),
                                              sizedBox(0.0, width * 0.015),
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  SizedBox(
                                                    width: width * 0.14,
                                                    child: Text(
                                                      'Sofa bed',
                                                      style: smallTextStyle,
                                                    ),
                                                  ),
                                                  sizedBox(height* 0.004, 0.0),
                                                  Text('Variable size',
                                                  style: GoogleFonts.montserrat(
                                                    fontSize: 10,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w400,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const Spacer(),
                                              CustomContainer(
                                                boxShadow: false,
                                                borderRadius: BorderRadius.circular(10),
                                                border: Border.all(color: Colors.grey.shade400),
                                                child: Row(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: <Widget>[
                                                    IconButton(
                                                      onPressed: () {
                                                        person.decrementBedCount('living', 0);
                                                      },
                                                      icon: Icon(Icons.remove,size: height * 0.025,),
                                                    ),
                                                    Text('${person.livingRoomSofaBed}', style: smallTextStyle),
                                                    IconButton(
                                                      onPressed: () {
                                                        person.incrementBedCount('living', 0);
                                                      },
                                                      icon: Icon(Icons.add,size: height * 0.025,),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          );
  }

  Column bedSelectionDropDown(double height, double width,String spaceType) {
    return Column(
              children: List.generate(7, (index) => 
                                    Padding(
                                      padding:  EdgeInsets.only(top: height * 0.015,bottom: height * 0.02),
                                      child: Row(
                                              children: <Widget>[
                                                const Icon(Icons.bed_outlined),
                                                sizedBox(0.0, width * 0.015),
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    SizedBox(
                                                      width: width * 0.14,
                                                      child: Text(
                                                        index == 0 ? 'Single bed' : index == 1? 'Double bed' :index == 2? 'Large bed (King size)' : index == 3? 'Extra-large double bed (Super-king size)': index == 4? 'Bunk bed': index == 5? 'Sofa bed' : 'Futon Mat',
                                                        style: smallTextStyle,
                                                      ),
                                                    ),
                                                    sizedBox(height* 0.004, 0.0),
                                                    Text(index == 0 ? '90 - 130 cm wide' : index == 1? '131 - 150 cm wide' :index == 2? '151 - 180 cm wide' : index == 3? '181 - 210 cm wide': index == 4? 'Variable size': index == 5? 'Variable size' : 'Variable size',
                                                    style: GoogleFonts.montserrat(
                                                      fontSize: 10,
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.w400,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const Spacer(),
                                                CustomContainer(
                                                  boxShadow: false,
                                                  borderRadius: BorderRadius.circular(10),
                                                  border: Border.all(color: Colors.grey.shade400),
                                                  child: Consumer<RegistrationProvider>(
                                                    builder: (context, person, child) => 
                                                    Row(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: <Widget>[
                                                        IconButton(
                                                          onPressed: () {
                                                            person.decrementBedCount(spaceType, index);
                                                          },
                                                          icon: Icon(Icons.remove,size: height * 0.025,),
                                                        ),
                                                        Text(person.bedCount(spaceType)[index],
                                                            style: smallTextStyle),
                                                        IconButton(
                                                          onPressed: () {
                                                            person.incrementBedCount(spaceType, index);
                                                          },
                                                          icon: Icon(Icons.add,size: height * 0.025,),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                    ),
                                  ),
                                );
  }
}
