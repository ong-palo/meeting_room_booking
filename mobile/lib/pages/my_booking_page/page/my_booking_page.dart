import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meeting_room_booking/common/common_app_bar.dart';
import 'package:meeting_room_booking/pages/my_booking_page/components/mock_data.dart';
import 'package:meeting_room_booking/pages/search_room/page/search_room_page.dart';
import 'package:meeting_room_booking/routes.dart';
import '../../../models/booking.dart';
import '../components/booking_widget.dart';

class MyBookingPage extends StatefulWidget {
  const MyBookingPage({super.key});

  @override
  State<MyBookingPage> createState() => _MyBookingPageState();
}

class _MyBookingPageState extends State<MyBookingPage> {
  MockData mockData = MockData();
  @override
  Widget build(BuildContext context) {
    List<Booking> reservedBookings = mockData.getReservedBookings;
    List<Booking> completedBookings = mockData.getCompletedBookings;
    List<Booking> cancelledBookings = mockData.getCancelledBookings;
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
                              id: cancelledBookings[index].id!,
                              status: cancelledBookings[index].status!,
                              bookingNo: cancelledBookings[index].bookingNo!,
                              roomNo: cancelledBookings[index].roomNo!,
                              maxGuest: cancelledBookings[index].maxGuest!,
                              startAt: cancelledBookings[index].startAt!,
                              endAt: cancelledBookings[index].endAt!);
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
                              id: completedBookings[index].id!,
                              status: completedBookings[index].status!,
                              bookingNo: completedBookings[index].bookingNo!,
                              roomNo: completedBookings[index].roomNo!,
                              maxGuest: completedBookings[index].maxGuest!,
                              startAt: completedBookings[index].startAt!,
                              endAt: completedBookings[index].endAt!);
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
                    onPressed: () =>
                        context.pushNamed(RouteName.searchPage.name),
                    // onPressed: () => Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (_) => const SearchRoomPage())),
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
