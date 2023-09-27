import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meeting_room_booking/pages/booking_detail_page/page/booking_detail_page.dart';
import 'package:meeting_room_booking/pages/landing_page/page/landing_page.dart';
import 'package:meeting_room_booking/pages/login_page/page/login_page.dart';
import 'package:meeting_room_booking/pages/my_booking_page/components/booking_widget.dart';
import 'package:meeting_room_booking/pages/my_booking_page/page/my_booking_page.dart';
import 'package:meeting_room_booking/pages/search_room/page/search_room_page.dart';

class Routes {
  late final router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/',
    routes: <RouteBase>[
      GoRoute(
        name: RouteName.splashScreenPage.name,
        path: '/',
        pageBuilder: (context, state) {
          return buildPage(
            key: state.pageKey,
            child: const MeetingRoomLandingPage(),
            arguments: state.extra,
          );
        },
      ),
      GoRoute(
          name: RouteName.loginPage.name,
          path: '/login',
          pageBuilder: (context, state) {
            return buildPage(
              key: state.pageKey,
              child: const LoginPage(),
              arguments: state.extra,
            );
          }),
      GoRoute(
          name: RouteName.searchPage.name,
          path: '/search',
          pageBuilder: (context, state) {
            return buildPage(
                key: state.pageKey,
                child: const SearchRoomPage(),
                arguments: state.extra);
          }),
      GoRoute(
        name: RouteName.detailPage.name,
        path: '/detail',
        pageBuilder: (context, state) {
          BookingDetailPageArgument args =
              state.extra as BookingDetailPageArgument;
          return buildPage(
            key: state.pageKey,
            child: BookingDetailPage(args: args),
            arguments: state.extra,
          );
        },
      ),
      GoRoute(
          name: RouteName.myBookingPage.name,
          path: '/booking',
          pageBuilder: (context, state) {
            return buildPage(
                key: state.pageKey,
                child: const MyBookingPage(),
                arguments: state.extra);
          },
          routes: [
            GoRoute(
              name: RouteName.myBookingModal.name,
              path: 'modal',
              pageBuilder: (context, state) {
                BookingWidgetArguments args =
                    state.extra as BookingWidgetArguments;
                return buildPage(
                    key: state.pageKey,
                    child: BookingWidget(args: args),
                    arguments: state.extra);
              },
            )
          ])
    ],
  );
}

MaterialPage<void> buildPage({
  required Widget child,
  LocalKey? key,
  Object? arguments,
  bool disableBack = false,
}) {
  return MaterialPage<void>(
    key: key,
    child: child,
    arguments: arguments,
    fullscreenDialog: disableBack,
  );
}

enum RouteName {
  splashScreenPage,
  loginPage,
  searchPage,
  detailPage,
  myBookingPage,
  myBookingModal
}

extension RouteNameExtensions on RouteName {
  String get name {
    switch (this) {
      case RouteName.splashScreenPage:
        return 'splash screen page';
      case RouteName.loginPage:
        return 'login page';
      case RouteName.searchPage:
        return 'search page';
      case RouteName.detailPage:
        return 'detail page';
      case RouteName.myBookingPage:
        return 'my booking page';
      case RouteName.myBookingModal:
        return 'my booking modal';
      default:
        return '';
    }
  }
}
