import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tuch_trip_crms/src/view/desktop/dashboard/dashboard.dart';
import 'package:tuch_trip_crms/src/view/widgets/custom_container.dart';
import 'package:tuch_trip_crms/src/view/widgets/custom_textfield.dart';
import 'package:tuch_trip_crms/src/view/widgets/show_dialogue.dart';
import 'package:tuch_trip_crms/src/view_model/guest_management_provider.dart';

class RoomScreen extends StatelessWidget {
  const RoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SizedBox(
        width: width * 0.82,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sizedBox(height * 0.04, 0.0),
            Row(
              children: [
                // ======================================== Tab Buttons [All Guests] [Pending] [Booked] [Canceled] [Refund] =====================================
                CustomContainer(
                  height: height * 0.051,
                  color: Colors.white,
                  margin: EdgeInsets.only(left: width * 0.02),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: true,
                  child: Row(
                    children: List.generate(
                      3,
                      (index) =>
                        Consumer<GuestManagementProvider>(
                          builder: (context, person, child) => 
                          InkWell(
                            onTap: (){
                              person.settabButtonIndex(index);
                            },
                            child: CustomContainer(
                              height: height,
                              borderRadius: BorderRadius.circular(10),
                              // gradiantColors:index == person.tabButtonSelectedIndex? [Colors.lightBlueAccent.shade200,Colors.cyanAccent.shade200] : [Colors.transparent,Colors.transparent], 
                              padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                              boxShadow: false,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(index == 0 ? 'Rooms (480)' : index == 1? 'Available Rooms (286)' : 'Booked', style: index == 0 ?  smallTextStyleBold : smallTextStyle),
                                  CustomContainer(
                                    width: width * 0.06,
                                    height: height * 0.005,
                                    borderRadius: BorderRadius.circular(10),
                                    gradiantColors:index == person.tabButtonSelectedIndex? [Colors.lightBlueAccent.shade200,Colors.cyanAccent.shade200] : [Colors.transparent,Colors.transparent], 
                                    boxShadow: false,
                                  ),
                                ],
                              ),
                            ), 
                         ),
                       ),
                    ),
                  ),
                ),
                sizedBox(0.0, width * 0.02),
                //======================================================= Search bar Side of The Tab Button ==================================================
                CustomContainer(
                height: height * 0.051,
                width: width * 0.25,
                color: Colors.white,
                boxShadow: true,
                borderRadius: BorderRadius.circular(10),
                child: Consumer<GuestManagementProvider>(
                  builder: (context, person, child) => 
                   CustomTextField(
                    labelText: 'Search here',
                    controller: person.guestSearchController,
                    borderRadius: 20,
                    borderSide: BorderSide.none,
                    suffixIcon: const Icon(Icons.search, color: Colors.blue),
                  ),
                ),
              ),
             ],
            ),
            sizedBox(height * 0.03, 0.0),
            //========================================================================= Guest List ==============================================================
            CustomContainer(
            width: width * 0.78,
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            margin: EdgeInsets.only(left: width * 0.02,right: width * 0.006,bottom: height * 0.04),
            boxShadow: true,
            child: Column(
              children: [
                CustomContainer(
                  boxShadow: false,
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                  height: height * 0.06,
                  border: BorderDirectional(bottom: BorderSide(color: Colors.grey.shade200)),
                  child: Row(
                    children: List.generate(8, (index) => 
                    Padding(
                      padding: EdgeInsets.only(left: index == 0? width * 0.015 : 0),
                      child: SizedBox(
                        width: index == 0?  width * 0.12 : index == 1? width * 0.1 : index == 2? width * 0.1 : index == 3 ? width * 0.14 : index  == 4? width * 0.08 : index == 6 || index == 7 ? width * 0.06 :  width * 0.1, 
                        child: Align(alignment: Alignment.centerLeft,child: Text(index == 0? 'Guests' : index == 1? 'Date': index == 2? 'Mobile No' : index == 3? 'Email' : index == 4? 'Book' : index == 5? 'Check-In' : index == 6? 'Edit' : 'Delete',style: smallTextStyleBold))),
                          ),
                        ),
                      ),
                    ),
                    ListView.builder(
                      itemCount: 10,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => 
                      CustomContainer(
                        height: height * 0.1,
                        width: width,
                        padding: EdgeInsets.only(left: width * 0.004),
                        border: BorderDirectional(bottom: BorderSide(color: Colors.grey.shade100)),
                        color: backgroundColor,
                        boxShadow: true,
                        child: Row(children: [
                        SizedBox(
                        width: width * 0.135,
                          child: Row(
                            children: [
                              Consumer<GuestManagementProvider>(
                                builder: (context, person, child) => 
                                 Checkbox(
                                   value: index == person.guestSelectedIndex ? true : false,
                                    onChanged: (value) {
                                      person.setSelectGuestIndex(value);
                                    },
                                    activeColor: Colors.cyanAccent,
                                    checkColor: Colors.white,
                                 ),
                              ),
                              sizedBox(0.0, width * 0.006),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center, 
                                children: [
                                  Text('Booking Id',style: smallTextStyle),
                                  SizedBox(width: width * 0.1,child: Text('John Smith eeetann',style: smallTextStyleBold)),
                                ],
                              ),
                            ],
                          ),
                        ),
                          Row(
                            children: List.generate(3, (index) => 
                              Container(
                              width: index == 0 || index == 1 ? width * 0.1 : width * 0.135,
                              padding: EdgeInsets.only(right: width * 0.01),
                              child: Text(index == 0 ?'Sunday 12, 02, 2024 06:33 Pm' : index == 1 ? '+91 9446085810' : 'johnsmith@gmail.com',style: smallTextStyle)),
                            ),
                          ),
                          Row(
                            children: List.generate(2, (index) => Container(
                              width: index == 1? width * 0.1 :  width * 0.085,
                              padding: EdgeInsets.only(right: index == 0? width * 0.02 : width * 0.04),
                              child: Consumer<GuestManagementProvider>(
                                builder: (context, person, child) => 
                                TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: index == 1 && person.isBooked? Colors.cyanAccent.shade400 : Colors.grey.shade300,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                  ),
                                  onPressed: person.isBooked? (){customShowDialog(context, 'title', 'This conten jnksaik jbchdiq', 'Book',GoogleFonts.montserrat(color: Colors.lightBlue));} : () {},
                                 child: Text(index  == 0 ? person.isBooked? 'Booked': 'Book' : 'Check-In',style: smallTextStyle),
                                 ),
                              ),
                              ),
                            ),
                          ),
                          Row(
                            children: List.generate(2, (index) => SizedBox(
                              width: index == 0 ?width * 0.065 : width * 0.04,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: IconButton(
                                  onPressed: (){
                                    index == 1? customShowDialog(context, 'Delete Guest', 'Would you like to Delete this guest from History', 'Delete',GoogleFonts.montserrat(color: Colors.redAccent)): null;
                                  },
                                   icon: Icon(index == 0? Icons.edit_outlined
                                    : Icons.delete_outline,
                                    color: index == 0 ? Colors.lightBlueAccent : Colors.redAccent,
                                    ),
                                  ),
                                ),
                              ),
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
    );
  }
}