import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tuch_trip_crms/src/view%20model/booking_provider.dart';
import 'package:tuch_trip_crms/src/view/widgets/custom_container.dart';
import 'package:tuch_trip_crms/src/view/widgets/custom_textfield.dart';

class NewBookings extends StatelessWidget {
  const NewBookings({super.key});

  @override
  Widget build(BuildContext context) {
    final bookingProvider = Provider.of<BookingProvider>(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context, bookingProvider, height, width),
            SizedBox(height: height * 0.03),
            GuestsTable(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(context, bookingProvider, height, width) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'All bookings',
          style: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(width: width * 0.50),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildActionButton(
              context,
              'Sort',
              Icons.sort,
              Color.fromARGB(255, 219, 255, 160),
              () => _showSortOptions(context, bookingProvider),
            ),
            SizedBox(width: width * 0.01),
            _buildActionButton(
              context,
              'Booking',
              Icons.add,
              Color.fromARGB(255, 255, 160, 160),
              () => showDialog(
                context: context,
                builder: (context) => NewBookingDialog(),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActionButton(BuildContext context, String label, IconData icon, Color color, VoidCallback onPressed) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextButton.icon(
        icon: Icon(icon, size: 12, color: Colors.black),
        label: Text(
          label,
          style: GoogleFonts.montserrat(
            fontSize: 11,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }

  void _showSortOptions(BuildContext context, BookingProvider bookingProvider) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Sort Guests'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildSortOption(context, bookingProvider, 'Check in'),
              _buildSortOption(context, bookingProvider, 'Waiting'),
              _buildSortOption(context, bookingProvider, 'Check out'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildSortOption(
      BuildContext context, BookingProvider bookingProvider, String status) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: CustomContainer(
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: false,
        child: ListTile(
          leading: Checkbox(
            value: bookingProvider.selectedSortOption == status,
            onChanged: (bool? value) {
              if (value != null && value) {
                bookingProvider.filterGuests(status);
              }
              Navigator.pop(context);
            },
          ),
          title: Text(status),
          onTap: () {
            bookingProvider.filterGuests(status);
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

class GuestsTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bookingProvider = Provider.of<BookingProvider>(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: width * 0.770,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            offset: Offset(-0.3, 1),
            blurRadius: 2,
            spreadRadius: 0,
            color: Color.fromARGB(213, 216, 214, 214),
          ),
        ],
      ),
      child: DataTable(
        columns: _buildColumns(),
        rows: _buildRows(bookingProvider),
      ),
    );
  }

  List<DataColumn> _buildColumns() {
    return [
      DataColumn(
          label: Text('Name', style: TextStyle(fontWeight: FontWeight.bold))),
      DataColumn(
          label: Text('Guests', style: TextStyle(fontWeight: FontWeight.bold))),
      DataColumn(
          label: Text('Room number',
              style: TextStyle(fontWeight: FontWeight.bold))),
      DataColumn(
          label:
              Text('Check-in', style: TextStyle(fontWeight: FontWeight.bold))),
      DataColumn(
          label:
              Text('Check-out', style: TextStyle(fontWeight: FontWeight.bold))),
      DataColumn(
          label: Text('Status', style: TextStyle(fontWeight: FontWeight.bold))),
      DataColumn(
          label:
              Text('Revenue', style: TextStyle(fontWeight: FontWeight.bold))),
    ];
  }

  List<DataRow> _buildRows(BookingProvider bookingProvider) {
    return bookingProvider.guests.map((guest) {
      return DataRow(
        cells: [
          DataCell(Text(guest['name'])),
          DataCell(Text(guest['guests'].toString())),
          DataCell(Text(guest['room'])),
          DataCell(Text(guest['checkIn'])),
          DataCell(Text(guest['checkOut'])),
          DataCell(Container(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
            decoration: BoxDecoration(
              color: _getStatusColor(guest['status']),
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Text(guest['status']),
          )),
          DataCell(Text(guest['Revenue'])),
        ],
      );
    }).toList();
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case "Check in":
        return Color.fromARGB(255, 195, 255, 197);
      case "Waiting":
        return Color.fromARGB(255, 255, 209, 140);
      case "Check out":
        return Color.fromARGB(255, 255, 123, 114);
      default:
        return Color.fromARGB(255, 198, 194, 194);
    }
  }
}

class NewBookingDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Text(
        'New Booking',
        style: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
      content: SingleChildScrollView(
        child: BookingForm(),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            'Cancel',
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 156, 156),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextButton(
            onPressed: () {
              // Handle add booking
            },
            child: Text(
              'Add',
              style: GoogleFonts.montserrat(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class BookingForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _clientEmailController = TextEditingController();
  final TextEditingController _bookingReferenceController =
      TextEditingController();
  final TextEditingController _checkInController = TextEditingController();
  final TextEditingController _nightsController = TextEditingController();
  final TextEditingController _checkOutController = TextEditingController();
  final TextEditingController _specialRequestController =
      TextEditingController();
  final TextEditingController _occupantFirstNameController =
      TextEditingController();
  final TextEditingController _occupantLastNameController =
      TextEditingController();
  final TextEditingController _adultFirstNameController =
      TextEditingController();
  final TextEditingController _adultLastNameController =
      TextEditingController();

  String _company = 'British Airways Holidays';
  String _hotel = 'The Royal National';
  String _rate = 'SUMMERSAVER';
  String _roomType = 'Double room';
  String _extras = 'None';
  String _roomLayout = 'Default setup';

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomContainer(
              width: width * 0.32,
              height: height * 0.55,
              boxShadow: true,
              child: Column(
                children: [
                  _buildTextField(
                      context, 'Client email', _clientEmailController),
                  _buildTextField(context, 'Booking reference',
                      _bookingReferenceController),
                  _buildTextField(context, 'Check-in', _checkInController),
                  _buildTextField(context, 'Nights', _nightsController),
                  _buildTextField(context, 'Check-out', _checkOutController),
                  _buildTextField(
                      context, 'Special request', _specialRequestController),
                  _buildTextField(context, 'Occupant First Name',
                      _occupantFirstNameController),
                  _buildTextField(context, 'Occupant Last Name',
                      _occupantLastNameController),
                  _buildTextField(
                      context, 'Adult First Name', _adultFirstNameController),
                  _buildTextField(
                      context, 'Adult Last Name', _adultLastNameController),
                  _buildDropdown(context, 'Company', _company,
                      ['British Airways Holidays']),
                  _buildDropdown(
                      context, 'Hotel', _hotel, ['The Royal National']),
                  _buildDropdown(context, 'Rate', _rate, ['SUMMERSAVER']),
                  _buildDropdown(
                      context, 'Room Type', _roomType, ['Double room']),
                  _buildDropdown(context, 'Extras', _extras, ['None']),
                  _buildDropdown(
                      context, 'Room Layout', _roomLayout, ['Default setup']),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(BuildContext context, String labelText,
      TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: CustomTextField(
        controller: controller,
        labelText: labelText,
      ),
    );
  }

  Widget _buildDropdown(BuildContext context, String label, String currentValue,
      List<String> options) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<String>(
        value: currentValue,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        items: options.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String? newValue) {
          if (newValue != null) {
            currentValue = newValue;
          }
        },
      ),
    );
  }
}