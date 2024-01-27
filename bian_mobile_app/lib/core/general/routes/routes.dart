import 'package:bian_mobile_app/core/general/models/quran.dart';
import 'package:bian_mobile_app/features/home/view/home_view.dart';
import 'package:bian_mobile_app/features/splash_screen/splash_screen_page.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../features/lemma/view/lemmas_view.dart';
import '../../../features/phrase_structure/views/phase_structure_view.dart';
import '../../../features/roots_and_patterns/features/roots_and_patterns_details/view/roots_and_patterns_details_view.dart';
import '../../../features/roots_and_patterns/view/roots_and_patterns_view.dart';
import 'navigator_service.dart';

final GlobalKey<NavigatorState> rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

final routerProvider = Provider<GoRouter>((ref) {
  final router = RouterNotifier(ref);
  return GoRouter(
      debugLogDiagnostics: true,
      refreshListenable: router,
      initialLocation: SplashView.path,
      navigatorKey: rootNavigatorKey,
      redirect: router._redirectLogic,
      routes: router._routes);
});

class RouterNotifier extends ChangeNotifier {
  final Ref _ref;

  RouterNotifier(this._ref) {}
  static List<String> noAuthenticationRequiredList = [];

  String? _redirectLogic(BuildContext context, GoRouterState state) {
    NavigationService.instance.updateCurrentContext(context);
    return null;
  }

  List<RouteBase> get _routes => [
        GoRoute(
          name: SplashView.routeName,
          path: SplashView.path,
          builder: (context, state) => const SplashView(),
        ),
        GoRoute(
          name: RootsAndPatternsView.routeName,
          path: RootsAndPatternsView.path,
          builder: (context, state) => const RootsAndPatternsView(),
        ),
        GoRoute(
          name: LemmasView.routeName,
          path: LemmasView.path,
          builder: (context, state) => const LemmasView(),
        ),
        GoRoute(
          name: HomeView.routeName,
          path: HomeView.path,
          builder: (context, state) => const HomeView(),
        ),
        GoRoute(
          name: PhaseStructureView.routeName,
          path: PhaseStructureView.path,
          builder: (context, state) => const PhaseStructureView(),
        ),
        GoRoute(
          name: RootsAndPatternsDetailsView.routeName,
          path: RootsAndPatternsDetailsView.path,
          builder: (context, state) {
            final QuranModel model = state.extra as QuranModel;
            return RootsAndPatternsDetailsView(quranModel: model,);
          },
        ),
        // GoRoute(
        //   name: ChatPage.routeName,
        //   path: ChatPage.path,
        //   builder: (context, state) {
        //     final ChatControllerModel chatControllerModel =
        //         state.extra! as ChatControllerModel;
        //     return ChatPage(
        //       chatControllerModel: chatControllerModel,
        //     );
        //   },
        // ),
        // GoRoute(
        //   name: VerifyOtpView.routeName,
        //   path: VerifyOtpView.path,
        //   builder: (context, state) {
        //     final String phoneNumber = state.params['phone_number'].toString();
        //     return VerifyOtpView(phoneNumber);
        //   },
        // ),

        // GoRoute(
        //   name: SignInView.routeName,
        //   path: SignInView.path,
        //   parentNavigatorKey: rootNavigatorKey,
        //   builder: (context, state) => const SignInView(),
        // ),
        // GoRoute(
        //   name: SignInView.routeName,
        //   path: SignInView.path,
        //   builder: (context, state) => const SignInView(),
        // ),
        // GoRoute(
        //   name: LeaderBoardParticipantsDetailsView.routeName,
        //   path: LeaderBoardParticipantsDetailsView.path,
        //   parentNavigatorKey: rootNavigatorKey,
        //   builder: (context, state) {
        //     final id = int.parse(state.pathParameters["id"]!);
        //     return LeaderBoardParticipantsDetailsView(
        //       id: id,
        //     );
        //   },
        // ),
      ];
}
