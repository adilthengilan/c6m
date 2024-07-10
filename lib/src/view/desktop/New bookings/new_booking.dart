import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tuch_trip_crms/src/view%20model/booking_provider.dart';
import 'package:tuch_trip_crms/src/view%20model/login_provider.dart';
import 'package:tuch_trip_crms/src/view/desktop/dashboard/dashboard.dart';
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context, bookingProvider, height, width),
            sizedbox(height * 0.03, width),
            GuestsTable(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(context, bookingProvider, height, width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'All bookings',
          style: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        sizedbox(height * 0.01, width * 0.50),
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
            sizedbox(height * 0.01, width * 0.01),
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

  Widget _buildActionButton(BuildContext context, String label, IconData icon,
      Color color, VoidCallback onPressed) {
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
              _buildSortOption(context, bookingProvider, 'All'),
              _buildSortOption(context, bookingProvider, 'Arrived'),
              _buildSortOption(context, bookingProvider, 'Waiting'),
              _buildSortOption(context, bookingProvider, 'Leave'),
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
    return ListTile(
      title: Text(status),
      onTap: () {
        bookingProvider.filterGuests(status);
        Navigator.pop(context);
      },
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
      case "Arrived":
        return Color.fromARGB(255, 195, 255, 197);
      case "Waiting":
        return Color.fromARGB(255, 255, 209, 140);
      case "Leave":
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildRow([
              _buildTextFormField(
                  'Client email', _clientEmailController, width),
              _buildTextFormField(
                  'Booking reference', _bookingReferenceController, width),
            ]),
            _buildRow([
              _buildDropdownFormField('Company', _company, [
                'British Airways Holidays',
                'Company 2',
                'Company 3'
              ], (value) {
                _company = value!;
              }),
              _buildDropdownFormField(
                  'Hotel', _hotel, ['The Royal National', 'Hotel 2', 'Hotel 3'],
                  (value) {
                _hotel = value!;
              }),
            ]),
            _buildRow([
              _buildTextFormField('Check-in', _checkInController, width),
              _buildTextFormField('Nights', _nightsController, width),
            ]),
            _buildRow([
              _buildTextFormField('Check-out', _checkOutController, width),
              _buildDropdownFormField(
                  'Rate', _rate, ['SUMMERSAVER', 'Rate 2', 'Rate 3'], (value) {
                _rate = value!;
              }),
            ]),
            _buildRow([
              _buildTextFormField(
                  'Special request', _specialRequestController, width),
              _buildDropdownFormField('Room type', _roomType,
                  ['Double room', 'Single room', 'Suite'], (value) {
                _roomType = value!;
              }),
            ]),
            _buildRow([
              _buildTextFormField(
                  'Occupant first name', _occupantFirstNameController, width),
              _buildTextFormField(
                  'Occupant last name', _occupantLastNameController, width),
            ]),
            _buildRow([
              _buildDropdownFormField(
                  'Extras', _extras, ['None', 'Extra 1', 'Extra 2'], (value) {
                _extras = value!;
              }),
              _buildDropdownFormField('Room layout', _roomLayout,
                  ['Default setup', 'Layout 1', 'Layout 2'], (value) {
                _roomLayout = value!;
              }),
            ]),
            _buildRow([
              _buildTextFormField(
                  'Adult first name', _adultFirstNameController, width),
              _buildTextFormField(
                  'Adult last name', _adultLastNameController, width),
            ]),
          ],
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
              )))
          .toList(),
    );
  }

  Widget _buildTextFormField(
      String label, TextEditingController controller, width) {
    return CustomContainer(
      boxShadow: false,
      width: width * 0.350,
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(20),
      child: CustomTextField(
        controller: controller, borderRadius: 15,
        labelText: label, labelTextStyle: smallTextStyle,
        // validator: (value) {
        //   if (value == null || value.isEmpty) {
        //     return 'Please enter some text';
        //   }
        //   return null;
        // },
      ),
    );
  }

  Widget _buildDropdownFormField(String label, String currentValue,
      List<String> items, Function(String?) onChanged) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
          labelText: label,
          labelStyle: GoogleFonts.montserrat(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.grey,
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
      value: currentValue,
      items: items.map((
        item,
      ) {
        return DropdownMenuItem(
          value: item,
          child: Text(
            item,
            style: GoogleFonts.montserrat(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
          ),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}