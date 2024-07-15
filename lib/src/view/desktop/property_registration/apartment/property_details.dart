import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/view%20model/registration_provider.dart';
import 'package:flutter_application_1/src/view/desktop/dashboard/dashboard.dart';
import 'package:flutter_application_1/src/view/desktop/property_registration/alternative_places/places2.dart';
import 'package:flutter_application_1/src/view/desktop/widgets/custom_container.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


class PropertyDetailes extends StatelessWidget {
  final int goToPage;
  final int backToPage;
  final PageController pageController;
  const PropertyDetailes({
    super.key, required this.goToPage, required this.backToPage, required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final person = Provider.of<RegistrationProvider>(context,  );
    return SingleChildScrollView(
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
                  Column(
                    children: List.generate(person.bedRoomList.length, (index) => 
                      Padding(
                        padding: EdgeInsets.only(bottom: height * 0.03,right: width * 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Consumer<RegistrationProvider>(
                              builder: (context, provider, child) => 
                              Row(
                                children: [
                                  CustomContainer(
                                      height: height * 0.1,
                                      width: width * 0.27,
                                      color: Colors.white,
                                      boxShadow: true,
                                      child: TextButton(
                                        style: TextButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(0)
                                          ),
                                        ),
                                        onPressed: () {
                                          provider.openBedRoomBottomSheet();
                                          provider.bedRoomSelectedIndex = index;
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
                                            Icon(provider.bedroomBottomSheet && index == provider.bedRoomSelectedIndex? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,color: Colors.grey),
                                          ],
                                        ),
                                      ),
                                  ),
                                  sizedBox(0.0, width * 0.01),
                                  IconButton.outlined(
                                    onPressed: (){
                                      provider.removeBedRoom(index);
                                    }, icon: Icon(Icons.remove,color: Colors.grey))
                                ],
                              ),
                            ),
                            sizedBox(0.0, width * 0.2),
                                  person.bedroomBottomSheet && index == person.bedRoomSelectedIndex?
                                  CustomContainer(
                                  width: width,
                                  color: Colors.white,
                                  boxShadow: true,
                                  padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                                  child: bedSelectionDropDown(height, width, 'bedroom'),
                                ): const SizedBox()
                          ],
                        ),
                      ),
                    ),
                  ),
                  //============================================= Living Room and Otherspace ===========================================
                  for (int i = 0; i < 3; i ++) 
                  Padding(
                    padding: EdgeInsets.only(bottom: height * 0.03,right: width * 0.04),
                    child: Column(
                      children: [
                        //================================================== Add Rooms Button ==============================================
                        i == 2?
                        Consumer<RegistrationProvider>(
                          builder: (context, value, child) => 
                          TextButton.icon(
                            onPressed: () {
                              value.addBedRoom();
                            },
                            label: const Text('add Bedroom'),
                            icon: CustomContainer(
                              boxShadow: false,
                              border: Border.all(color: Colors.grey.shade300),
                              boxShape: BoxShape.circle,
                              padding: const EdgeInsets.all(3),
                              child: Icon(Icons.add,size: height * 0.024)),
                          ),
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
                ],
              ),
            ),
            sizedBox(height * 0.025, width),
            //========================================= Hoew Many Guests Can Stay | How many bathrooms are there? ================================================
            CustomContainer(
              boxShadow: true,
              width: width * 0.35,
              padding: EdgeInsets.symmetric(vertical: height * 0.025, horizontal: width * 0.02),
              color: Colors.white,
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(2, (index) => 
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(index == 0? 'How many guests can stay?' : 'How many bathrooms are there?'),
                      sizedBox(height * 0.02, width),
                      Consumer<RegistrationProvider>(
                        builder: (context, consumer, child) => 
                        CustomContainer(
                                            boxShadow: false,
                                            borderRadius: BorderRadius.circular(5),
                                            border: Border.all(color: Colors.grey.shade400),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: <Widget>[
                                                IconButton(
                                                  onPressed: () {
                                                    consumer.decrementGuestCounter(index);
                                                  },
                                                  icon: Icon(Icons.remove,size: height * 0.025,),
                                                ),
                                                Text(index == 0?'${consumer.guestCapacity}' : '${consumer.bathRoomCount}', style: smallTextStyle),
                                                IconButton(
                                                  onPressed: () {
                                                    consumer.increamentGuestCounter(index);
                                                  },
                                                  icon: Icon(Icons.add,size: height * 0.025,),
                                                ),
                                              ],
                                            ),
                                          ),
                      ),
                                        sizedBox(index == 0?height * 0.02 : 0, 0.0),
                    ],
                  ),
                  
                ),
              ),
            ),
            sizedBox(height * 0.025, width),
            // ==================================================== Allow  Children ========================================================
            CustomContainer(
              boxShadow: true,
              width: width * 0.35,
              padding: EdgeInsets.symmetric(vertical: height * 0.025, horizontal: width * 0.02),
              color: Colors.white,
              child:  Column(
                children: List.generate(2, (index) => 
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           Text(
                            index == 0 ? 
                            'Do you allow children? ':
                            'Do you offer cots?',
                            style: smallTextStyle
                          ),
                          index == 1? SizedBox(width: width * 0.3,child: Text('Cots sleep most infants 0-3 and can be made available to guests on request.',style: GoogleFonts.montserrat(color: Colors.black,fontSize: 12,fontWeight: FontWeight.w400))) : const SizedBox(),
                          sizedBox(height * 0.02, 0.0),
                          //======================================================= Radiao Buttons ====================================
                          Consumer<RegistrationProvider>(
                            builder: (context, consumer, child) => 
                            RadioButtons(groupValue: index== 0? consumer.isallowChildren :consumer.allowCoats, 
                            onChanged1 :index== 0? (value) {
                              consumer.setingAllowChildren(value);
                            }:(value) {
                              consumer.setAllowCoats(value);
                            },
                            onChanged2: index == 0? 
                            (value) => consumer.setingAllowChildren(value):
                            (value) => consumer.setAllowCoats(value)
                            ),
                          ),
                          sizedBox(index == 0 ?height * 0.03 : 0, 0.0),
                        ],
                      ),
                ),
              ),
            ),
            sizedBox(height * 0.03, width),
            Row(
              children: [
                backButton(height, width, (){
                  person.goToPage(backToPage, pageController);
                },
                ),
                sizedBox(0.0, width * 0.02),
                continueButton(height, width, true, (){
                  person.goToPage(goToPage, pageController);
                })
              ],
            ),
            sizedBox(height * 0.2, width)
          ],
        ),
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

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  Column bedSelectionDropDown(double height, double width,String spaceType) {
    return Column(
              children: List.generate(7, (index) => 
                                    Padding(
                                      padding: EdgeInsets.only(top: height * 0.015, bottom: height * 0.02),
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

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class RadioButtons extends StatelessWidget {
  final bool groupValue;
  final void Function(bool?) onChanged1;
  final void Function(bool?) onChanged2;
  const RadioButtons({
    super.key, required this.groupValue, required this.onChanged1, required this.onChanged2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Radio<bool>(
          activeColor: Colors.lightBlueAccent,
          value: true,
          groupValue: groupValue,
          onChanged: onChanged1
        ),
         const Text(
          'Yes',
          style: TextStyle(fontSize: 12),
        ),
        sizedBox(0.0, 20),
        Radio<bool>(
          activeColor: Colors.lightBlueAccent,
          value: false,
          groupValue: groupValue,
          onChanged: onChanged2
        ),
        const Text(
          'No',
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}