import 'package:equatable/equatable.dart';
import 'package:meeting_room_booking/models/booking.dart';

class MyBookingPageState extends Equatable {
  final List<Booking>? reservedBookings;
  final List<Booking>? completedBookings;
  final List<Booking>? cancelledBookings;

  const MyBookingPageState({
    this.reservedBookings,
    this.completedBookings,
    this.cancelledBookings,
  });

  MyBookingPageState copyWith({
    List<Booking>? reservedBookings,
    List<Booking>? completedBookings,
    List<Booking>? cancelledBookings,
  }) {
    return MyBookingPageState(
      reservedBookings: reservedBookings ?? this.reservedBookings,
      completedBookings: completedBookings ?? this.completedBookings,
      cancelledBookings: cancelledBookings ?? this.cancelledBookings,
    );
  }

  @override
  List<Object?> get props => [
        reservedBookings,
        completedBookings,
        cancelledBookings,
      ];
}
