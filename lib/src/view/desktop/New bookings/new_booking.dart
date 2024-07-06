import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tuch_trip_crms/src/view%20model/booking_provider.dart';
import 'package:tuch_trip_crms/src/view/desktop/New%20bookings/booking_details.dart';
import 'package:tuch_trip_crms/src/view/desktop/dashboard/dashboard.dart';

class NewBookings extends StatelessWidget {
  const NewBookings({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final bookingprovider = Provider.of<BookingProvider>(context);

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sizedBox(height * 0.02, width),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'All bookings',
                style: GoogleFonts.montserrat(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              sizedBox(height * 0.01, width * 0.52),
              Container(
                height: height * 0.05,
                width: width * 0.08,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color.fromARGB(255, 219, 255, 160)),
                child: Center(
                  child: TextButton.icon(
                    icon: Icon(
                      Icons.sort,
                      size: 12,
                      color: Colors.black,
                    ),
                    label: Text(
                      'Sort',
                      style: GoogleFonts.montserrat(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    onPressed: () {
                      _showSortOptions(context, bookingprovider);
                    },
                  ),
                ),
              ),
              sizedBox(height * 0.01, width * 0.01),
              Container(
                height: height * 0.05,
                width: width * 0.08,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color.fromARGB(255, 255, 160, 160)),
                child: Center(
                  child: TextButton.icon(
                    icon: Icon(
                      Icons.add,
                      size: 12,
                      color: Colors.black,
                    ),
                    label: Text(
                      'Booking',
                      style: GoogleFonts.montserrat(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return NewBookingDialog();
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          sizedBox(height * 0.01, width),
          GuestsTable()
        ],
      ),
    );
  }
}

void _showSortOptions(context, bookingProvider) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Sort Guests'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text('All'),
              onTap: () {
                bookingProvider.filterGuests('All');
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Arrived'),
              onTap: () {
                bookingProvider.filterGuests('Arrived');
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Waiting'),
              onTap: () {
                bookingProvider.filterGuests('Waiting');
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Leave'),
              onTap: () {
                bookingProvider.filterGuests('Leave');
                Navigator.pop(context);
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel'),
          ),
        ],
      );
    },
  );
}

//-----------------------------------------------
// NewBookingDialog class to handle new bookings
//-----------------------------------------------

class NewBookingDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return AlertDialog(
      title: Text(
        'New Booking',
        style: GoogleFonts.poppins(
            fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
      ),
      content: SingleChildScrollView(
        child: BookingForm(),
      ),
      actions: [
        TextButton(
          onPressed: () {
            // Close the dialog
            Navigator.of(context).pop();
          },
          child: Text(
            'Cancel',
            style: GoogleFonts.poppins(
                fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black),
          ),
        ),
        Container(
          height: height * 0.05,
          width: width * 0.08,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color.fromARGB(255, 255, 156, 156)),
          child: Center(
            child: Text(
              'Add',
              style: GoogleFonts.montserrat(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}

//------------------------------------------------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------------------------------------------------
//----------------------------------------- Guest Table ------------------------------------------------------------------------------------------
//-----------------------------------------------------------Define GuestsTable widget------------------------------------------------------------
//------------------------------------------------------------------------------------------------------------------------------------------------

//
class GuestsTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.width;

    return Consumer<BookingProvider>(
      builder: (context, guestProvider, child) {
        return Padding(
          padding: EdgeInsets.only(right: width * 0.02, top: height * 0.01),
          child: Column(
            children: [
              Container(
                width: width * 0.800,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(-0.3, 1),
                      blurRadius: 2,
                      blurStyle: BlurStyle.normal,
                      spreadRadius: 0,
                      color: Color.fromARGB(213, 216, 214, 214),
                    ),
                  ],
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BookingDetailsScreen()));
                  },
                  child: DataTable(
                    columns: [
                      DataColumn(
                        label: Text(
                          'Name',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Guests',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Room number',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Check-in',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Check-out',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Status',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Revenue',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                    rows: guestProvider.guests.map((guest) {
                      return DataRow(
                        cells: [
                          DataCell(Text(guest['name'])),
                          DataCell(Text(guest['guests'].toString())),
                          DataCell(Text(guest['room'])),
                          DataCell(Text(guest['checkIn'])),
                          DataCell(Text(guest['checkOut'])),
                          DataCell(
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 4.0, horizontal: 8.0),
                              decoration: BoxDecoration(
                                color: getStatusColor(guest['status']),
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              child: Text(guest['status']),
                            ),
                          ),
                          DataCell(Text(guest['Revenue'])),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showSortOptions(BuildContext context, BookingProvider guestProvider) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text('All'),
              onTap: () {
                guestProvider.filterGuests('All');
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Arrived'),
              onTap: () {
                guestProvider.filterGuests('Arrived');
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Waiting'),
              onTap: () {
                guestProvider.filterGuests('Waiting');
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Leave'),
              onTap: () {
                guestProvider.filterGuests('Leave');
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  Color getStatusColor(String status) {
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

// BookingForm class to handle the form fields
class BookingForm extends StatefulWidget {
  @override
  _BookingFormState createState() => _BookingFormState();
}

class _BookingFormState extends State<BookingForm> {
  // State variables for the form fields
  final _formKey = GlobalKey<FormState>();
  String _clientEmail = '';
  String _bookingReference = '';
  String _company = 'British Airways Holidays';
  String _hotel = 'The Royal National';
  String _checkIn = '';
  String _nights = '';
  String _checkOut = '';
  String _rate = 'SUMMERSAVER';
  String _specialRequest = '';
  String _roomType = 'Double room';
  String _occupantFirstName = '';
  String _occupantLastName = '';
  String _extras = 'None';
  String _adultFirstName = '';
  String _adultLastName = '';
  String _roomLayout = 'Default setup';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Client email',
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              _clientEmail = value;
            },
          ),
          SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Booking reference',
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              _bookingReference = value;
            },
          ),
          SizedBox(height: 20),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: 'Company',
              border: OutlineInputBorder(),
            ),
            value: _company,
            items: <String>[
              'British Airways Holidays',
              'Company 2',
              'Company 3'
            ].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _company = value!;
              });
            },
          ),
          SizedBox(height: 20),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: 'Hotel',
              border: OutlineInputBorder(),
            ),
            value: _hotel,
            items: <String>['The Royal National', 'Hotel 2', 'Hotel 3']
                .map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _hotel = value!;
              });
            },
          ),
          SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Check-in',
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              _checkIn = value;
            },
          ),
          SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Nights',
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              _nights = value;
            },
          ),
          SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Check-out',
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              _checkOut = value;
            },
          ),
          SizedBox(height: 20),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: 'Rate',
              border: OutlineInputBorder(),
            ),
            value: _rate,
            items:
                <String>['SUMMERSAVER', 'Rate 2', 'Rate 3'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _rate = value!;
              });
            },
          ),
          SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Special request',
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              _specialRequest = value;
            },
          ),
          SizedBox(height: 20),
          RoomTypeSection(),
        ],
      ),
    );
  }
}

// RoomTypeSection class to handle room type related fields
class RoomTypeSection extends StatefulWidget {
  @override
  _RoomTypeSectionState createState() => _RoomTypeSectionState();
}

class _RoomTypeSectionState extends State<RoomTypeSection> {
  String _roomType = 'Double room';
  String _occupantFirstName = '';
  String _occupantLastName = '';
  String _extras = 'None';
  String _adultFirstName = '';
  String _adultLastName = '';
  String _roomLayout = 'Default setup';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Room type',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            labelText: 'Room type',
            border: OutlineInputBorder(),
          ),
          value: _roomType,
          items: <String>['Double room', 'Single room', 'Suite']
              .map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              _roomType = value!;
            });
          },
        ),
        SizedBox(height: 20),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Occupant First name',
            border: OutlineInputBorder(),
          ),
          onChanged: (value) {
            _occupantFirstName = value;
          },
        ),
        SizedBox(height: 20),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Occupant Last name',
            border: OutlineInputBorder(),
          ),
          onChanged: (value) {
            _occupantLastName = value;
          },
        ),
        SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: RadioListTile(
                title: Text('None'),
                value: 'None',
                groupValue: _extras,
                onChanged: (value) {
                  setState(() {
                    _extras = value as String;
                  });
                },
              ),
            ),
            Expanded(
              child: RadioListTile(
                title: Text('Extra bed'),
                value: 'Extra bed',
                groupValue: _extras,
                onChanged: (value) {
                  setState(() {
                    _extras = value as String;
                  });
                },
              ),
            ),
            Expanded(
              child: RadioListTile(
                title: Text('Baby cot'),
                value: 'Baby cot',
                groupValue: _extras,
                onChanged: (value) {
                  setState(() {
                    _extras = value as String;
                  });
                },
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Adult First name',
            border: OutlineInputBorder(),
          ),
          onChanged: (value) {
            _adultFirstName = value;
          },
        ),
        SizedBox(height: 20),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Adult Last name',
            border: OutlineInputBorder(),
          ),
          onChanged: (value) {
            _adultLastName = value;
          },
        ),
        SizedBox(height: 20),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            labelText: 'Room layout',
            border: OutlineInputBorder(),
          ),
          value: _roomLayout,
          items: <String>[
            'Default setup',
            'Setup both room as TWN',
            'Setup room 1 as TW'
          ].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              _roomLayout = value!;
            });
          },
        ),
      ],
    );
  }
}
