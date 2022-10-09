// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:auto_route/empty_router_widgets.dart' as _i2;
import 'package:flutter/material.dart' as _i11;

import '../home_page.dart' as _i1;
import '../views/characters/characters_page.dart' as _i4;
import '../views/characters/single_character_page.dart' as _i5;
import '../views/episodes/episodes_page.dart' as _i6;
import '../views/episodes/single_episode_page.dart' as _i7;
import '../views/favourites_page.dart' as _i3;
import '../views/locations/locations_page.dart' as _i8;
import '../views/locations/single_location_page.dart' as _i9;

class AppRouter extends _i10.RootStackRouter {
  AppRouter([_i11.GlobalKey<_i11.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.HomePage(),
      );
    },
    CharactersRouter.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.EmptyRouterPage(),
      );
    },
    EpisodesRouter.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.EmptyRouterPage(),
      );
    },
    LocationsRouter.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.EmptyRouterPage(),
      );
    },
    FavouritesRouter.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.FavouritesPage(),
      );
    },
    CharactersRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.CharactersPage(),
      );
    },
    SingleCharacterRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<SingleCharacterRouteArgs>(
          orElse: () =>
              SingleCharacterRouteArgs(character: pathParams.get('character')));
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.SingleCharacterPage(
          key: args.key,
          character: args.character,
        ),
      );
    },
    EpisodesRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.EpisodesPage(),
      );
    },
    SingleEpisodeRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<SingleEpisodeRouteArgs>(
          orElse: () =>
              SingleEpisodeRouteArgs(episode: pathParams.get('episode')));
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i7.SingleEpisodePage(
          key: args.key,
          episode: args.episode,
        ),
      );
    },
    LocationsRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.LocationsPage(),
      );
    },
    SingleLocationRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<SingleLocationRouteArgs>(
          orElse: () =>
              SingleLocationRouteArgs(location: pathParams.get('location')));
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i9.SingleLocationPage(
          key: args.key,
          location: args.location,
        ),
      );
    },
  };

  @override
  List<_i10.RouteConfig> get routes => [
        _i10.RouteConfig(
          HomeRoute.name,
          path: '/',
          children: [
            _i10.RouteConfig(
              CharactersRouter.name,
              path: 'characters',
              parent: HomeRoute.name,
              children: [
                _i10.RouteConfig(
                  CharactersRoute.name,
                  path: '',
                  parent: CharactersRouter.name,
                ),
                _i10.RouteConfig(
                  SingleCharacterRoute.name,
                  path: ':character',
                  parent: CharactersRouter.name,
                ),
              ],
            ),
            _i10.RouteConfig(
              EpisodesRouter.name,
              path: 'episodes',
              parent: HomeRoute.name,
              children: [
                _i10.RouteConfig(
                  EpisodesRoute.name,
                  path: '',
                  parent: EpisodesRouter.name,
                ),
                _i10.RouteConfig(
                  SingleEpisodeRoute.name,
                  path: ':episode',
                  parent: EpisodesRouter.name,
                ),
              ],
            ),
            _i10.RouteConfig(
              LocationsRouter.name,
              path: 'locations',
              parent: HomeRoute.name,
              children: [
                _i10.RouteConfig(
                  LocationsRoute.name,
                  path: '',
                  parent: LocationsRouter.name,
                ),
                _i10.RouteConfig(
                  SingleLocationRoute.name,
                  path: ':location',
                  parent: LocationsRouter.name,
                ),
              ],
            ),
            _i10.RouteConfig(
              FavouritesRouter.name,
              path: 'favourites',
              parent: HomeRoute.name,
            ),
          ],
        )
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i10.PageRouteInfo<void> {
  const HomeRoute({List<_i10.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class CharactersRouter extends _i10.PageRouteInfo<void> {
  const CharactersRouter({List<_i10.PageRouteInfo>? children})
      : super(
          CharactersRouter.name,
          path: 'characters',
          initialChildren: children,
        );

  static const String name = 'CharactersRouter';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class EpisodesRouter extends _i10.PageRouteInfo<void> {
  const EpisodesRouter({List<_i10.PageRouteInfo>? children})
      : super(
          EpisodesRouter.name,
          path: 'episodes',
          initialChildren: children,
        );

  static const String name = 'EpisodesRouter';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class LocationsRouter extends _i10.PageRouteInfo<void> {
  const LocationsRouter({List<_i10.PageRouteInfo>? children})
      : super(
          LocationsRouter.name,
          path: 'locations',
          initialChildren: children,
        );

  static const String name = 'LocationsRouter';
}

/// generated route for
/// [_i3.FavouritesPage]
class FavouritesRouter extends _i10.PageRouteInfo<void> {
  const FavouritesRouter()
      : super(
          FavouritesRouter.name,
          path: 'favourites',
        );

  static const String name = 'FavouritesRouter';
}

/// generated route for
/// [_i4.CharactersPage]
class CharactersRoute extends _i10.PageRouteInfo<void> {
  const CharactersRoute()
      : super(
          CharactersRoute.name,
          path: '',
        );

  static const String name = 'CharactersRoute';
}

/// generated route for
/// [_i5.SingleCharacterPage]
class SingleCharacterRoute
    extends _i10.PageRouteInfo<SingleCharacterRouteArgs> {
  SingleCharacterRoute({
    _i11.Key? key,
    required dynamic character,
  }) : super(
          SingleCharacterRoute.name,
          path: ':character',
          args: SingleCharacterRouteArgs(
            key: key,
            character: character,
          ),
          rawPathParams: {'character': character},
        );

  static const String name = 'SingleCharacterRoute';
}

class SingleCharacterRouteArgs {
  const SingleCharacterRouteArgs({
    this.key,
    required this.character,
  });

  final _i11.Key? key;

  final dynamic character;

  @override
  String toString() {
    return 'SingleCharacterRouteArgs{key: $key, character: $character}';
  }
}

/// generated route for
/// [_i6.EpisodesPage]
class EpisodesRoute extends _i10.PageRouteInfo<void> {
  const EpisodesRoute()
      : super(
          EpisodesRoute.name,
          path: '',
        );

  static const String name = 'EpisodesRoute';
}

/// generated route for
/// [_i7.SingleEpisodePage]
class SingleEpisodeRoute extends _i10.PageRouteInfo<SingleEpisodeRouteArgs> {
  SingleEpisodeRoute({
    _i11.Key? key,
    required dynamic episode,
  }) : super(
          SingleEpisodeRoute.name,
          path: ':episode',
          args: SingleEpisodeRouteArgs(
            key: key,
            episode: episode,
          ),
          rawPathParams: {'episode': episode},
        );

  static const String name = 'SingleEpisodeRoute';
}

class SingleEpisodeRouteArgs {
  const SingleEpisodeRouteArgs({
    this.key,
    required this.episode,
  });

  final _i11.Key? key;

  final dynamic episode;

  @override
  String toString() {
    return 'SingleEpisodeRouteArgs{key: $key, episode: $episode}';
  }
}

/// generated route for
/// [_i8.LocationsPage]
class LocationsRoute extends _i10.PageRouteInfo<void> {
  const LocationsRoute()
      : super(
          LocationsRoute.name,
          path: '',
        );

  static const String name = 'LocationsRoute';
}

/// generated route for
/// [_i9.SingleLocationPage]
class SingleLocationRoute extends _i10.PageRouteInfo<SingleLocationRouteArgs> {
  SingleLocationRoute({
    _i11.Key? key,
    required dynamic location,
  }) : super(
          SingleLocationRoute.name,
          path: ':location',
          args: SingleLocationRouteArgs(
            key: key,
            location: location,
          ),
          rawPathParams: {'location': location},
        );

  static const String name = 'SingleLocationRoute';
}

class SingleLocationRouteArgs {
  const SingleLocationRouteArgs({
    this.key,
    required this.location,
  });

  final _i11.Key? key;

  final dynamic location;

  @override
  String toString() {
    return 'SingleLocationRouteArgs{key: $key, location: $location}';
  }
}
