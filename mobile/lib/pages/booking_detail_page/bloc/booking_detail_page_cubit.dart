import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meeting_room_booking/pages/booking_detail_page/bloc/booking_detail_page_state.dart';

import '../../../models/room.dart';

class BookingDetailPageCubit extends Cubit<BookingDetailPageState> {
  BookingDetailPageCubit() : super(const BookingDetailPageState());

  final Dio dio = Dio();

  void setPickedDate(DateTime pickedDate) {
    emit(state.copyWith(
      pickedDate: pickedDate,
    ));
  }

  void setBookingDetails(
    DateTime pickedDate,
    TimeOfDay startTime,
    TimeOfDay endTime,
  ) {
    emit(state.copyWith(
        pickedDate: pickedDate, startTime: startTime, endTime: endTime));
  }

  Future<void> getMeetingRoomData(int id) async {
    try {
      Response response = await dio.get("http://localhost:8080/rooms/$id");
      if (response.statusCode == 200) {
        Room room = Room.fromJson(response.data);
        emit(state.copyWith(roomDetail: room));
      }
    } on DioException catch (e) {}
  }
}
