import '../../../models/booking.dart';

class MockData {
  List<Booking> reservedBookings = [
    Booking(
        id: 1,
        roomNo: 'AA',
        status: BookingStatus.reserved,
        bookingNo: '123',
        maxGuest: 20,
        startAt: DateTime.now(),
        endAt: DateTime.now()),
    Booking(
        id: 2,
        roomNo: 'AA',
        status: BookingStatus.reserved,
        bookingNo: '124',
        maxGuest: 5,
        startAt: DateTime.now(),
        endAt: DateTime.now())
  ];

  final List<Booking> cancelledBookings = [
    Booking(
        id: 4,
        roomNo: 'BB',
        status: BookingStatus.cancelled,
        bookingNo: '123',
        maxGuest: 20,
        startAt: DateTime.now(),
        endAt: DateTime.now()),
    Booking(
        id: 5,
        roomNo: 'BB',
        status: BookingStatus.cancelled,
        bookingNo: '123',
        maxGuest: 5,
        startAt: DateTime.now(),
        endAt: DateTime.now()),
    Booking(
        id: 5,
        roomNo: 'CC',
        status: BookingStatus.cancelled,
        bookingNo: '123',
        maxGuest: 5,
        startAt: DateTime.now(),
        endAt: DateTime.now()),
    Booking(
        id: 5,
        roomNo: '',
        status: BookingStatus.cancelled,
        bookingNo: '',
        maxGuest: 5,
        startAt: DateTime.now(),
        endAt: DateTime.now()),
    Booking(
        id: 5,
        roomNo: '',
        status: BookingStatus.cancelled,
        bookingNo: '',
        maxGuest: 5,
        startAt: DateTime.now(),
        endAt: DateTime.now()),
    Booking(
        id: 5,
        roomNo: '',
        status: BookingStatus.cancelled,
        bookingNo: '',
        maxGuest: 5,
        startAt: DateTime.now(),
        endAt: DateTime.now()),
    Booking(
        id: 5,
        roomNo: '',
        status: BookingStatus.cancelled,
        bookingNo: '',
        maxGuest: 5,
        startAt: DateTime.now(),
        endAt: DateTime.now())
  ];

  final List<Booking> completedBookings = [
    Booking(
        id: 20,
        roomNo: 'AA',
        status: BookingStatus.completed,
        bookingNo: '123',
        maxGuest: 5,
        startAt: DateTime.now(),
        endAt: DateTime.now())
  ];

  List<Booking> get getReservedBookings => reservedBookings;
  List<Booking> get getCancelledBookings => cancelledBookings;
  List<Booking> get getCompletedBookings => completedBookings;
}
