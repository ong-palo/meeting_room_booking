enum BookingStatus { reserved, cancelled, completed }

class Booking {
  final int? id;
  final String? roomNo;
  final BookingStatus? status;
  final String? bookingNo;
  final int? maxGuest;
  final DateTime? startAt;
  final DateTime? endAt;

  Booking(
      {this.id,
      this.roomNo,
      this.status,
      this.bookingNo,
      this.maxGuest,
      this.startAt,
      this.endAt});
}
