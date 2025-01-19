// router_config.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sic_mobile_app/navigation/custom_bottom_navigation.dart';
import 'package:sic_mobile_app/pages/auth/auth_page.dart';
import 'package:sic_mobile_app/pages/auth/forgotpassword/confirm_email_page.dart';
import 'package:sic_mobile_app/pages/auth/forgotpassword/reset_password_page.dart';
import 'package:sic_mobile_app/pages/auth/forgotpassword/verification_code_page.dart';
import 'package:sic_mobile_app/pages/event_page.dart';
import 'package:sic_mobile_app/pages/home_page.dart';
import 'package:sic_mobile_app/pages/internal_server_error_page.dart';
import 'package:sic_mobile_app/pages/notfound_page.dart';
import 'package:sic_mobile_app/pages/onboarding_page.dart';
import 'package:sic_mobile_app/pages/profile_page.dart';
import 'package:sic_mobile_app/pages/schedule_page.dart';
import 'package:sic_mobile_app/routers/router_name.dart';

class RouterConfigCustom {
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: RoutersPath.onboardingPath,
        name: RoutersName.onboardingName,
        builder: (BuildContext context, GoRouterState state) {
          return const OnboardingPage();
        },
      ),
      GoRoute(
        path: RoutersPath.authPath,
        name: RoutersName.authName,
        builder: (BuildContext context, GoRouterState state) {
          final Map<String, dynamic>? extra =
              state.extra as Map<String, dynamic>?;
          final String type = extra?['type'] ?? 'login';
          final int initialTabIndex = (type == 'signup') ? 1 : 0;
          return AuthPage(initialTabIndex: initialTabIndex);
        },
      ),
      GoRoute(
        path: RoutersPath.confirmmailPath,
        name: RoutersName.confirmmailName,
        builder: (BuildContext context, GoRouterState state) {
          return const ConfirmEmailPage();
        },
      ),
      GoRoute(
        path: RoutersPath.verificationPath,
        name: RoutersName.verificationName,
        builder: (BuildContext context, GoRouterState state) {
          return const VerificationPage();
        },
      ),
      GoRoute(
        path: RoutersPath.resetpasswordPath,
        name: RoutersName.resetpasswordName,
        builder: (BuildContext context, GoRouterState state) {
          return const ResetPasswordPage();
        },
      ),
      GoRoute(
        path: RoutersPath.notfoundPath,
        name: RoutersName.notfoundName,
        builder: (BuildContext context, GoRouterState state) {
          return const NotFoundPage();
        },
      ),
      GoRoute(
        path: RoutersPath.internalservererrorPath,
        name: RoutersName.internalservererrorName,
        builder: (BuildContext context, GoRouterState state) {
          return const InternalServerErrorPage();
        },
      ),
      ShellRoute(
        builder: (context, state, child) {
          int currentIndex = 0;
          String location = state.uri.toString();

          if (location.startsWith(RoutersPath.schedulePath)) {
            currentIndex = 1;
          } else if (location.startsWith(RoutersPath.eventPath)) {
            currentIndex = 2;
          } else if (location.startsWith(RoutersPath.profilePath)) {
            currentIndex = 3;
          }
          return SafeArea(
            child: Scaffold(
              body: child,
              bottomNavigationBar:
                  CustomBottomNavBar(initialIndex: currentIndex),
            ),
          );
        },
        routes: [
          GoRoute(
            path: RoutersPath.homePath,
            name: RoutersName.homeName,
            builder: (BuildContext context, GoRouterState state) {
              return const HomePage();
            },
          ),
          GoRoute(
            path: RoutersPath.schedulePath,
            name: RoutersName.scheduleName,
            builder: (BuildContext context, GoRouterState state) {
              return const SchedulePage();
            },
          ),
          GoRoute(
            path: RoutersPath.eventPath,
            name: RoutersName.eventName,
            builder: (BuildContext context, GoRouterState state) {
              return const EventPage();
            },
          ),
          GoRoute(
            path: RoutersPath.profilePath,
            name: RoutersName.profileName,
            builder: (BuildContext context, GoRouterState state) {
              return const ProfilePage();
            },
          ),
        ],
      ),
    ],
  );
}
