import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tuch_trip_crms/src/view%20model/dashboard_provider.dart';
import 'package:tuch_trip_crms/src/view/desktop/dashboard/dashboard.dart';
import 'package:tuch_trip_crms/src/view/desktop/desktop_view.dart';
import 'package:tuch_trip_crms/src/view/widgets/custom_container.dart';
import 'package:tuch_trip_crms/src/view/widgets/custom_textfield.dart';
import 'package:tuch_trip_crms/src/view/widgets/show_dialoug.dart';

class JobVacancy extends StatelessWidget {
  const JobVacancy({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final jobVacancy = Provider.of<DashboardProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppAppBar(pageName: false),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: width * 0.45,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sizedBox(height * 0.1, width),
                CustomContainer(
                  boxShadow: true,
                  height: height * 0.22,
                  width: width,
                  gradiantColors: [
                    Colors.lightBlueAccent.shade100,
                    const Color.fromARGB(255, 193, 235, 255)
                  ],
                  borderRadius: BorderRadius.circular(15),
                  child: Center(
                    child: Text(
                      'Post Job Openings',
                      style: GoogleFonts.montserrat(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                ),
                sizedBox(height * 0.06, width),
                const Divider(),
                sizedBox(height * 0.06, width),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                  child: Text('Hotel or Apartment Name*', style: smallTextStyleBold),
                ),
                sizedBox(height * 0.005, width),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                  child: textFormField(controller: jobVacancy.jobNameController, labelText: 'Enter Your Hotel Name'),
                ),
                sizedBox(height * 0.04, width),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                  child: Text('Job Title*', style: smallTextStyleBold),
                ),
                sizedBox(height * 0.005, width),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                  child: textFormField(controller: jobVacancy.jobNameController, labelText: 'Enter Job Name'),
                ),
                sizedBox(height * 0.04, width),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                  child: Text('Number of people you wish to hire for this job *', style: smallTextStyleBold),
                ),
                sizedBox(height * 0.005, width),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                  child: textFormField(
                    controller: jobVacancy.numberofOpenings,
                    labelText: 'Enter Number of Openings',
                    ),
                ),
                sizedBox(height * 0.06, width),
                const Divider(),
                sizedBox(height * 0.06, width),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                  child: Text('Job posting location', style: largeTextStyleBold),
                ),
                sizedBox(height * 0.06, width),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                  child: Text("Which option best describes this job's location? *", style: smallTextStyleBold),
                ),
                sizedBox(height * 0.005, width),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                  child: Consumer<DashboardProvider>(
                    builder: (context, person, child) =>
                        DropdownButtonFormField<String>(
                      dropdownColor: Colors.white,
                      value: person.jobLocationType,
                      borderRadius: BorderRadius.circular(8),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                      ),
                      items: const [
                        DropdownMenuItem(
                          value: 'On-Site',
                          child: Text('On-Site'),
                        ),
                        DropdownMenuItem(
                          value: 'Remote',
                          child: Text('Remote'),
                        ),
                      ],
                      onChanged: (value) {
                        person.setlocationType(value);
                      },
                    ),
                  ),
                ),
                sizedBox(height * 0.04, width),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                  child: Text('City', style: smallTextStyleBold),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                  child: textFormField(controller: jobVacancy.jobCity, labelText: ''),
                ),
                sizedBox(height * 0.04, width),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: width * 0.21,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Area', style: smallTextStyleBold),
                              textFormField(controller: jobVacancy.jobArea, labelText: ''),
                            ],
                          )),
                      SizedBox(
                        width: width * 0.21,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('PinCode', style: smallTextStyleBold),
                            textFormField(controller: jobVacancy.jobArea, labelText: ''),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                sizedBox(height * 0.04, width),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                  child: Text('Street Address', style: smallTextStyleBold),
                ),
                sizedBox(height * 0.005, width),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                  child: textFormField(controller: jobVacancy.jobstreetAddress, labelText: ''),
                ),
                sizedBox(height * 0.04, width),
                const Divider(),
                sizedBox(height * 0.04, width),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                  child: Text('Job Type*', style: smallTextStyleBold),
                ),
                sizedBox(height * 0.02, width),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                  child: Wrap(
                    spacing: 8.0,
                    runSpacing: 10,
                    children: [
                      "Full-time",
                      "Permanent",
                      "Fresher",
                      "Part-time",
                      "Internship",
                      "Temporary",
                    ].map((type) {
                      return Consumer<DashboardProvider>(
                        builder: (context, person, child) => InkWell(
                          onTap: () {
                            person.setJobTypesFromTheWrap(type);
                          },
                          child: CustomContainer(
                            width: width * 0.095,
                            boxShadow: false,
                            color: person.jobTypesList.contains(type)
                                ? Colors.lightBlueAccent
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.grey.shade400),
                            padding: EdgeInsets.symmetric(
                              horizontal: width * 0.01,
                              vertical: height * 0.01,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                    person.jobTypesList.contains(type)
                                        ? Icons.check
                                        : Icons.add,
                                    color: person.jobTypesList.contains(type)
                                        ? Colors.white
                                        : Colors.grey.shade600),
                                sizedBox(0.0, width * 0.003),
                                Text(type,
                                    style: person.jobTypesList.contains(type)
                                        ? smallTextStylewhite
                                        : smallTextStyle),
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                sizedBox(height * 0.04, width),
                Consumer<DashboardProvider>(
                  builder: (context, person, child) =>
                  person.jobTypesList.contains("Temporary") || person.jobTypesList.contains("Internship") ?
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('How long is the contract?',style: smallTextStyleBold),
                        sizedBox(height * 0.02, 0.0),
                        Row(
                          children: [
                            SizedBox(
                              width: width * 0.1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Length',style: smallTextStyle),
                                  textFormField(controller: person.jobContrectLength, labelText: ''),
                                ],
                              ),
                            ),
                            sizedBox(0.0, width * 0.01),
                            SizedBox(
                              width: width * 0.1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Period',style: smallTextStyle),
                                  dropDownTextFormField(
                                    person.jobContractPeriod,
                                     [
                                      const DropdownMenuItem(
                                      value: 'Day(s)',
                                      child: Text('Day(s)'),
                                    ),
                                      const DropdownMenuItem(
                                      value: 'Week(s)',
                                      child: Text('Week(s)'),
                                    ),
                                      const DropdownMenuItem(
                                      value: 'Month(s)',
                                      child: Text('Month(s)'),
                                    ),
                                     ],
                                      (value) {
                                        person.setJobContractPeriod(value);
                                    },
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ): const SizedBox(),
                ),
                sizedBox(height * 0.04, width),
                const Divider(),
                sizedBox(height * 0.04, width),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                  child: Text('Pay*', style: smallTextStyleBold),
                ),
                sizedBox(height * 0.01, width),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                  child: SizedBox(
                    width: width * 0.4,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Review the pay we estimated for your job and adjust it as needed. Check your local minimum wage.',
                            style: smallTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                ///////////////////////////////////////////////////////// Employ Payment Detailes /////////////////////////////////////////////////////////
                sizedBox(height * 0.04, width),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                  child: const Text("Show Pay By"),
                ),
                sizedBox(height * 0.005, 0.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                  child: SizedBox(
                    width: width * 0.2,
                    child: dropDownTextFormField(
                      jobVacancy.jobAmountStatus,
                      [
                        const DropdownMenuItem(
                          value: 'Range',
                          child: Text('Range'),
                        ),
                        const DropdownMenuItem(
                          value: 'Starting amount',
                          child: Text('Starting Amount'),
                        ),
                        const DropdownMenuItem(
                          value: 'Maximum amount',
                          child: Text('Maximum amount'),
                        ),
                        const DropdownMenuItem(
                          value: 'Exact amount',
                          child: Text('Exact amount'),
                        ),
                      ],
                      (value) {
                        jobVacancy.setAmountStatus(value);
                      },
                    ),
                  ),
                ),
                sizedBox(height * 0.03, width),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                  child: Consumer<DashboardProvider>(
                    builder: (context, person, child) =>
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        jobVacancy.jobAmountStatus == 'Range'?
                        SizedBox(
                          width: width * 0.14,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Minimum', style: smallTextStyle),
                              sizedBox(height * 0.006, 0.0),
                              textFormField(controller: jobVacancy.jobMinimumAmount, labelText: ''),
                            ],
                          ),
                        ): const SizedBox(),
                        sizedBox(0.0,jobVacancy.jobAmountStatus == 'Range'? width * 0.005 : 0),
                        jobVacancy.jobAmountStatus == 'Range'? Padding(
                          padding: EdgeInsets.only(top: height * 0.013),
                          child: Text('to', style: GoogleFonts.montserrat(fontSize: 18)),
                        ): const SizedBox(),
                        sizedBox(0.0, width * 0.005),
                        SizedBox(
                          width: width * 0.14,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(jobVacancy.jobAmountStatus != 'Range'? 'Ammount' : 'Maximum', style: smallTextStyle),
                              sizedBox(height * 0.006, 0.0),
                              textFormField(controller: jobVacancy.jobMaximumAmount, labelText:''),
                            ],
                          ),
                        ),
                        sizedBox(0.0, width * 0.01),
                        Expanded(
                          child: SizedBox(
                            width: width * 0.1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Rate', style: smallTextStyle),
                                sizedBox(height * 0.006, 0.0),
                                dropDownTextFormField(
                                  jobVacancy.jobRate,
                                  [
                                    const DropdownMenuItem(
                                      value: 'Per Hour',
                                      child: Text('Per Hour'),
                                    ),
                                    const DropdownMenuItem(
                                      value: 'Per Day',
                                      child: Text('Per Day'),
                                    ),
                                    const DropdownMenuItem(
                                      value: 'Per Week',
                                      child: Text('Per Week'),
                                    ),
                                    const DropdownMenuItem(
                                      value: 'Per Month',
                                      child: Text('Per Month'),
                                    ),
                                    const DropdownMenuItem(
                                      value: 'Per Year',
                                      child: Text('Per Year'),
                                    ),
                                  ],
                                  (value) {
                                    jobVacancy.setJobRate(value);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: jobVacancy.jobAmountStatus == 'Range'? 0: width * 0.15)
                      ],
                    ),
                  ),
                ),
                sizedBox(height * 0.06, width),
                ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                ////////////////////////////////////////////// Job Description ////////////////////////////////////////////////////////////
                ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                  child: Text('Job description *', style: smallTextStyleBold),
                ),
                sizedBox(height * 0.01, width),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                  child: Column(
                    children: [
                      CustomContainer(
                        boxShadow: false,
                        height: height * 0.055,
                        width: width,
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                        border: Border(
                          top: BorderSide(color: Colors.grey.shade400),
                          left: BorderSide(color: Colors.grey.shade400),
                          right: BorderSide(color: Colors.grey.shade400),
                        ),
                        child: Row(children: [
                          const Spacer(),
                          //Description Clear Blue Text Button
                          TextButton(
                          onPressed: (){
                            jobVacancy.jobDescriptionController.clear();
                          },
                          child: Text("Clear",
                          style: GoogleFonts.montserrat(
                            color: Colors.blue,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            ),
                          ),
                        )
                      ],
                      ),
                    ),
                    // Description Text Field
                      CustomContainer(
                        height: height * 0.42,
                        width: width,
                        boxShadow: false,
                        border: Border(
                          bottom: BorderSide(color: Colors.grey.shade400),
                          left: BorderSide(color: Colors.grey.shade400),
                          right: BorderSide(color: Colors.grey.shade400),
                        ),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                          topRight: Radius.circular(-5),
                          topLeft: Radius.circular(-5),
                        ),
                        child: TextField(
                          controller: jobVacancy.jobDescriptionController,
                          textAlignVertical: TextAlignVertical.top,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade400)),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade400)),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade400)),
                          ),
                          minLines: null,
                          maxLines: null,
                          expands: true,
                        ),
                      ),
                    ],
                  ),
                ),
                sizedBox(height * 0.1, width),
                const Divider(),
                sizedBox(height * 0.06, width),
                //job Required Skills
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                  child: Text('Key qualifications for your role',style: mediumTextStyleBold),
                ),
                sizedBox(height * 0.02, width),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                  child: Text('Find the best candidates by telling us which qualifications are a must have.',style: smallTextStyleBold),
                ),
                sizedBox(height * 0.01, width),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: width * 0.01),
                  child: Text('Let us know how important they are so that we can reach the right jobseekers.',style: smallTextStyle),
                ),
                sizedBox(height * 0.04, width),
                Consumer<DashboardProvider>(
                  builder: (context, person, child) =>
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: person.jobSkillsList.length,
                    padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                    itemBuilder: (context, index) =>
                    Padding(
                      padding: EdgeInsets.only(bottom: height * 0.02),
                      child: CustomContainer(
                        boxShadow: false,
                        width: width,
                        padding: EdgeInsets.symmetric(horizontal: width * 0.02,vertical: height *0.02),
                        border: Border.all(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${person.jobSkillsList[index]['Skills']}',style: smallTextStyleBold),
                                Text('${person.jobSkillsList[index]['essentialStatus']}',style: smallTextStyle),
                              ],
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: SizedBox(
                              height: height * 0.06,
                              child: Center(
                                child: IconButton.outlined(
                                  onPressed: (){
                                    jobVacancy.removeSkillsFromSkillsList(index);
                                  },
                                  icon: const Icon(Icons.remove),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                sizedBox(height * 0.03, 0.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                  child: CustomContainer(
                    boxShadow: false,
                    border: Border.all(color: Colors.deepPurple),
                    borderRadius: BorderRadius.circular(10),
                    child: TextButton.icon(
                    label: Text('Add Skills',style: smallTextStyleBold),
                    icon: const Icon(Icons.add),
                    onPressed: (){
                      addKeySkilsShowDialogue(context, width, height);
                      },
                    ),
                  ),
                ),
                sizedBox(height * 0.06, width),
                const Divider(),
                sizedBox(height * 0.06, width),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                  child: Text('Communication preferences', style: mediumTextStyleBold),
                ),
                sizedBox(height * 0.06, width),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                  child: Text('Contact Detailes *', style: smallTextStyleBold),
                ),
                sizedBox(height * 0.01, width),
                Consumer<DashboardProvider>(
                  builder: (context, person, child) => ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                    itemCount: person.jobContactDetailes.length,
                    itemBuilder: (context, index) => index != 0
                        ? Padding(
                            padding: EdgeInsets.only(bottom: height * 0.015),
                            child: Row(
                              children: [
                                SizedBox(
                                    width: width * 0.39,
                                    child: textFormField(
                                      controller: person.jobContactDetailes[index],
                                      labelText: '',
                                    ),
                                  ),
                                sizedBox(0.0, width * 0.005),
                                Expanded(
                                  child: Center(
                                    child: IconButton.outlined(
                                      onPressed: () {
                                        person.removeEmail(index);
                                      },
                                      icon: const Icon(Icons.remove, size: 25),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Padding(
                            padding: EdgeInsets.only(bottom: height * 0.015),
                            child: textFormField(controller: person.jobContactDetailes[0],labelText: ''),
                          ),
                  ),
                ),
                sizedBox(height * 0.02, width),
                Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                child: CustomContainer(
                boxShadow: false,
                border: Border.all(color: Colors.deepPurple),
                borderRadius: BorderRadius.circular(10),
                child: TextButton.icon(
                label: Text('Add Other Contact Detailes',style: smallTextStyleBold),
                icon: const Icon(Icons.add),
                onPressed: (){
                  jobVacancy.addContactDetailes();
                  }
                ),
              ),
            ),
                sizedBox(height * 0.04, width),
                const Divider(),
                sizedBox(height * 0.04, width),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                  child: Text('Application preferences', style: mediumTextStyleBold),
                ),
                sizedBox(height * 0.04, width),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                  child: Text('Ask potential candidates for a CV?',
                      style: smallTextStyleBold),
                ),
                sizedBox(height * 0.005, 0.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                  child: dropDownTextFormField(jobVacancy.jobCVStatus, [
                    const DropdownMenuItem(
                      value: 'Yes, require a Cv',
                      child: Text('Yes, Require a Cv'),
                    ),
                    const DropdownMenuItem(
                      value: "don't ask for a Cv",
                      child: Text("don't ask for a Cv"),
                    ),
                  ], (value) {
                    jobVacancy.setjobCvOption(value);
                  }),
                ),
                sizedBox(height * 0.06, width),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                  child: Text('Is there an application deadline?',
                      style: smallTextStyleBold),
                ),
                sizedBox(height * 0.01, width),
                for(int index = 0; index < 2; index ++)
                Consumer<DashboardProvider>(
                  builder: (context, person, child) =>
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomContainer(
                          boxShadow: false,
                          height: height * 0.064,
                          width: width,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey.shade400),
                          child: RadioListTile<bool>(
                            activeColor: Colors.black,
                            title: index == 1? const Text('Yes') : const Text('No'),
                            value: index == 1? true : false,
                            groupValue: person.isjobApplicationDeadline,
                            onChanged: (bool? value) {
                              person.setjobApplicationDeadLineYesOrNo(value);
                            },
                          ),
                        ),
                        sizedBox(height * 0.01, 0.0),
                        index == 1 && person.isjobApplicationDeadline ?
                        SizedBox(
                          height: height * 0.048,
                          width: width * 0.14,
                          child: textFormField(
                            controller: person.jobApplicationDeadLineDate,
                            labelText: 'DD/MM/YYYY',
                            sufixIcon: IconButton(onPressed: (){
                              person.jobApplicationDeadLineDate.clear();
                            }, icon:  Icon(Icons.clear,color: Colors.grey.shade400))
                          ),
                        ): const SizedBox()
                      ],
                    ),
                  ),
                ),
                sizedBox(height * 0.06, 0.0),
                //////////////////////////////////////////// Submit Button ////////////////////////////////////////////////////
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: CustomContainer(
                      boxShadow: true,
                      width: width * 0.15,
                      height: height * 0.06,
                      borderRadius: BorderRadius.circular(8),
                      gradiantColors: [
                        Colors.lightBlueAccent.shade100,
                        const Color.fromARGB(255, 255, 162, 240),
                        const Color.fromARGB(255, 255, 255, 188)
                      ],
                      child: TextButton(
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {},
                        child: Text('Continue', style: smallTextStylewhite),
                      ),
                    ),
                  ),
                ),
                sizedBox(height * 0.1, width)
              ],
            ),
          ),
        ),
      ),
    );
  }

void addKeySkilsShowDialogue(BuildContext context, double width, double height) {
  final jobVacancy = Provider.of<DashboardProvider>(context, listen: false);
  return customShowDialog(
      context,
      AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        contentPadding: EdgeInsets.zero,
        content: CustomContainer(
          boxShadow: false,
          width: width * 0.4,
          padding: EdgeInsets.all(height * 0.02),
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Text('Key qualifications for your role',style: mediumTextStyleBold),
                  const Spacer(),
                  CustomContainer(
                    boxShadow: false,
                    padding: const EdgeInsets.all(2),
                    boxShape: BoxShape.circle,
                    border: Border.all(color: Colors.grey.shade500),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.clear, color: Colors.grey.shade500),
                    ),
                  ),
                ],
              ),
              Divider(color: Colors.grey.shade300),
              sizedBox(height * 0.03, 0.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                child: textFormField(
                  controller: jobVacancy.skillController,
                  labelText: 'Add Key Skills',
                ),
              ),
              sizedBox(height * 0.04, width),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                child: Text('Select whether this skill is a must-have or nice-to-have.',style: smallTextStyleBold),
              ),
              sizedBox(height * 0.02, width),
              Container(
                width: width,
                margin: EdgeInsets.only(left: width * 0.01),
                child: Consumer<DashboardProvider>(
                  builder: (context, person, child) => Column(
                    children: [
                      CustomContainer(
                        boxShadow: person.essentialstatus == 'Required',
                        margin: EdgeInsets.only(right: width * 0.22),
                        border: Border.all(color: Colors.grey.shade300),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        child: Row(
                          children: [
                            Expanded(
                              child: RadioListTile<String>(
                                activeColor: Colors.black,
                                title: const Text('Must-have'),
                                value: 'Required',
                                groupValue: person.essentialstatus,
                                onChanged: (String? value) {
                                  person.setIsRequiredorNot(value);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      sizedBox(height * 0.02, 0.0),
                      CustomContainer(
                        boxShadow: person.essentialstatus == 'Preferred',
                        margin: EdgeInsets.only(right: width * 0.22),
                        border: Border.all(color: Colors.grey.shade300),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        child: Row(
                          children: [
                            Expanded(
                              child: RadioListTile<String>(
                                activeColor: Colors.black,
                                title: const Text('Nice-to-have'),
                                value: 'Preferred',
                                groupValue: person.essentialstatus,
                                onChanged: (String? value) {
                                  person.setIsRequiredorNot(value);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              sizedBox(height * 0.04, width),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: List.generate(2, (index) =>
              CustomContainer(
                boxShadow: false,
                margin: EdgeInsets.only(left: width * 0.015),
                border: index == 0? Border.all(color: Colors.blue) : null,
                borderRadius: BorderRadius.circular(10),
                gradiantColors: index == 1? [
                  Colors.lightBlueAccent.shade200,
                  const Color.fromARGB(255, 147, 223, 255),
                ]: [
                  Colors.white,
                  Colors.white,
                ],
                height: height * 0.055,
                width: width * 0.07,
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
              onPressed: index == 0? (){
                  Navigator.pop(context);
                }: (){
                  jobVacancy.addSkilltoSkillsList(jobVacancy.skillController.text, jobVacancy.essentialstatus,context);
                },
                 child: Text(index == 0? 'Cancrl' : 'Add',
                 style: index == 0? smallTextStyle : smallTextStylewhiteBold
              ),
              ),
              )
              ),
              ),
              ),
              sizedBox(height * 0.03, width),
            ],
          ),
        ),
      ),
    );
}

Widget textFormField({required TextEditingController controller,required String labelText,Widget? sufixIcon}) {
  return CustomTextField(
    controller: controller,
    labelText: labelText,
    suffixIcon: sufixIcon,
    borderRadius: 8,
    borderSide: BorderSide(color: Colors.grey.shade400),
    enabledBorder: BorderSide(color: Colors.grey.shade400),
  );
}

Widget dropDownTextFormField(value, items, void Function(String?)? onChanges) {
  return DropdownButtonFormField<String>(
    dropdownColor: Colors.white,
    value: value,
    borderRadius: BorderRadius.circular(8),
    decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade400),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade400),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade400),
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      ),
    ),
    items: items,
    onChanged: onChanges,
  );
}
}