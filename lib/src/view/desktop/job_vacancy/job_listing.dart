import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tuch_trip_crms/src/view%20model/dashboard_provider.dart';
import 'package:tuch_trip_crms/src/view/desktop/Guests/check_in_field.dart';
import 'package:tuch_trip_crms/src/view/desktop/dashboard/dashboard.dart';
import 'package:tuch_trip_crms/src/view/desktop/desktop_view.dart';
import 'package:tuch_trip_crms/src/view/desktop/job_vacancy/job_posting_screen.dart';
import 'package:tuch_trip_crms/src/view/widgets/custom_container.dart';
import 'package:tuch_trip_crms/src/view/widgets/show_dialoug.dart';

class JobListingScreen extends StatelessWidget {
  const JobListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final person = Provider.of<DashboardProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: const AppAppBar(pageName: false),
      body: SingleChildScrollView(
        child: Column(
          children: [
            sizedBox(height * 0.04, width),
            Row(
              children: [
                Spacer(),
                CustomContainer(
                  boxShadow: false,
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      person.jobsOffers.isNotEmpty?
                      CustomContainer(
                        height: height * 0.06,
                        boxShadow: false,
                        borderRadius: BorderRadius.circular(0),
                        border: const Border(bottom: BorderSide(color: Colors.blue)),
                        child: ElevatedButton(
                          style: TextButton.styleFrom(
                          padding: const EdgeInsets.only(left: 30, top: 20, bottom: 20,right: 20),
                          backgroundColor: Colors.white,
                          elevation: 0,
                            shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)
                          )
                        ),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const JobPostingScreen()));
                        },
                        child: Text('Post New Job',style: smallTextStyleBold),
                        ),
                      ): const SizedBox(),
                      CustomContainer(
                        height: height * 0.06,
                        boxShadow: false,
                        borderRadius: BorderRadius.circular(0),
                        border: const Border(bottom: BorderSide(color: Colors.blue)),
                        child: ElevatedButton(
                          style: TextButton.styleFrom(
                          padding: const EdgeInsets.only(right: 30, top: 20, bottom: 20,left: 20),
                          backgroundColor: Colors.white,
                          elevation: 0,
                            shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)
                            )
                          ),
                          onPressed: (){},
                          child: Text('Job Request',style: smallTextStyleBold),
                        ),
                      ),
                    ],
                  ),
                ),
                sizedBox(0.0, width * 0.04),
              ],
            ),
           sizedBox(height * 0.03, 0.0),
           CustomContainer(
              boxShadow: false,
              width: width * 0.42,
              padding: const EdgeInsets.all(10),
              child: person.jobsOffers.isNotEmpty ? 
              Consumer<DashboardProvider>(
                builder: (context, person, child) => 
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: person.jobsOffers.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: height * 0.02),
                        child: CustomContainer(
                          width: width * 0.6,
                          color: Colors.white,
                          padding: const EdgeInsets.all(20),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey.shade400),
                          boxShadow: false,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      //
                                      Text(person.jobsOffers[index]['jobName'],style: mediumTextStyleBold),
                                      //
                                      Text(person.jobsOffers[index]['hotelName'],
                                        style: GoogleFonts.montserrat(
                                        color: Colors.black,
                                        fontSize: 14,
                                        decoration: TextDecoration.underline,
                                        decorationColor: Colors.blue,
                                        ),
                                      ),
                                      //
                                      person.jobsOffers[index]['jobLocationType'] == 1 && person.jobsOffers[index]['advertiseCityYesorNo'] == 'No'?
                                      //
                                      Text("${person.jobsOffers[index]['jobArea']}, ${person.jobsOffers[index]['jobCity']}",style: smallTextStyle):
                                      //
                                      person.jobsOffers[index]['jobLocationType'] == 2 && person.jobsOffers[index]['advertiseCityYesorNo'] == 'No'?
                                      //
                                      Text('${person.jobsOffers[index]['jobPlaceAdvertiseController']}',style: smallTextStyle):
                                      //
                                      const SizedBox(),
                                      //
                                    ],
                                  ),
                                  //
                                  const Spacer(),
                                  // Waiting For the Next Updation [Edit Icon Button]
                                  //
                                  // IconButton(onPressed: () {}, icon: const Icon(Icons.edit_outlined,color: Colors.blue)),
                                  //
                                  sizedBox(0.0, width * 0.005),
                                  IconButton(
                                    onPressed: () {
                                    customShowDialog(
                                      context, 
                                    DeleteFileDialog(
                                      //
                                      heading: 'Delete Job Post?', 
                                      //
                                      messege: 'If you delete this Job, you won\'t be able to recover it. Do you want to delete it?', 
                                      //
                                      deleteTap: (){
                                        person.removeJobFromJobsList(
                                          hotelName: person.jobsOffers[index]['hotelName'], 
                                          jobName: person.jobsOffers[index]['jobName'], 
                                          numberofOpenings: person.jobsOffers[index]['numberofOpenings'], 
                                          jobLocationType: person.jobsOffers[index]['jobLocationType'], 
                                          advertiseCityYesorNo: person.jobsOffers[index]['advertiseCityYesorNo'], 
                                          jobPlaceAdvertiseController: person.jobsOffers[index]['jobPlaceAdvertiseController'], 
                                          jobCountry: person.jobsOffers[index]['jobCountry'], 
                                          jobCity: person.jobsOffers[index]['jobCity'], 
                                          jobArea: person.jobsOffers[index]['jobArea'], 
                                          jobPinCode: person.jobsOffers[index]['jobPinCode'], 
                                          jobstreetAddress: person.jobsOffers[index]['jobstreetAddress'], 
                                          jobContrectLength: person.jobsOffers[index]['jobContrectLength'], 
                                          jobContractPeriod: person.jobsOffers[index]['jobContractPeriod'], 
                                          jobAmountStatus: person.jobsOffers[index]['jobAmountStatus'], 
                                          jobRate: person.jobsOffers[index]['jobRate'], 
                                          jobTypes: person.jobsOffers[index]['jobTypes'], 
                                          jobMinimumAmount: person.jobsOffers[index]['jobMinimumAmount'], 
                                          jobMaximumAmount: person.jobsOffers[index]['jobMaximumAmount'], 
                                          jobCVStatus: person.jobsOffers[index]['jobCVStatus'], 
                                          jobDescription: person.jobsOffers[index]['jobDescription'],
                                          jobContactDetailes: person.jobsOffers[index]['jobContactDetailes'], 
                                          jobApplicationDeadlineStatus: person.jobsOffers[index]['jobApplicationDeadlineStatus'], 
                                          jobApplicationDeadLineDate: person.jobsOffers[index]['jobApplicationDeadLineDate'], 
                                          jobSkills: person.jobsOffers[index]['jobSkills'], 
                                        );
                                        Navigator.pop(context);
                                      }
                                      ),
                                    );
                                  },
                                  icon: const Icon(Icons.delete_outlined,color: Colors.pink)),
                                ],
                              ),
                              sizedBox(height * 0.015, 0.0),
                              Row(
                                children: [
                                  CustomContainer(
                                    color: Colors.deepOrange.shade50,
                                    padding: EdgeInsets.symmetric(horizontal: width * 0.005,vertical: height * 0.005),
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: false,
                                    child: person.jobsOffers[index]['jobAmountStatus'] == 'Range' ?
                                    //
                                    Text('₹${person.jobsOffers[index]['jobMinimumAmount']} - ₹${person.jobsOffers[index]['jobMaximumAmount']} ${person.jobsOffers[index]['jobRate']}',style: smallTextStyle) :
                                    //
                                    Text('${person.jobsOffers[index]['jobMaximumAmount']} ${person.jobRate}')
                                    //
                                  ),
                                  sizedBox(0.0, width * 0.005),
                                  Expanded(
                                  child: Wrap(
                                  spacing: 4.0,
                                  runSpacing: 8.0,
                                  children: List<Widget>.generate(
                                  person.jobsOffers[index]['jobTypes'].length == 1 ? person.jobsOffers[index]['jobTypes'].length : person.jobsOffers[index]['jobTypes'].take(2).length,(int i) {
                                    return CustomContainer(
                                      color: Colors.blueGrey.shade50,
                                      padding: EdgeInsets.symmetric(horizontal: width * 0.005, vertical: height * 0.005),
                                      borderRadius: BorderRadius.circular(5),
                                      boxShadow: false,
                                      child: Text(person.jobsOffers[index]['jobTypes'][i], style: smallTextStyle),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        sizedBox(height * 0.02, 0.0),
                          //
                        Text('Easily Apply',
                          style: GoogleFonts.montserrat(
                          color: Colors.blue,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          ),
                        ),
                        sizedBox(height * 0.02, 0.0),
                        //
                        Text(person.jobsOffers[index]['jobDescription'],style: smallTextStyle),
                        //
                        sizedBox(height * 0.02, 0.0),
                        ],
                      ),
                    ),
                  );
                }
              ),
              ):
              Padding(
                padding: EdgeInsets.only(top: height * 0.25),
                child: Center(
                  child: CustomContainer(
                    height: height * 0.06,
                    width: width * 0.1,
                    boxShadow: false,
                    child: ElevatedButton(
                      style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                      backgroundColor: Colors.white,
                      elevation: 0,
                      side: const BorderSide(color: Colors.blue),
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                      )
                    ),
                    onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const JobPostingScreen()));
                    },
                    child: Text('Post a New Job',style: smallTextStyleBold),
                    ),
                  ),
                ),
              ),
            ),
            sizedBox(height * 0.06, width),
          ],
        ),
      ),
    );
  }
}