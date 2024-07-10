import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tuch_trip_crms/src/view/desktop/dashboard/dashboard.dart';
import 'package:tuch_trip_crms/src/view/widgets/custom_container.dart';
import 'package:tuch_trip_crms/src/view/widgets/custom_textfield.dart';

class CheckInDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.width;

    final TextEditingController _namecontroller = TextEditingController();
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
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
                style: largeTextStyleBold
              ),
              SizedBox(height: 20),
              _buildRow([
                _buildTextFormField('First Name', width, _namecontroller),
                _buildTextFormField('Last Name', width, _namecontroller),
              ]),
              sizedBox(height * 0.03, 0.0),
              _buildRow([
                _buildTextFormField('Mobile Number', width, _namecontroller),
                _buildTextFormField('Email', width, _namecontroller),
              ]),
              sizedBox(height * 0.03, 0.0),
              _buildRow([
                _buildTextFormField('Country', width, _namecontroller),
                _buildTextFormField('State', width, _namecontroller),
                _buildDropdownFormField(
                    'Available Rooms', ['Room 1', 'Room 2', 'Room 3']),
              ]),
              sizedBox(height * 0.03, width),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: List.generate(2, (index) => 
                  Padding(
                    padding: EdgeInsets.only(left: width * 0.02),
                    child: InkWell(
                      onTap: index ==0?  () => Navigator.pop(context) : () => Navigator.pop(context),
                      child: CustomContainer(
                        height: height * 0.028,
                        width: width * 0.1,
                        boxShadow: true,
                        border: Border.all(color: Colors.cyanAccent.shade100),
                          color: index == 0? Colors.white : Colors.cyanAccent.shade400,
                          borderRadius: BorderRadius.circular(10),
                        child: Center(
                          child: Text(
                             index == 0 ? 'Cancel' : 'Proceed',
                            style: index == 0? smallTextStyleBold : smallTextStylewhiteBold
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              sizedBox(height * 0.01, width)
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
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(15),
      child: CustomTextField(
        labelText: label,
        controller: controller,
        labelTextStyle: smallTextStyle,
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

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//-----------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------
//-------------- Editing------------------------------------------------------------
  Widget editing(height, width, controller) {
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
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class DeleteFileDialog extends StatelessWidget {
  const DeleteFileDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.width;

    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      backgroundColor: Colors.white,
      title: Text(
        'Delete file permanently?',
        style: largeTextStyleBold
      ),
      content: SizedBox(
        height: height * 0.07,
        width: width * 0.350,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'If you delete this file, you won\'t be able to recover it. Do you want to delete it?',
              style: smallTextStyle
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for(int index = 0; index < 2; index ++)
                Padding(
                  padding:  EdgeInsets.only(right: index == 0? width * 0.01 : 0),
                  child: InkWell(
                    onTap: index == 0? () {
                      Navigator.pop(context);
                    }:
                    (){
                      Navigator.pop(context);
                    },
                    child: CustomContainer(
                      boxShadow: true,
                      height: height * 0.028,
                      width: width * 0.17,
                      color: index == 0? Colors.white : Colors.redAccent,
                      borderRadius: BorderRadius.circular(10),
                      child: Center(child: Text(index == 0? 'Cancel':  'Delete',style: index== 0 ? smallTextStyle : smallTextStylewhite)),
                    ),
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