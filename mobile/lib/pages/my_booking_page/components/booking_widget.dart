import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../models/booking.dart';

class BookingWidgetArguments {
  const BookingWidgetArguments({
    required this.id,
    required this.status,
    required this.bookingNo,
    required this.roomNo,
    required this.maxGuest,
    required this.startAt,
    required this.endAt,
  });
  final int id;
  final BookingStatus status;
  final String bookingNo;
  final String roomNo;
  final int maxGuest;
  final DateTime startAt;
  final DateTime endAt;
}

class BookingWidget extends StatelessWidget {
  const BookingWidget(
      {super.key,
      // required this.id,
      // required this.status,
      // required this.bookingNo,
      // required this.roomNo,
      // required this.maxGuest,
      // required this.startAt,
      // required this.endAt,
      required this.args});
  final BookingWidgetArguments args;
  // final int id;
  // final BookingStatus status;
  // final String bookingNo;
  // final String roomNo;
  // final int maxGuest;
  // final DateTime startAt;
  // final DateTime endAt;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), border: Border.all()),
        width: MediaQuery.of(context).size.width,
        height: args.status == BookingStatus.reserved ? 193 : 130,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Flex(
            direction: Axis.vertical,
            children: [
              Flex(
                direction: Axis.horizontal,
                children: [
                  Expanded(
                    child: Text(
                      "Booking No. $args.bookingNo",
                      style: const TextStyle(
                          fontFamily: "Open_Sans",
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Flex(direction: Axis.horizontal, children: [
                Expanded(
                  child: Text(
                    "Room $args.roomNo",
                    style: const TextStyle(
                        fontFamily: "Open_Sans",
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Text(
                    "${args.maxGuest.toString()} Max Guest",
                    style: const TextStyle(
                        fontFamily: "Open_Sans",
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                )
              ]),
              const SizedBox(
                height: 15,
              ),
              Flex(
                direction: Axis.horizontal,
                children: [
                  Expanded(
                    child: Text(
                      DateFormat.yMMMMd().format(args.startAt),
                      style: const TextStyle(
                          fontFamily: "Open_Sans",
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Text(
                      "${DateFormat.Hm().format(args.startAt).toString()} - ${DateFormat.Hm().format(args.endAt).toString()}",
                      style: const TextStyle(
                          fontFamily: "Open_Sans",
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              if (args.status == BookingStatus.reserved)
                Flex(
                  direction: Axis.horizontal,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => showDialog(
                            context: context,
                            builder: (context) => CancelDialog(
                                  id: args.id,
                                  bookingNo: args.bookingNo,
                                )),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent),
                        child: const Text(
                          'Cancel',
                          style: TextStyle(
                              fontFamily: "Open_Sans",
                              fontWeight: FontWeight.w700,
                              fontSize: 16),
                        ),
                      ),
                    )
                  ],
                )
            ],
          ),
        ));
  }
}

class CancelDialog extends StatelessWidget {
  const CancelDialog({super.key, required this.id, required this.bookingNo});

  final int id;
  final String bookingNo;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(0),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: SizedBox(
          height: 485,
          width: MediaQuery.of(context).size.width * 0.8,
          child: Flex(
            direction: Axis.vertical,
            children: [
              Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Cancel Booking",
                    style: TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w600,
                        fontSize: 28),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Booking No. $bookingNo",
                    style: const TextStyle(
                        fontFamily: "Open_Sans",
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Flex(
                direction: Axis.horizontal,
                children: const [
                  Expanded(
                      child: Text(
                    "If you cancel this booking, you will lose your reservation. \n\nAre you sure you want to cancel your booking?",
                    style: TextStyle(
                        fontFamily: "Open_Sans",
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ))
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Flex(
                direction: Axis.horizontal,
                children: [
                  Expanded(
                      child: SizedBox(
                    height: 75,
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                          color: Colors.redAccent,
                        ),
                      ),
                      child: const Text("No, keep my booking.",
                          style: TextStyle(color: Colors.redAccent)),
                    ),
                  ))
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
                            backgroundColor: Colors.redAccent),
                        child: const Text("Yes, cancel booking"),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
