import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sic_mobile_app/pages/auth/auth_page.dart';
import 'package:sic_mobile_app/pages/auth/forgotpassword/confirm_email_page.dart';
import 'package:sic_mobile_app/pages/auth/forgotpassword/reset_password_page.dart';
import 'package:sic_mobile_app/pages/auth/forgotpassword/verification_code_page.dart';
import 'package:sic_mobile_app/pages/notfound_page.dart';
import 'package:sic_mobile_app/pages/onboarding_page.dart';
import 'package:sic_mobile_app/routers/router_name.dart';

class RouterConfigCustom {
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: RoutersPath.onboardingPath,
        name: RoutersName.onboardingName,
        builder: (BuildContext context, GoRouterState state) {
          return const NotFoundPage();
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
    ],
  );
}
