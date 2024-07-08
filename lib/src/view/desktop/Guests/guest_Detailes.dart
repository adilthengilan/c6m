import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:tuch_trip_crms/src/view%20model/guest_detailes_provider.dart';
import 'package:tuch_trip_crms/src/view%20model/guest_management_provider.dart';
import 'package:tuch_trip_crms/src/view/desktop/dashboard/dashboard.dart';
import 'package:tuch_trip_crms/src/view/desktop/desktop_view.dart';
import 'package:tuch_trip_crms/src/view/widgets/custom_container.dart';


////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
class GuestDetailesScreen extends StatelessWidget {
  const GuestDetailesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: const AppAppBar(pageName: false),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: height * 0.08,left: width * 0.04,right: width * 0.06),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //======================================================== User Detailes [Profile Pic] [Mobile Number] [Name] =======================================  
                  CustomContainer(
                    boxShadow: true,
                    height: height * 0.5,
                    width: width * 0.18,
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    padding: EdgeInsets.symmetric(horizontal: width * 0.01,vertical: height * 0.02),
                    child: Column(
                      children: [
                        CustomContainer(
                          boxShadow: false,
                          height: height * 0.26,
                          width: width,
                          borderRadius: BorderRadius.circular(8),
                          gradiantColors: [Color.fromARGB(255, 255, 202, 251), Color.fromARGB(255, 178, 232, 255)],
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //============================================== Profile Image ==========================================================
                              CircleAvatar(
                                radius: width * 0.023,
                                backgroundColor: Colors.grey.shade100,
                                backgroundImage: AssetImage('assets/images/profile image.png'),
                              ),
                              sizedBox(height * 0.03, width),
                              Text('John Smith',style: smallTextStyleBold),
                              sizedBox(height * 0.01, width),
                              Text('User Id',style: smallTextStyle),
                            ],
                          ),
                        ),
                        sizedBox(height * 0.04, width),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(2, (index) => 
                            Padding(
                              padding: EdgeInsets.only(bottom: height * 0.02),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  //================================= Icons [Call] [Email] ==============================================================
                                  CustomContainer(
                                    boxShadow: false,
                                    boxShape: BoxShape.circle,
                                    padding: EdgeInsets.all(height * 0.015),
                                    border: Border.all(color: Colors.deepPurple.shade200,width: 2),
                                    child: Center(
                                      child: Icon(index == 0? Icons.call_outlined :  Icons.email_outlined,size: height * 0.02),
                                    ),
                                  ),
                                  sizedBox(0.0, width * 0.01),
                                  //========================================= Mobile Number & Eamil ====================================================== 
                                  SizedBox(
                                    width: width * 0.1,
                                    child: Text(index == 0 ?'+91 9374846287' : 'Johnsmith@gmail.com',style: smallTextStyle)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  sizedBox(0.0, width * 0.02),
                  //======================================================== Current or Recent Booking Detailes =============================================
                  CustomContainer(
                    boxShadow: true,
                    height: height * 0.5,
                    width: width * 0.7,
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    padding: EdgeInsets.only(top: height * 0.02,left: width * 0.03,right: width * 0.015),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Recent Booking',style: mediumTextStyleBold),
                        sizedBox(height * 0.03, width),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: height * 0.04,
                              backgroundColor: Colors.orangeAccent.shade100,
                              child: Center(
                                child: Icon(Icons.key_outlined,color: Colors.white,size: height * 0.035),
                               ),
                            ),
                            sizedBox(0.0, width * 0.02),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              Text('Booking id : 0994uy37r83908287',style: smallTextStyle),
                              sizedBox(height * 0.01, 0.0),
                              Text('Family Bed Deluxe',style: smallTextStyleBold)
                              ],
                            ),
                            sizedBox(0.0, width * 0.1),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(3, (index) => 
                                Padding(
                                  padding: EdgeInsets.only(right: width * 0.02),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                      Icon(IconlyLight.user,size: width * 0.01),
                                      sizedBox(0.0, width * 0.01),
                                      Text(index ==0?  'Rooms Capacity' : index == 1? 'Bed Type' : 'Booking Date',style: smallTextStyle),
                                        ],
                                      ),
                                      sizedBox(height * 0.01, 0.0),
                                      Padding(
                                        padding:  EdgeInsets.only(left: width * 0.02),
                                        child: Text(index == 0? '3 - 5 Person' : index == 1? 'Double' : 'oct 25 - Sep 1 2023',style: smallTextStyleBold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        sizedBox(height * 0.05, width),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Room Facilities',style: mediumTextStyleBold),
                            Text('Tv, Double Bed, Swiming Pool, Bathtub',style: smallTextStyle)
                          ],
                        ),
                        sizedBox(height * 0.02, width),
                        SizedBox(
                          height: height * 0.2,
                          width: width,
                          child:  Stack(
                            children:[ 
                            Consumer<GuestDetailesProvider>(
                              builder: (context, person, child) => 
                              ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 10,
                              controller: person.imageScrollController,
                              itemBuilder: (context, index) => Padding(
                                padding:  EdgeInsets.only(right: width * 0.01),
                                  child: CustomContainer(
                                  boxShadow: true,
                                  height: height,
                                  width: width * 0.15,
                                  color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(10),
                                  margin: EdgeInsets.symmetric(horizontal: height * 0.004),
                                  image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage('assets/images/59668rce.png')),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              right: 0,
                              bottom: 0,
                              top: 0,
                            child: Consumer<GuestDetailesProvider>(
                              builder: (context, person, child) => 
                              InkWell(
                                onTap: person.scrollToNext,
                                child: CustomContainer(
                                boxShadow: true,
                                color: Colors.yellowAccent.shade100,
                                boxShape: BoxShape.circle,
                                padding: EdgeInsets.all(height * 0.01),
                                child: const Icon(Icons.keyboard_arrow_right),
                                  ),
                              ),
                            ),
                            ),
                            Positioned(
                              left: 0,
                              bottom: 0,
                              top: 0,
                            child: Consumer<GuestDetailesProvider>(
                              builder: (context, person, child) => 
                              InkWell(
                                onTap: person.scrollToPrevious,
                                child: CustomContainer(
                                boxShadow: true,
                                color: Colors.yellowAccent.shade100,
                                boxShape: BoxShape.circle,
                                padding: EdgeInsets.all(height * 0.01),
                                child: const Icon(Icons.keyboard_arrow_left),
                                  ),
                              ),
                            ),
                            ),
                           ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              sizedBox(height * 0.03, 0.0),
              CustomContainer(
              width: width ,
              color: backgroundColor,
              borderRadius: BorderRadius.circular(10),
              padding: EdgeInsets.symmetric(vertical: height * 0.02),
              boxShadow: true,
              child: Column(
                children: [
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: width * 0.015),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Booking History',style: mediumTextStyleBold),
                        CustomContainer(
                          boxShadow: true,
                          borderRadius: BorderRadius.circular(8),
                          width: width * 0.08,
                          height: height * 0.048,
                          color: Colors.pinkAccent.shade100,
                          child: Center(
                            child: Text('DateFilter'),
                          ),
                        )
                      ],
                    ),
                  ),
                  sizedBox(height * 0.02, 0.0),
                  CustomContainer(
                    boxShadow: false,
                    width: width,
                    height: height * 0.06,
                    padding: EdgeInsets.symmetric(horizontal:width * 0.015),
                    border: Border.symmetric(horizontal: BorderSide(color: Colors.grey.shade300)),
                    child: Row(
                    children: List.generate(5, (index) => 
                    Padding(
                      padding: EdgeInsets.only(left: index == 0? width * 0.015 : 0),
                      child: SizedBox(
                        width: index == 0?  width * 0.3 : index == 1? width * 0.1 : index == 2? width * 0.1 : index == 3?  width * 0.24 : width * 0.06 ,
                        child: Align(alignment: Alignment.centerLeft,child: Text(index == 0? 'Room Name' : index == 1? 'Room Type': index == 2? 'Room Floor' : index == 3? 'Room Facility' : 'Book Date', style: smallTextStyleBold))),
                          ),
                        ),
                      ),
                    ),
                    ListView.builder(
                      itemCount: 10,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, builderIndex) => 
                      CustomContainer(
                        width: width,
                        padding: EdgeInsets.only(left: width * 0.004),
                        border: BorderDirectional(bottom: BorderSide(color: Colors.grey.shade100)),
                        color: backgroundColor,
                        boxShadow: true,
                        child: Row(children: [
                        Container(
                          width: width * 0.327,
                          padding: EdgeInsets.symmetric(vertical: height * 0.01),
                          child: Row(
                            children: [
                              sizedBox(0.0, width * 0.006),
                              Consumer<GuestManagementProvider>(
                                builder: (context, person, child) => 
                                 Checkbox(
                                   value: builderIndex == person.guestSelectedIndex ? true : false,
                                    onChanged: (value) {
                                      person.setSelectGuestIndex(value);
                                    },
                                    activeColor: Colors.cyanAccent,
                                    checkColor: Colors.white,
                                 ),
                              ),
                              sizedBox(0.0, width * 0.01),
                              CustomContainer(
                                height: height * 0.1,
                                width: width * 0.11,
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage('assets/images/59668rce.png')),
                                boxShadow: false,
                              ),
                              sizedBox(0.0, width * 0.01), 
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center, 
                                children: [
                                  Text('Room No',style: smallTextStyle),
                                  sizedBox(height * 0.01, 0.0),
                                  SizedBox(width: width * 0.1,child: Text('Deluxe 8 0004',style: smallTextStyleBold)),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Row(
                            children: List.generate(3, (index) => 
                              Container(
                              width: index == 2? width * 0.24 : width * 0.1,
                              padding: EdgeInsets.only(right: index == 2? width * 0.08 : width * 0.01),
                              child: Text(index == 0 ? builderIndex == 0?  'Double Bed' : 'Single Bed' : index == 1 ? 'Floor G - 05' : 'Ac, Shower, Double Bed, Towel, Bathtub, Coffee set,Led Tv,Wifi',style: smallTextStyle)),
                            ),
                          ),
                          SizedBox(
                            width: width * 0.1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(width: width * 0.09,
                                  child: Text('Oct 29 - Sep 27 2023 6 : 30',
                                  style: smallTextStyle
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
