import 'package:flutter/material.dart';
import 'package:meeting_room_booking/common/common_app_bar.dart';
import 'package:meeting_room_booking/pages/search_room/page/search_room_page.dart';
import '../../../models/booking.dart';
import '../components/booking_widget.dart';

class MyBookingPage extends StatefulWidget {
  const MyBookingPage({super.key});

  @override
  State<MyBookingPage> createState() => _MyBookingPageState();
}

class _MyBookingPageState extends State<MyBookingPage> {
  final List<Booking> reservedBookings = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key("my_booking_page"),
      appBar: const MeetRoomAppBar(
        title: "My Bookings",
        image: AssetImage("assets/images/app_bar_cover.png"),
        showBackButton: false,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              ExpansionTile(
                initiallyExpanded: true,
                title: const Text(
                  "Reserved",
                  style: TextStyle(
                      fontFamily: "Open_Sans",
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Colors.black),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                    child: ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          BookingWidgetArguments args = BookingWidgetArguments(
                              id: reservedBookings[index].id!,
                              status: reservedBookings[index].status!,
                              bookingNo: reservedBookings[index].bookingNo!,
                              roomNo: reservedBookings[index].roomNo!,
                              maxGuest: reservedBookings[index].maxGuest!,
                              startAt: reservedBookings[index].startAt!,
                              endAt: reservedBookings[index].endAt!);
                          return InkWell(
                            child: BookingWidget(args: args),
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 20,
                            ),
                        itemCount: reservedBookings.length),
                  )
                ],
              ),
              ExpansionTile(
                initiallyExpanded: false,
                title: const Text(
                  "Cancelled",
                  style: TextStyle(
                      fontFamily: "Open_Sans",
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Colors.black),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                    child: ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          BookingWidgetArguments args = BookingWidgetArguments(
                              id: reservedBookings[index].id!,
                              status: reservedBookings[index].status!,
                              bookingNo: reservedBookings[index].bookingNo!,
                              roomNo: reservedBookings[index].roomNo!,
                              maxGuest: reservedBookings[index].maxGuest!,
                              startAt: reservedBookings[index].startAt!,
                              endAt: reservedBookings[index].endAt!);
                          return InkWell(
                            child: BookingWidget(args: args),
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 20,
                            ),
                        itemCount: cancelledBookings.length),
                  )
                ],
              ),
              ExpansionTile(
                initiallyExpanded: false,
                title: const Text(
                  "Completed",
                  style: TextStyle(
                      fontFamily: "Open_Sans",
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Colors.black),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                    child: ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          BookingWidgetArguments args = BookingWidgetArguments(
                              id: reservedBookings[index].id!,
                              status: reservedBookings[index].status!,
                              bookingNo: reservedBookings[index].bookingNo!,
                              roomNo: reservedBookings[index].roomNo!,
                              maxGuest: reservedBookings[index].maxGuest!,
                              startAt: reservedBookings[index].startAt!,
                              endAt: reservedBookings[index].endAt!);
                          return InkWell(
                            child: BookingWidget(args: args),
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 20,
                            ),
                        itemCount: completedBookings.length),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
          height: 155,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Flex(
              direction: Axis.horizontal,
              children: [
                Expanded(
                    child: SizedBox(
                  height: 75,
                  child: ElevatedButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const SearchRoomPage())),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(92, 201, 155, 1)),
                    child: const Text(
                      "Make New Booking",
                      style: TextStyle(
                        fontFamily: "Open_Sans",
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ))
              ],
            ),
          )),
    );
  }
}
