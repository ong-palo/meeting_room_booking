import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meeting_room_booking/models/room.dart';

enum GetRoomStatus { pending, success, failed }

class BookingDetailPageState extends Equatable {
  final DateTime? pickedDate;
  final TimeOfDay? startTime;
  final TimeOfDay? endTime;
  final Room? roomDetail;
  final GetRoomStatus? status;

  const BookingDetailPageState({
    this.pickedDate,
    this.startTime,
    this.endTime,
    this.roomDetail,
    this.status = GetRoomStatus.pending,
  });

  BookingDetailPageState copyWith({
    DateTime? pickedDate,
    TimeOfDay? startTime,
    TimeOfDay? endTime,
    Room? roomDetail,
    GetRoomStatus? status,
  }) {
    return BookingDetailPageState(
      pickedDate: pickedDate ?? this.pickedDate,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      roomDetail: roomDetail ?? this.roomDetail,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props =>
      [pickedDate, startTime, endTime, roomDetail, status];
}
