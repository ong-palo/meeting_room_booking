import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meeting_room_booking/pages/login_page/page/login_page.dart';
import 'package:meeting_room_booking/pages/search_room/page/search_room_page.dart';
import 'package:meeting_room_booking/routes.dart';

class MeetingRoomLandingPage extends StatefulWidget {
  const MeetingRoomLandingPage({super.key});

  @override
  State<MeetingRoomLandingPage> createState() => _MeetingRoomLandingPageState();
}

class _MeetingRoomLandingPageState extends State<MeetingRoomLandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key("landing_page"),
      body: Stack(
        children: [
          // back layer
          Stack(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Image.asset(
                  'assets/images/meeting_room.png',
                  fit: BoxFit.fitHeight,
                ),
              ),
              Positioned(
                top: 50,
                left: 20,
                child: Image.asset(
                  'assets/images/palo_logo.png',
                  fit: BoxFit.fitHeight,
                  key: const Key("landing_page_palo_logo"),
                ),
              )
            ],
          ),
          // front layer
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 130,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 22.0),
                child: Text(
                  'Meeting\nRoom Booking',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    height: 1.5,
                  ),
                ),
              ),
              const Spacer(),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 48,
                    ),
                    const SizedBox(
                      height: 144,
                      child: Text(
                        'Let’s make a meeting room booking easier. Meeting Room Booking will help you to ensure you will have a room for your meeting. Manage reservation, cancellation. ongogin or finised booking.',
                        style: TextStyle(
                          fontFamily: 'Open Sans',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                          color: Colors.black,
                        ),
                        softWrap: true,
                        key: Key("landing_page_intro_text"),
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 75,
                            child: ElevatedButton(
                              key: const Key("landing_page_login_button"),
                              style: ElevatedButton.styleFrom(
                                splashFactory: NoSplash.splashFactory,
                                backgroundColor: const Color(0xFF5CC99B),
                              ),
                              onPressed: () =>
                                  context.pushNamed(RouteName.loginPage.name),
                              // Navigator.of(context).push(
                              //   MaterialPageRoute(
                              //     builder: (_) =>
                              //         const LoginPage(), // const SearchRoomPage(),
                              //   ),
                              // ),
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  height: 1.5,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 75,
                            child: OutlinedButton(
                              key: const Key("landing_page_sign_up_button"),
                              style: OutlinedButton.styleFrom(
                                splashFactory: NoSplash.splashFactory,
                                side: const BorderSide(
                                  color: Color(0xFF5CC99B),
                                  width: 1,
                                ),
                              ),
                              onPressed: () {},
                              child: const Text(
                                'Sign up',
                                style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  height: 1.5,
                                  color: Color(0xFF5CC99B),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
