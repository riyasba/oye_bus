// import 'package:flutter/material.dart';

// void main() {
//   runApp(MaterialApp(
//     home: Scaffold(
//       appBar: AppBar(
//         title: Text('Bus Seat Selection'),
//       ),
//       body: SeatSelectionScreen(),
//     ),
//   ));
// }

// class SeatSelectionScreen extends StatefulWidget {
//   @override
//   _SeatSelectionScreenState createState() => _SeatSelectionScreenState();
// }

// class _SeatSelectionScreenState extends State<SeatSelectionScreen> {
//   List<bool> seats = List.generate(30, (_) => false); // Example: 30 seats in total

//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       padding: EdgeInsets.all(20.0),
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 3, // Number of seats per row
//         mainAxisSpacing: 10.0,
//         crossAxisSpacing: 10.0,
//       ),
//       itemCount: seats.length,
//       itemBuilder: (BuildContext context, int index) {
//         return GestureDetector(
//           onTap: () {
//             setState(() {
//               seats[index] = !seats[index];
//             });
//           },
//           child: AnimatedContainer(
//             duration: Duration(milliseconds: 300),
//             curve: Curves.easeInOut,
//             width: 50.0,
//             height: 50.0,
//             decoration: BoxDecoration(
//               color: seats[index] ? Colors.grey[300] : Colors.green,
//               borderRadius: BorderRadius.circular(5.0),
//               border: Border.all(
//                 color: Colors.grey.shade400,
//                 width: 1.0,
//               ),
//             ),
//             child: Center(
//               child: Icon(
//                 seats[index] ? Icons.event_seat : Icons.event_available,
//                 size: 28.0,
//                 color: seats[index] ? Colors.red : Colors.black,
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
