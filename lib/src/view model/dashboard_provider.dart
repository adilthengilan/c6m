import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tuch_trip_crms/src/view/desktop/job_vacancy/job_listing.dart';
import 'package:tuch_trip_crms/src/view/widgets/toast_message.dart';

class DashboardProvider extends ChangeNotifier {
  
// Index of the selected navigation button
  int navigationButtonsSelectedIndex = 0;

  // Currently selected profile drop-down value
  var selectedProfileDropDown;

  /// Sets the selected button index and notifies listeners.
  /// 
  /// Parameters:
  /// - `index`: The index of the selected button.
  void setSelectedButtonIndex(index) {
    navigationButtonsSelectedIndex = index;
    notifyListeners();
  }

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////// Job Vacancy Provider ///////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// List to hold job offers
List<Map<String, dynamic>> jobsOffers = [
{
'hotelName': 'Baithans Hotel Group', 
'jobName': 'Manager', 
'numberofOpenings': 1, 
'jobLocationType': 2, 
'advertiseCityYesorNo': 'No', 
'jobPlaceAdvertiseController': '',
'jobCountry': '', 
'jobCity': '', 
'jobArea': '',
'jobPinCode': '', 
'jobstreetAddress': '', 
'jobContrectLength': '', 
'jobContractPeriod': 'Week(s)', 
'jobAmountStatus': 'Range', 
'jobRate': 'Per Month', 
'jobTypes': ['Full-time', 'Permanent', 'Fresher'], 
'jobMinimumAmount': '10,000,000', 
'jobMaximumAmount': '13,500,000', 
'jobCVStatus': 'Yes, require a Cv', 
'jobDescription': 
'1. Samsung Galaxy S24 Ultra Best Gaming Phone ...\n'
'2. Asus ROG Phone 8 Best iPhone Alternative for Gaming ...\n'
'3. iPhone 15 Pro Best iPhone for Gaming iPhone 15 Pro ...\n'
'4. iPhone SE (2022) Best Budget iPhone for Gaming iPhone SE (2022) ...\n'
'5. OnePlus 12 Best Everyday Phone for Mobile Gaming ...\n'
'6. Sony Xperia 5 IV Best Ultrawide Gaming Phone ...\n'
'7. Samsung Galaxy Z Fold 5 ...', 
'jobContactDetailes': ['naheeljnaheel@gmail.com, 9446085810'], 
'jobApplicationDeadlineStatus': false, 
'jobApplicationDeadLineDate': '', 
'jobSkills': [{'Skills': 'Problem Solving Skill', 'essentialStatus': 'Required'}, {'Skills': 'Communication' , 'essentialStatus': 'Required'}],
},
{
'hotelName': 'Baithans' 'Hotel' 'Group', 
'jobName': 'Manager', 
'numberofOpenings': 1, 
'jobLocationType': 2, 
'advertiseCityYesorNo': 'No', 
'jobPlaceAdvertiseController': '',
'jobCountry': '', 
'jobCity': '', 
'jobArea': '',
'jobPinCode': '', 
'jobstreetAddress': '', 
'jobContrectLength': '', 
'jobContractPeriod': 'Week(s)', 
'jobAmountStatus': 'Range', 
'jobRate': 'Per Month', 
'jobTypes': ['Full-time', 'Permanent', 'Fresher'], 
'jobMinimumAmount': '10,000,000', 
'jobMaximumAmount': '13,500,000', 
'jobCVStatus': 'Yes, require a Cv', 
'jobDescription': 
'1. Samsung Galaxy S24 Ultra Best Gaming Phone ...\n'
'2. Asus ROG Phone 8 Best iPhone Alternative for Gaming ...\n'
'3. iPhone 15 Pro Best iPhone for Gaming iPhone 15 Pro ...\n'
'4. iPhone SE (2022) Best Budget iPhone for Gaming iPhone SE (2022) ...\n'
'5. OnePlus 12 Best Everyday Phone for Mobile Gaming ...\n'
'6. Sony Xperia 5 IV Best Ultrawide Gaming Phone ...\n'
'7. Samsung Galaxy Z Fold 5 ...', 
'jobContactDetailes': ['naheeljnaheel@gmail.com, 9446085810'], 
'jobApplicationDeadlineStatus': false, 
'jobApplicationDeadLineDate': '', 
'jobSkills': [{'Skills': 'Problem Solving Skill', 'essentialStatus': 'Required'}, {'Skills': 'Communication' , 'essentialStatus': 'Required'}],
},
];

// Controllers for various text fields used in job creation
TextEditingController companyNameController = TextEditingController(); // Controller for company name
TextEditingController jobNameController = TextEditingController(); // Controller for job name
TextEditingController numberofOpenings = TextEditingController(); // Controller for number of openings
TextEditingController jobPlaceAdvertiseController = TextEditingController(); // Controller for job place advertise
TextEditingController jobCountry = TextEditingController(); // Controller for job country
TextEditingController jobCity = TextEditingController(); // Controller for job city
TextEditingController jobArea = TextEditingController(); // Controller for job area
TextEditingController jobPinCode = TextEditingController(); // Controller for job pin code
TextEditingController jobstreetAddress = TextEditingController(); // Controller for job street address
TextEditingController jobContrectLength = TextEditingController(); // Controller for job contract length
TextEditingController jobMinimumAmount = TextEditingController(); // Controller for job minimum amount
TextEditingController jobMaximumAmount = TextEditingController(); // Controller for job maximum amount
TextEditingController jobDescriptionController = TextEditingController(); // Controller for job description
TextEditingController jobApplicationDeadLineDate = TextEditingController(); // Controller for job application deadline date
TextEditingController skillController = TextEditingController(); // Controller for skill input

// Integer to represent the type of job location
int jobLocationType = 1; // Default value, possibly indicating 'On-Site'

// String to determine if the job is advertised in a city
String advertiseCityYesorNo = 'No'; // Possible values: 'Yes' or 'No'

// List of job types (e.g., Full Time, Part Time)
List<String> jobTypesList = [];

// String to represent the period of the job contract
String jobContractPeriod = 'Week(s)'; // Default value, could be 'Month(s)', 'Year(s)', etc.

// String to represent the status of the job amount (e.g., Range, Fixed)
String jobAmountStatus = 'Range'; // Default value is 'Range'

// String to represent the rate of the job amount (e.g., Per Year, Per Month)
String jobRate = 'Per Year'; // Default value is 'Per Year'

// Boolean to represent if a CV is required for the job
String jobCVStatus = 'Yes, require a Cv'; // Default value, could be 'No'

// Boolean to represent if there's a deadline for the job application
bool jobApplicationDeadlineStatus = false; // Default value, false meaning no deadline

// List of controllers for job contact details
List<TextEditingController> jobContactDetailes = [TextEditingController()]; // Starts with one controller

// String to represent the status of whether the job is essential or not
String skillEessentialstatus = 'Required'; // Default value, could be 'Optional', 'Not Required', etc.

// List to hold job skills
List jobSkillsList = []; // Initially empty, will hold skills related to the job


/// Sets the job location type and notifies listeners.
/// 
/// Updates the jobLocationType variable with the given value and calls notifyListeners() 
/// to update any listeners about the change.
/// 
/// Parameters:
/// - `value`: The new job location type value to be set.
void setlocationType(value) {
  // Update the jobLocationType variable with the new value
  jobLocationType = value;

  // Notify listeners about the change
  notifyListeners();
}


/// Sets the advertise city status and notifies listeners.
/// 
/// Updates the advertiseCityYesorNo variable with the given value and calls notifyListeners() 
/// to update any listeners about the change.
/// 
/// Parameters:
/// - `value`: The new advertise city status value to be set.
void setAdvertiseCity(value) {
  // Update the advertiseCityYesorNo variable with the new value
  advertiseCityYesorNo = value;

  // Notify listeners about the change
  notifyListeners();
}
 

/// Adds or removes job types from the jobTypesList and notifies listeners.
/// 
/// If the job type already exists in the list, it is removed. Otherwise, it is added to the list.
/// This function then calls notifyListeners() to update any listeners about the change.
/// 
/// Parameters:
/// - `value`: The job type to be added or removed from the list.
void setJobTypesFromTheWrap(value) {
  // Check if the job type is already in the list
  if (jobTypesList.contains(value)) {
    // Remove the job type from the list
    jobTypesList.remove(value);
    // print(jobTypesList);
  } else {
    // Add the job type to the list
    jobTypesList.add(value);
    // print(jobTypesList);
  }

  // Uncomment the line below to print the current jobTypesList for debugging
  // print(jobTypesList);

  // Notify listeners about the change
  notifyListeners();
}


/// Sets the job amount status and notifies listeners.
/// 
/// Updates the jobAmountStatus variable with the given value and calls notifyListeners() 
/// to update any listeners about the change.
/// 
/// Parameters:
/// - `value`: The new job amount status value to be set.
void setAmountStatus(value) {
  // Update the jobAmountStatus variable with the new value
  jobAmountStatus = value;

  // Uncomment the line below to print the current jobAmountStatus for debugging
  // print(jobAmountStatus);

  // Notify listeners about the change
  notifyListeners();
}


/// Sets the job rate and notifies listeners.
/// 
/// Updates the jobRate variable with the given value and calls notifyListeners() 
/// to update any listeners about the change.
/// 
/// Parameters:
/// - `value`: The new job rate value to be set.
void setJobRate(value) {
  // Update the jobRate variable with the new value
  jobRate = value;

  // Notify listeners about the change
  notifyListeners();
}
  

/// Adds a new contact detail TextEditingController to the jobContactDetailes list and notifies listeners.
/// 
/// This function creates a new TextEditingController, adds it to the jobContactDetailes list, 
/// and then calls notifyListeners() to update any listeners about the change.
void addContactDetailes() {
  // Add a new TextEditingController to the jobContactDetailes list
  jobContactDetailes.add(TextEditingController());
  
  // Uncomment the line below to print the current length of jobContactDetailes for debugging
  // print(jobContactDetailes.length);
  
  // Notify listeners about the change
  notifyListeners();
}


/// Removes a contact detail TextEditingController from the jobContactDetailes list at the specified index and notifies listeners.
/// 
/// If there is more than one contact detail in the list, the function removes the contact detail at the given index. 
/// It calls notifyListeners() to update any listeners about the change.
/// 
/// Parameters:
/// - `index`: The index of the contact detail to be removed.
void removeContactDetailes(int index) {
  // Check if there is more than one contact detail in the list
  if (jobContactDetailes.length > 1) {
    // Remove the contact detail at the specified index
    jobContactDetailes.removeAt(index);
  } else {
    // Uncomment the line below to print a message indicating the list is empty
    // print('Contact Detailes is Empty');
  }

  // Notify listeners about the change
  notifyListeners();
}


/// Sets the job CV status and notifies listeners.
/// 
/// Updates the jobCVStatus variable with the given value and calls notifyListeners() 
/// to update any listeners about the change.
/// 
/// Parameters:
/// - `value`: The new job CV status value to be set.
void setjobCvOption(value) {
  // Update the jobCVStatus variable with the new value
  jobCVStatus = value;

  // Notify listeners about the change
  notifyListeners();
}


/// Sets the job application deadline status and notifies listeners.
/// 
/// Updates the jobApplicationDeadlineStatus variable with the given value and calls notifyListeners() 
/// to update any listeners about the change.
/// 
/// Parameters:
/// - `value`: The new job application deadline status value to be set.
void setjobApplicationDeadLineYesOrNo(value) {
  // Update the jobApplicationDeadlineStatus variable with the new value
  jobApplicationDeadlineStatus = value;

  // Notify listeners about the change
  notifyListeners();
}


/// Sets the job contract period and notifies listeners.
/// 
/// Updates the jobContractPeriod variable with the given value and calls notifyListeners() 
/// to update any listeners about the change.
/// 
/// Parameters:
/// - `value`: The new job contract period value to be set.
void setJobContractPeriod(value) {
  // Update the jobContractPeriod variable with the new value
  jobContractPeriod = value;

  // Notify listeners about the change
  notifyListeners();
}


/// Adds a skill to the jobSkillsList and pops the dialog if the skill is added successfully.
/// 
/// If the value is empty, a toast message is shown. If the skill already exists in the list,
/// the function prints a message indicating the skill is already added. Otherwise, it adds 
/// the skill to the list, clears the text field, and closes the dialog.
/// 
/// Parameters:
/// - `value`: The skill to be added.
/// - `essentialStatus`: The essential status of the skill.
/// - `context`: The BuildContext used to pop the dialog.
 void addSkilltoSkillsList(String value, String essentialStatus, BuildContext context) {
  // Create a map with the skill data
  final data = {
    'Skills': value,
    'essentialStatus': essentialStatus,
  };

  // Check if the value is empty
  if (value.isEmpty) {
    // Show a toast message after a 2-second delay if the value is empty
    Timer(const Duration(seconds: 2), () {
      toastmessege(messege: 'Please fill in the field to add a skill.', textcolor: Colors.red);
    });
    return; // Exit the function early
  }

  // Check if the skill already exists in the jobSkillsList
  if (!jobSkillsList.any((skill) => skill['Skills'] == value)) {
    // Add the skill to the jobSkillsList if it does not exist
    jobSkillsList.add(data);
    Navigator.pop(context); // Close the dialog or navigate back
    skillController.clear(); // Clear the text field
  } else {
    // Print a message if the skill is already in the list
    // print('Skill Already Added');
  }

  // Notify listeners about the change
  notifyListeners();
}


/// If the index is valid (i.e., greater than or equal to 0), the skill at the given index 
/// is removed from the jobSkillsList. The function then calls notifyListeners() to update any 
/// listeners about the change.
/// 
/// Parameters:
/// - `index`: The index of the skill to be removed.
void removeSkillsFromSkillsList(int index) {
  // Check if the index is valid
  if (index >= 0) {
    // Remove the skill at the specified index from the jobSkillsList
    jobSkillsList.removeAt(index);
    // Uncomment the line below to print a success message
    // print('Removed successfully');
  }
  
  // Notify listeners about the change
  notifyListeners();
}


/// Sets the essential status for a skill and notifies listeners.
/// 
/// Updates the essentialstatus variable with the given value and calls notifyListeners() 
/// to update any listeners about the change.
/// 
/// Parameters:
/// - `value`: The new essential status value to be set.
void setIsRequiredorNot(value) {
  // Update the essentialstatus variable with the new value
  skillEessentialstatus = value;
  
  // Notify listeners about the change
  notifyListeners();
}


/// Navigates to the next screen after collecting and validating job details.
/// 
/// Collects job details from various controllers and validates them. If all required fields
/// are filled out correctly, the job data is added to the jobsOffers list, and the screen 
/// navigates to the JobListingScreen. Clears all controllers and resets variables after navigation.
/// 
/// Parameters:
/// - `context`: The BuildContext used to navigate to the next screen.
void navigateToNextScreen(context) {
// Collecting job details from various controllers and variables
  final data = {
    'hotelName': companyNameController.text,
    'jobName': jobNameController.text,
    'numberofOpenings': numberofOpenings.text,
    'jobLocationType': jobLocationType,
    'advertiseCityYesorNo': advertiseCityYesorNo,
    'jobPlaceAdvertiseController': jobPlaceAdvertiseController.text,
    'jobCountry': jobCountry.text,
    'jobCity': jobCity.text,
    'jobArea': jobArea.text,
    'jobPinCode': jobPinCode.text,
    'jobstreetAddress': jobstreetAddress.text,
    'jobContrectLength': jobContrectLength.text,
    'jobContractPeriod': jobContractPeriod,
    'jobAmountStatus': jobAmountStatus,
    'jobRate': jobRate,
    'jobTypes': jobTypesList,
    'jobMinimumAmount': jobMinimumAmount.text,
    'jobMaximumAmount': jobMaximumAmount.text,
    'jobCVStatus': jobCVStatus,
    'jobDescription': jobDescriptionController.text,
    'jobContactDetailes': jobContactDetailes.map((item) => item.text).toList(),
    'jobApplicationDeadlineStatus': jobApplicationDeadlineStatus,
    'jobApplicationDeadLineDate': jobApplicationDeadLineDate.text,
    'jobSkills': jobSkillsList,
  };

  // Validating that all required fields are filled out correctly
  bool isValid = jobNameController.text.isNotEmpty &&
      companyNameController.text.isNotEmpty &&
      numberofOpenings.text.isNotEmpty &&
      jobTypesList.isNotEmpty &&
      jobMaximumAmount.text.isNotEmpty &&
      jobDescriptionController.text.length >= 30 &&
      jobContactDetailes.isNotEmpty &&
      jobSkillsList.isNotEmpty;

  if (advertiseCityYesorNo == 'No' && jobLocationType.isOdd) {
    isValid &= jobCity.text.isNotEmpty &&
        jobArea.text.isNotEmpty &&
        jobPinCode.text.isNotEmpty &&
        jobstreetAddress.text.isNotEmpty;
  } else if(jobLocationType.isEven && advertiseCityYesorNo == 'Yes') {
    isValid &= jobPlaceAdvertiseController.text.isNotEmpty;
  }

  if (isValid) {
    // Adding the collected job data to the jobsOffers list
    jobsOffers.add(data);
    
    // Showing a loading indicator for 2 seconds before navigating
    Timer(const Duration(seconds: 1), () {
      // Navigating to JobListingScreen
      Navigator.push(context, MaterialPageRoute(builder: (context) => const JobListingScreen()));
      // Clearing all controllers and resetting variables after navigation
      clearAllControllers();
    });
    // print(jobsOffers);
  } else {
    // Handle invalid input scenario
    // print("Please fill all the required fields correctly.");
  }
}


  /// Clears all controllers and resets variables to their default values.
  /// 
  /// This function is used to reset all input fields and variables after 
  /// navigating to a different screen.
  void clearAllControllers() {
    companyNameController.clear(); // Clearing the company name controller
    jobNameController.clear(); // Clearing the job name controller
    numberofOpenings.clear(); // Clearing the number of openings controller
    jobPlaceAdvertiseController.clear(); // Clearing the job place advertise controller
    jobLocationType = 1; // Resetting job location type to default value
    jobCountry.clear(); // Clearing the job country controller
    jobCity.clear(); // Clearing the job city controller
    jobArea.clear(); // Clearing the job area controller
    jobPinCode.clear(); // Clearing the job pin code controller
    jobstreetAddress.clear(); // Clearing the job street address controller
    jobTypesList.clear(); // Clearing the job types list
    jobContrectLength.clear(); // Clearing the job contract length controller
    jobMinimumAmount.clear(); // Clearing the job minimum amount controller
    jobMaximumAmount.clear(); // Clearing the job maximum amount controller
    jobDescriptionController.clear(); // Clearing the job description controller
    jobContactDetailes.clear(); // Clearing the job contact details
    jobApplicationDeadLineDate.clear(); // Clearing the job application deadline date controller
    jobSkillsList.clear(); // Clearing the job skills list
  }
  

/// Removes a job from the jobsOffers list based on the provided job details.
/// 
/// This function searches for a job in the jobsOffers list that matches the provided job details
/// and removes it. If the job is not found, it prints an error message.
///
/// Parameters:
/// - `hotelName`: The name of the hotel associated with the job.
/// - `jobName`: The name of the job to be removed.
/// - `numberofOpenings`: The number of openings for the job.
/// - `jobLocationType`: The type of job location.
/// - `advertiseCityYesorNo`: Whether to advertise the city or not.
/// - `jobPlaceAdvertiseController`: The job place to advertise.
/// - `jobCountry`: The job country.
/// - `jobCity`: The job city.
/// - `jobArea`: The job area.
/// - `jobPinCode`: The job pin code.
/// - `jobstreetAddress`: The job street address.
/// - `jobContrectLength`: The job contract length.
/// - `jobContractPeriod`: The job contract period.
/// - `jobAmountStatus`: The job amount status.
/// - `jobRate`: The job rate.
/// - `jobTypes`: The job types list.
/// - `jobMinimumAmount`: The job minimum amount.
/// - `jobMaximumAmount`: The job maximum amount.
/// - `jobCVStatus`: The job CV status.
/// - `jobDescription`: The job description.
/// - `jobContactDetailes`: The job contact details.
/// - `jobApplicationDeadlineStatus`: The job application deadline status.
/// - `jobApplicationDeadLineDate`: The job application deadline date.
/// - `jobSkills`: The job skills list.
Future <void> removeJobFromJobsList({
  hotelName,
  jobName,
  numberofOpenings,
  jobLocationType,
  advertiseCityYesorNo,
  jobPlaceAdvertiseController,
  jobCountry,
  jobCity,
  jobArea,
  jobPinCode,
  jobstreetAddress,
  jobContrectLength,
  jobContractPeriod,
  jobAmountStatus,
  jobRate,
  jobTypes,
  jobMinimumAmount,
  jobMaximumAmount,
  jobCVStatus,
  jobDescription,
  jobContactDetailes,
  jobApplicationDeadlineStatus,
  jobApplicationDeadLineDate,
  jobSkills,
}) async {

  // Finding the index of the job that matches the provided job details
  final index = jobsOffers.indexWhere((job) =>
    job['hotelName'] == hotelName &&
    job['jobName'] == jobName &&
    job['numberofOpenings'] == numberofOpenings &&
    job['jobLocationType'] == jobLocationType &&
    job['advertiseCityYesorNo'] == advertiseCityYesorNo &&
    job['jobPlaceAdvertiseController'] == jobPlaceAdvertiseController &&
    job['jobCountry'] == jobCountry &&
    job['jobCity'] == jobCity &&
    job['jobArea'] == jobArea &&
    job['jobPinCode'] == jobPinCode &&
    job['jobstreetAddress'] == jobstreetAddress &&
    job['jobContrectLength'] == jobContrectLength &&
    job['jobContractPeriod'] == jobContractPeriod &&
    job['jobAmountStatus'] == jobAmountStatus &&
    job['jobRate'] == jobRate &&
    job['jobTypes'] == jobTypes &&
    job['jobMinimumAmount'] == jobMinimumAmount &&
    job['jobMaximumAmount'] == jobMaximumAmount &&
    job['jobCVStatus'] == jobCVStatus &&
    job['jobDescription'] == jobDescription &&
    job['jobContactDetailes'] == jobContactDetailes &&
    job['jobApplicationDeadlineStatus'] == jobApplicationDeadlineStatus &&
    job['jobApplicationDeadLineDate'] == jobApplicationDeadLineDate &&
    job['jobSkills'] == jobSkills);

    // Checking if the job was found
    if (index != -1) {
    // Removing the job from the jobsOffers list at the found index
    jobsOffers.removeAt(index);
    print(jobsOffers);
    print(index);
    // print("Job removed successfully.");
  } else {
    // Printing an error message if the job was not found
    // print("Error: Job not found. Unable to remove job.");
  }
  notifyListeners();
 }  
}

bool isLoading = false;