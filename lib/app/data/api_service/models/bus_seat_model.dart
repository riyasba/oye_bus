
import 'package:flutter/material.dart';

class Seat {
  final String seatId;
  final int row;
  final int column;
  final int length;
  final int width;
  final String position;
  final String layout;
  final int layoutId;
  final bool isWindowSeat;
  final bool ladiesSeat;
  final String fareKey;
  final bool isBookable;
  Color color;
  bool isSelected;

  Seat({
    required this.seatId,
    required this.row,
    required this.column,
    required this.length,
    required this.width,
    required this.position,
    required this.layout,
    required this.layoutId,
    required this.isWindowSeat,
    required this.ladiesSeat,
    required this.fareKey,
    required this.isBookable,
    required this.color,
     this.isSelected = false,
  });

  factory Seat.fromJson(Map<String, dynamic> json) {
    return Seat(
      seatId: json['seat_id'],
      row: json['row'],
      column: json['column'],
      length: json['length'],
      width: json['width'],
      position: json['position'],
      layout: json['layout'],
      layoutId: json['layout_id'],
      isWindowSeat: json['is_window_seat'] == 'yes',
      ladiesSeat: json['ladies_Seat'],
      fareKey: json['fare_key'],
      isBookable: json['is_bookable'],
      color: const Color.fromARGB(255, 224, 224, 224)
    );
  }
}



class BusModel {
  final String modelName;
   bool isSelected;
   String fleetType;
   String acOrNonAc;
   String seatType;
  final List<Seat> seatMap;

  BusModel({required this.modelName, required this.seatMap,required this.isSelected,required this.acOrNonAc,required this.fleetType,required this.seatType});

  factory BusModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> seatsJson = json['seat_map'];
    List<Seat> seats = seatsJson.map((seatJson) => Seat.fromJson(seatJson)).toList();

    return BusModel(
      modelName: json['model_name'],
      seatMap: seats,
      acOrNonAc: json['ac_or_non_ac'],
      fleetType: json['fleet_type'],
      seatType: json['seat_type'],
      isSelected: false
    );
  }
}  