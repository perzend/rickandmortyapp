import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import '../home_page.dart';
import '../views/characters/characters_page.dart';
import '../views/characters/single_character_page.dart';
import '../views/episodes/episodes_page.dart';
import '../views/episodes/single_episode_page.dart';
import '../views/favourites_page.dart';
import '../views/locations/locations_page.dart';
import '../views/locations/single_location_page.dart';


@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/',
      page: HomePage,
      children: [
        AutoRoute(
          path: 'characters',
          name: 'CharactersRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(path: '', page: CharactersPage),
            AutoRoute(path: ':characterId', page: SingleCharacterPage),
          ],
        ),
        AutoRoute(
          path: 'episodes',
          name: 'EpisodesRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(path: '', page: EpisodesPage),
            AutoRoute(path: ':episodeId', page: SingleEpisodePage),
          ],
        ),
        AutoRoute(
          path: 'locations',
          name: 'LocationsRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(path: '', page: LocationsPage),
            AutoRoute(path: ':locationId', page: SingleLocationPage),
          ],
        ),
        AutoRoute(
          path: 'favourites',
          name: 'FavouritesRouter',
          page: FavouritesPage,
          //page: EmptyRouterPage,
          // children: [
          //   AutoRoute(path: '', page: LocationsPage),
          //   AutoRoute(path: ':locationId', page: SingleLocationPage),
          // ],
        ),
      ],
    )
  ],
)
class $AppRouter {}