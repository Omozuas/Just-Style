import 'package:go_router/go_router.dart';
import 'package:juststyle/app/router/app_routes.dart';
import 'package:juststyle/features/auth/forgot_password/view/forgot_password_screen.dart';
import 'package:juststyle/features/auth/forgot_password/view/password_changed_screen.dart';
import 'package:juststyle/features/auth/forgot_password/view/set_new_password_screen.dart';
import 'package:juststyle/features/auth/login/view/login_screen.dart';
import 'package:juststyle/features/auth/sign_up/model/sign_up_profile.dart';
import 'package:juststyle/features/auth/sign_up/view/sign_up_password_screen.dart';
import 'package:juststyle/features/auth/sign_up/view/sign_up_profile_screen.dart';
import 'package:juststyle/features/auth/verify_code/view/verify_code_screen.dart';
import 'package:juststyle/features/client/bookings/view/booking_client_screen.dart';
import 'package:juststyle/features/client/home/view/home_client_screen.dart';
import 'package:juststyle/features/client/profile/view/profile_client_screen.dart';
import 'package:juststyle/features/client/profile/view/sub_screens/account_info_screen.dart';
import 'package:juststyle/features/client/profile/view/sub_screens/all_bookings_profile.dart';
import 'package:juststyle/features/client/profile/view/sub_screens/settings_profile/settings_profile.dart';
import 'package:juststyle/features/client/profile/view/sub_screens/settings_profile/subscreen/password_manager.dart';
import 'package:juststyle/features/client/shell/view/client_bottom_navigation.dart';
import 'package:juststyle/features/client/stylists/view/stylist_client_screen.dart';
import 'package:juststyle/features/client/stylists/view/sub_screen/stylit_profile_st.dart';
import 'package:juststyle/features/onboarding/model/onboarding_page.dart';
import 'package:juststyle/features/onboarding/view/onboarding_screen.dart';
import 'package:juststyle/features/welcome/view/welcome_screen.dart';
import 'package:juststyle/features/stylist/appointments/view/stylist_appointment_screen.dart';
import 'package:juststyle/features/stylist/clients/view/client_stylist_screen.dart';
import 'package:juststyle/features/stylist/home/view/stylist_home_screen.dart';
import 'package:juststyle/features/stylist/profile/view/profile_stylist_sxcreen.dart';
import 'package:juststyle/features/stylist/shell/view/stylist_bottom_nav.dart';

final appRouter = GoRouter(
  initialLocation: AppRoutes.welcome,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return BaseClientScreen(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.home,
              builder: (context, state) => const HomeClientScreen(),
              routes: [
                GoRoute(
                  path: 'stylist',
                  builder: (context, state) => const StylitProfileSt(),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.bookings,
              builder: (context, state) => const BookingClientScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.stylists,
              builder: (context, state) => const StylistClientScreen(),
              routes: [
                GoRoute(
                  path: 'profile',
                  builder: (context, state) => const StylitProfileSt(),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.profile,
              builder: (context, state) => const ProfileClientScreen(),
              routes: [
                GoRoute(
                  path: 'account',
                  builder: (context, state) => const AccountInfoScreen(),
                ),
                GoRoute(
                  path: 'bookings',
                  builder: (context, state) => const AllBookingsProfile(),
                ),
                GoRoute(
                  path: 'settings',
                  builder: (context, state) => const SettingsProfile(),
                  routes: [
                    GoRoute(
                      path: 'password',
                      builder: (context, state) => const PasswordManager(),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return StylistBottomNavScreen(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.stylistHome,
              builder: (context, state) => const StylistHomeScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.stylistAppointments,
              builder: (context, state) => const StylistAppointmentScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.stylistClients,
              builder: (context, state) => const ClientStylistScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.stylistProfile,
              builder: (context, state) => const ProfileStylistSxcreen(),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: AppRoutes.welcome,
      builder: (context, state) => const WelcomeScreen(),
    ),
    GoRoute(
      path: AppRoutes.onboarding,
      builder: (context, state) => OnboardingScreen(
        pages: onboardingPages,
        onLogin: () => context.go(AppRoutes.login),
        onSignUp: () => context.go(AppRoutes.signUp),
      ),
    ),
    GoRoute(
      path: AppRoutes.login,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: AppRoutes.signUp,
      builder: (context, state) => const SignUpProfileScreen(),
    ),
    GoRoute(
      path: AppRoutes.signUpPassword,
      builder: (context, state) {
        final extra = state.extra;
        final profile = extra is SignUpProfile ? extra : null;
        if (profile == null) return const SignUpProfileScreen();
        return SignUpPasswordScreen(profile: profile);
      },
    ),
    GoRoute(
      path: AppRoutes.verifyOtp,
      builder: (context, state) {
        final extra = state.extra;
        final email = extra is String ? extra : '';
        return VerifyCodeScreen(email: email);
      },
    ),
    GoRoute(
      path: AppRoutes.forgotPassword,
      builder: (context, state) => const ForgotPasswordScreen(),
    ),
    GoRoute(
      path: AppRoutes.verifyResetCode,
      builder: (context, state) {
        final extra = state.extra;
        final email = extra is String ? extra : '';
        return VerifyCodeScreen(
          email: email,
          buttonLabel: 'Proceed',
          onVerified: () => context.push(AppRoutes.newPassword),
        );
      },
    ),
    GoRoute(
      path: AppRoutes.newPassword,
      builder: (context, state) => const SetNewPasswordScreen(),
    ),
    GoRoute(
      path: AppRoutes.passwordSuccess,
      builder: (context, state) => const PasswordChangedScreen(),
    ),
  ],
);
