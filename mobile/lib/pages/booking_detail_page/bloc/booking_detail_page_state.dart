import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meeting_room_booking/models/room.dart';

class BookingDetailPageState extends Equatable {
  final DateTime? pickedDate;
  final TimeOfDay? startTime;
  final TimeOfDay? endTime;
  final Room? roomDetail;

  const BookingDetailPageState({
    this.pickedDate,
    this.startTime,
    this.endTime,
    this.roomDetail,
  });

  BookingDetailPageState copyWith({
    DateTime? pickedDate,
    TimeOfDay? startTime,
    TimeOfDay? endTime,
    Room? roomDetail,
  }) {
    return BookingDetailPageState(
      pickedDate: pickedDate ?? this.pickedDate,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      roomDetail: roomDetail ?? this.roomDetail,
    );
  }

  @override
  List<Object?> get props => [pickedDate, startTime, endTime, roomDetail];
}
