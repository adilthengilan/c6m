import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/view%20model/guest_management.dart';
import 'package:flutter_application_1/src/view/desktop/New%20bookings/new_booking.dart';
import 'package:flutter_application_1/src/view/desktop/dashboard/dashboard.dart';
import 'package:flutter_application_1/src/view/desktop/widgets/custom_container.dart';
import 'package:flutter_application_1/src/view/desktop/widgets/custom_textfield.dart';
import 'package:flutter_application_1/src/view/desktop/widgets/show_dialoug.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GuestManagementScreen extends StatelessWidget {
  const GuestManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    TextEditingController controller = TextEditingController();
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
                      5,
                      (index) => Consumer<GuestManagementProvider>(
                        builder: (context, person, child) => InkWell(
                          onTap: () {
                            person.settabButtonIndex(index);
                          },
                          child: CustomContainer(
                            height: height,
                            borderRadius: BorderRadius.circular(10),
                            margin: EdgeInsets.only(
                                left: index == 0 ? width * 0.006 : 0),
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.01),
                            boxShadow: false,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                    index == 0
                                        ? 'All Guests (282)'
                                        : index == 1
                                            ? 'Pending'
                                            : index == 2
                                                ? 'Booked'
                                                : index == 3
                                                    ? "Canceled"
                                                    : 'Refund',
                                    style: index == 0
                                        ? smallTextStyleBold
                                        : smallTextStyle),
                                sizedBox(height * 0.01, 0.0),
                                CustomContainer(
                                  width: width * 0.06,
                                  height: height * 0.005,
                                  borderRadius: BorderRadius.circular(10),
                                  gradiantColors:
                                      index == person.tabButtonSelectedIndex
                                          ? [
                                              Colors.lightBlueAccent.shade200,
                                              Colors.cyanAccent.shade200
                                            ]
                                          : [
                                              Colors.transparent,
                                              Colors.transparent
                                            ],
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
                    builder: (context, person, child) => CustomTextField(
                      labelText: 'Search here',
                      controller: person.guestSearchController,
                      borderRadius: 20,
                      borderSide: BorderSide.none,
                      suffixIcon: const Icon(Icons.search, color: Colors.blue), labelTextStyle: smallTextStyle,
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
              margin: EdgeInsets.only(
                  left: width * 0.02,
                  right: width * 0.006,
                  bottom: height * 0.04),
              boxShadow: true,
              child: Column(
                children: [
                  CustomContainer(
                    boxShadow: false,
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(10)),
                    height: height * 0.06,
                    border: BorderDirectional(
                        bottom: BorderSide(color: Colors.grey.shade200)),
                    child: Row(
                      children: List.generate(
                        8,
                        (index) => Padding(
                          padding: EdgeInsets.only(
                              left: index == 0 ? width * 0.015 : 0),
                          child: SizedBox(
                              width: index == 0
                                  ? width * 0.12
                                  : index == 1
                                      ? width * 0.1
                                      : index == 2
                                          ? width * 0.1
                                          : index == 3
                                              ? width * 0.14
                                              : index == 4
                                                  ? width * 0.08
                                                  : index == 6 || index == 7
                                                      ? width * 0.06
                                                      : width * 0.1,
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                      index == 0
                                          ? 'Guests'
                                          : index == 1
                                              ? 'Date'
                                              : index == 2
                                                  ? 'Mobile No'
                                                  : index == 3
                                                      ? 'Email'
                                                      : index == 4
                                                          ? 'Book'
                                                          : index == 5
                                                              ? 'Check-In'
                                                              : index == 6
                                                                  ? 'Edit'
                                                                  : 'Delete',
                                      style: smallTextStyleBold))),
                        ),
                      ),
                    ),
                  ),
                  ListView.builder(
                    itemCount: 10,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, builderIndex) => CustomContainer(
                      height: height * 0.1,
                      width: width,
                      padding: EdgeInsets.only(left: width * 0.004),
                      border: BorderDirectional(
                          bottom: BorderSide(color: Colors.grey.shade100)),
                      color: Colors.white,
                      boxShadow: true,
                      child: Row(
                        children: [
                          SizedBox(
                            width: width * 0.135,
                            child: Row(
                              children: [
                                Consumer<GuestManagementProvider>(
                                  builder: (context, person, child) => Checkbox(
                                    value: builderIndex ==
                                            person.guestSelectedIndex
                                        ? true
                                        : false,
                                    onChanged: (value) {
                                      person.setSelectGuestIndex(value);
                                    },
                                    activeColor: Colors.cyanAccent,
                                    checkColor: Colors.white,
                                  ),
                                ),
                                sizedBox(0.0, width * 0.01),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Booking Id', style: smallTextStyle),
                                    SizedBox(
                                        width: width * 0.1,
                                        child: Text('John Smith',
                                            style: smallTextStyleBold)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: List.generate(
                              3,
                              (index) => Container(
                                  width: index == 0 || index == 1
                                      ? width * 0.1
                                      : width * 0.135,
                                  padding: EdgeInsets.only(right: width * 0.01),
                                  child: Text(
                                      index == 0
                                          ? 'Sunday 12, 02, 2024 06:33 Pm'
                                          : index == 1
                                              ? '+91 9446085810'
                                              : 'johnsmith@gmail.com',
                                      style: smallTextStyle)),
                            ),
                          ),
                          Row(
                            children: List.generate(
                              2,
                              (index) => Container(
                                width:
                                    index == 1 ? width * 0.09 : width * 0.085,
                                padding: EdgeInsets.only(
                                    right: index == 0
                                        ? width * 0.02
                                        : width * 0.025),
                                child: Consumer<GuestManagementProvider>(
                                  builder: (context, person, child) =>
                                      TextButton(
                                    style: TextButton.styleFrom(
                                      backgroundColor:
                                          index == 1 && person.isBooked
                                              ? Colors.cyanAccent.shade400
                                              : Colors.grey.shade300,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                    ),
                                    onPressed: index == 0
                                        ? () {
                                            customShowDialog(
                                                context, CheckInDialog());
                                          }
                                        : () {
                                            customShowDialog(
                                                context, CheckInDialog());
                                          },
                                    child: Text(
                                        index == 0 ? 'Book' : 'Check-In',
                                        style: smallTextStyle),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: List.generate(
                              2,
                              (index) => SizedBox(
                                width:
                                    index == 0 ? width * 0.065 : width * 0.04,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: IconButton(
                                    onPressed: index == 0
                                        ? () {
                                            showDialog(
                                                context: context,
                                                builder: (context) => _editing(
                                                    height, width, controller));
                                          }
                                        : () {
                                            showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    DeleteFileDialog());
                                          },
                                    icon: Icon(
                                      index == 0
                                          ? Icons.edit_outlined
                                          : Icons.delete_outline,
                                      color: index == 0
                                          ? Colors.lightBlueAccent
                                          : Colors.redAccent,
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

  //-----------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------
//-------------- Editing------------------------------------------------------------
  Widget _editing(height, width, controller) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Text(
        'Edit',
        style: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
      content: Container(
        height: height * 0.90,
        width: width * 0.350,
        child: Column(
          children: [
            CustomContainer(
              width: width * 0.250,
              boxShadow: false,
              child: CustomTextField(
                labelText: "",
                controller: controller, labelTextStyle: smallTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CheckInDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.width;

    final TextEditingController _namecontroller = TextEditingController();
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Container(
        height: height * 0.300,
        width: width * 0.700,
        decoration: BoxDecoration(color: Colors.white),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sizedBox(height * 0.02, width),
              Text(
                'Check-In',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20),
              _buildRow([
                _buildTextFormField('First Name', width, _namecontroller),
                _buildTextFormField('Last Name', width, _namecontroller),
              ]),
              _buildRow([
                _buildTextFormField('Mobile Number', width, _namecontroller),
                _buildTextFormField('Email', width, _namecontroller),
              ]),
              _buildRow([
                _buildTextFormField('Country', width, _namecontroller),
                _buildTextFormField('State', width, _namecontroller),
                _buildDropdownFormField(
                    'Available Rooms', ['Room 1', 'Room 2', 'Room 3']),
              ]),
              sizedBox(height * 0.05, width),
              Padding(
                padding: EdgeInsets.only(left: width * 0.22),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 170, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.cyanAccent.shade400,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextButton(
                    onPressed: () {
                      // Handle add booking
                    },
                    child: Text(
                      'Proceed',
                      style: GoogleFonts.montserrat(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRow(List<Widget> children) {
    return Row(
      children: children
          .map((child) => Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: child,
                ),
              ))
          .toList(),
    );
  }

  Widget _buildTextFormField(
      String label, double width, TextEditingController controller) {
    return CustomContainer(
      width: width * 0.250,
      boxShadow: false,
      child: CustomTextField(
        labelText: label,
        controller: controller, labelTextStyle: smallTextStyle,
      ),
    );
  }

  Widget _buildDropdownFormField(String label, List<String> items) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      ),
      items: items.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? newValue) {},
    );
  }
}

class DeleteFileDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.width;

    return AlertDialog(
      backgroundColor: Colors.white,
      title: Text(
        'Delete file permanently?',
        style: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
      content: Container(
        height: height * 0.070,
        width: width * 0.350,
        child: Column(
          children: [
            Text(
              'If you delete this file, you won\'t be able to recover it. Do you want to delete it?',
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
            sizedBox(height * 0.02, width),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: height * 0.02,
                    width: width * 0.17,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(-0.3, 1),
                              blurRadius: 2,
                              blurStyle: BlurStyle.normal,
                              spreadRadius: 0,
                              color: Color.fromARGB(255, 213, 210, 210)
                              // color: darktheme
                              //     ? Color.fromARGB(255, 165, 223, 254)
                              //     : Color.fromARGB(255, 248, 248, 248),
                              ),
                        ],
                        borderRadius: BorderRadius.circular(05)),
                    child: Center(child: Text('Delete')),
                  ),
                ),
                sizedBox(height * 0.01, width * 0.01),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: height * 0.02,
                    width: width * 0.17,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(-0.3, 1),
                              blurRadius: 2,
                              blurStyle: BlurStyle.normal,
                              spreadRadius: 0,
                              color: Color.fromARGB(255, 213, 210, 210)
                              // color: darktheme
                              //     ? Color.fromARGB(255, 165, 223, 254)
                              //     : Color.fromARGB(255, 248, 248, 248),
                              ),
                        ],
                        borderRadius: BorderRadius.circular(05)),
                    child: Center(child: Text('Cancel')),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
