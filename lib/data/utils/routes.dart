import 'package:get/get.dart';

import 'package:starter_template_get_x/main.dart';
import 'package:starter_template_get_x/config/config.dart';
import 'package:starter_template_get_x/data/data.dart';
import 'package:starter_template_get_x/data/utils/custom_popup.dart';
import 'package:starter_template_get_x/presentation/presentation.dart';

class Routes {
  Routes._();

  static const String initialRoute = '/';
  static const String examplePayment = '/example-payment';

  static const String minAppVersion = '1.0.0';
  static List<GetMiddleware> defaultMiddleware = [AuthMiddleware()];

  static List<GetPage<dynamic>> routes = [

    GetPage(
      name: initialRoute,
      page: () => const CustomExamplesPage(),
    ),
    GetPage(
      name: examplePayment,
      page: () => const PaymentExamples(),
    ),

    // TODO: Implement force upgrade
    // GetPage(
    //   name: login,
    //   binding: AuthBinding(),
    //   page: () {
    //     if(!kIsWeb){
    //      return UpgradeAlert(
    //           dialogStyle: UpgradeDialogStyle.cupertino,
    //           canDismissDialog: false,
    //           showLater: false,
    //           showIgnore: false,
    //           upgrader: Upgrader(
    //             minAppVersion: minAppVersion,
    //           ),
    //           child: const LoginView());
    //     }else {
    //      return const LoginView();
    //     }
    //   }
    // ),
    // TODO: Normal page redirection
    // GetPage(
    //   name: privacyPolicy,
    //   page: () => const PrivatePolicyView(),
    // ),

    // TODO: Following is the breakpoints logic
    // GetPage(
    //   name: scoreBoard,
    //   binding: ScoreBoardBinding(),
    //   page: () {
    //     return const ResponsiveBreakpoints(
    //       landscapePlatforms: [],
    //       breakpoints: [
    //         Breakpoint(
    //           start: 0,
    //           end: 360,
    //           name: Constants.smallDevice,
    //         ),
    //         Breakpoint(
    //           start: 361,
    //           end: 420,
    //           name: MOBILE,
    //         ),
    //         Breakpoint(
    //           start: 421,
    //           end: 760,
    //           name: Constants.smallTablet,
    //         ),
    //         Breakpoint(
    //           start: 761,
    //           end: 1023,
    //           name: TABLET,
    //         ),
    //         Breakpoint(
    //           start: 1024,
    //           end: 1439,
    //           name: Constants.smallLaptop,
    //         ),
    //         Breakpoint(
    //           start: 1440,
    //           end: double.infinity,
    //           name: DESKTOP,
    //         ),
    //       ],
    //       child: TournamentScoreBoardPage(),
    //     );
    //     return const TournamentScoreBoardPage();
    //   },
    //   middlewares: defaultMiddleware +
    //       [
    //         ScoreBoardMiddleware(),
    //       ],
    // ),
  ];
}
