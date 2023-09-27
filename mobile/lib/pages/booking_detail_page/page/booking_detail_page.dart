import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:meeting_room_booking/pages/booking_detail_page/bloc/booking_detail_page_cubit.dart';
import 'package:meeting_room_booking/pages/booking_detail_page/bloc/booking_detail_page_state.dart';
import 'package:meeting_room_booking/routes.dart';

class BookingDetailPageArgument {
  const BookingDetailPageArgument(
      {required this.pickedDate,
      required this.startTime,
      required this.endTime,
      required this.id});
  final DateTime pickedDate;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final int id;
}

class BookingDetailPage extends StatefulWidget {
  final BookingDetailPageArgument args;
  const BookingDetailPage({super.key, required this.args});

  @override
  State<BookingDetailPage> createState() => _BookingDetailPageState();
}

class _BookingDetailPageState extends State<BookingDetailPage> {
  // static int greenColor = 0xff5CC99B;
  // static const openSans16_700 = TextStyle(
  //     fontFamily: "Open_Sans", fontSize: 16, fontWeight: FontWeight.w700);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // Set booking detail state
      await context
          .read<BookingDetailPageCubit>()
          .getMeetingRoomData(widget.args.id);
      print(context.read<BookingDetailPageCubit>().state.roomDetail);
      setup();
    });
  }

  void setup() {
    context.read<BookingDetailPageCubit>().setBookingDetails(
        widget.args.pickedDate, widget.args.startTime, widget.args.endTime);
    print(context.read<BookingDetailPageCubit>().state.pickedDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/meeting_room.png'),
              fit: BoxFit.fitHeight),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Padding(
              padding: EdgeInsets.fromLTRB(22, 50, 22, 0),
              child: Text(
                "Booking \nSummary",
                style: TextStyle(color: Colors.white, fontSize: 50),
              ),
            ),
            Spacer(),
            BookingDetailPageBody(),
          ],
        ),
      ),
    );
  }
}

class BookingDetailPageBody extends StatelessWidget {
  const BookingDetailPageBody({super.key});

  static int greenColor = 0xff5CC99B;

  static const openSans16_700 = TextStyle(
      fontFamily: "Open_Sans", fontSize: 16, fontWeight: FontWeight.w700);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(22, 30, 22, 0),
        child: Column(
          children: [
            Flex(
              direction: Axis.horizontal,
              children: const [
                Expanded(
                  child: Text(
                    'Date',
                    style: openSans16_700,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Text(
                    "Time",
                    style: openSans16_700,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Flex(
              direction: Axis.horizontal,
              children: [
                Expanded(
                  child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5))),
                      child: Align(
                          alignment: Alignment.center,
                          child: BlocBuilder<BookingDetailPageCubit,
                              BookingDetailPageState>(
                            builder: (context, state) {
                              return Text(
                                state.pickedDate != null
                                    ? DateFormat.yMd().format(state.pickedDate!)
                                    : '-',
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 20),
                              );
                            },
                          ))),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                    child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(5),
                            )),
                        child: Align(
                          alignment: Alignment.center,
                          child: BlocBuilder<BookingDetailPageCubit,
                              BookingDetailPageState>(
                            builder: (context, state) {
                              return Text(
                                  state.startTime?.format(context) != null
                                      ? "${state.startTime?.format(context)}-${state.endTime?.format(context)}"
                                      : '-',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 20));
                            },
                          ),
                        )))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Flex(
              direction: Axis.horizontal,
              children: const [
                Text(
                  "Selected Room",
                  style: openSans16_700,
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Flex(
              direction: Axis.horizontal,
              children: [
                Expanded(
                    child: Container(
                        height: 75,
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5))),
                        child: Align(
                          alignment: Alignment.center,
                          child: BlocBuilder<BookingDetailPageCubit,
                                  BookingDetailPageState>(
                              builder: (context, state) =>
                                  state.status == GetRoomStatus.pending ||
                                          state.status == GetRoomStatus.failed
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              state.roomDetail != null
                                                  ? "Room ${state.roomDetail!.id}"
                                                  : '-',
                                              style: const TextStyle(
                                                  fontFamily: "Montserrat",
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              state.roomDetail != null
                                                  ? "null Guests Max"
                                                  : '-',
                                              style: const TextStyle(
                                                  fontFamily: 'Open_Sans',
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 16),
                                            )
                                          ],
                                        )
                                      : Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Room ${state.roomDetail!.id}",
                                              style: const TextStyle(
                                                  fontFamily: "Montserrat",
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              "${state.roomDetail!.capacity} Guests Max",
                                              style: const TextStyle(
                                                  fontFamily: 'Open_Sans',
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 16),
                                            )
                                          ],
                                        )),
                        )))
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Flex(
              direction: Axis.horizontal,
              children: [
                Expanded(
                    child: SizedBox(
                  height: 75,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Color(greenColor))),
                    onPressed: () => context.goNamed(RouteName.searchPage.name),
                    child: Text(
                      "Cancel",
                      style: TextStyle(color: Color(greenColor)),
                    ),
                  ),
                )),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Flex(
              direction: Axis.horizontal,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 75,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(greenColor)),
                      child: const Text("Confirm Booking"),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
