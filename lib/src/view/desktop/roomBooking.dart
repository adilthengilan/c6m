import 'package:flutter/material.dart';
import 'package:tuch_trip_crms/src/view/desktop/dashboard/dashboard.dart';

class SeatBookingScreen extends StatefulWidget {
  @override
  _SeatBookingScreenState createState() => _SeatBookingScreenState();
}

class _SeatBookingScreenState extends State<SeatBookingScreen> {
  // Total number of seats
  final int totalSeats = 36;

  // To store seat statuses: 0 = available, 1 = selected, 2 = booked
  late List<int> seatStatus;

  @override
  void initState() {
    super.initState();
    // Initialize all seats as available
    seatStatus = List<int>.filled(totalSeats, 0);
  }

  void toggleSeatSelection(int index) {
    setState(() {
      if (seatStatus[index] == 0) {
        seatStatus[index] = 1; // Select seat
      } else if (seatStatus[index] == 1) {
        seatStatus[index] = 0; // Deselect seat
      }
    });
  }

  Widget buildSeat(int index) {
    Color seatColor;

    if (seatStatus[index] == 0) {
      seatColor = Colors.green; // Available
    } else if (seatStatus[index] == 1) {
      seatColor = Colors.blue; // Selected
    } else {
      seatColor = Colors.red; // Booked
    }

    return GestureDetector(
      onTap: () {
        if (seatStatus[index] != 2) {
          toggleSeatSelection(index);
        }
      },
      child: Container(
        margin: EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          color: seatColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.builder(
              itemCount: totalSeats,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 6, // Number of seats in a row
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
              ),
              itemBuilder: (context, index) {
                return buildSeat(index);
              },
            ),
          ),
          sizedBox(0.5, 0.0),
          Container(
            padding: EdgeInsets.all(16.0),
            height: 60,
            child: ElevatedButton(
              onPressed: () {
                List<int> selectedSeats = [];
                for (int i = 0; i < totalSeats; i++) {
                  if (seatStatus[i] == 1) {
                    selectedSeats.add(i + 1); // Adding 1 for seat numbering
                  }
                }
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Selected Seats"),
                      content: Text(selectedSeats.isEmpty
                          ? "No seats selected"
                          : "Seats: ${selectedSeats.join(', ')}"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("OK"),
                        )
                      ],
                    );
                  },
                );
              },
              child: Text('Confirm Booking'),
            ),
          ),
        ],
      ),
    );
  }
}
