// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:ip_2025_08_flutter_knowledge/app/pages/canvas/canvas.dart'
    as _i1;
import 'package:ip_2025_08_flutter_knowledge/app/pages/global/global.dart'
    as _i2;
import 'package:ip_2025_08_flutter_knowledge/app/pages/home/home.dart' as _i3;
import 'package:ip_2025_08_flutter_knowledge/app/pages/overview/overview.dart'
    as _i4;
import 'package:ip_2025_08_flutter_knowledge/app/pages/streams/streams.dart'
    as _i5;

/// generated route for
/// [_i1.CanvasPage]
class CanvasRoute extends _i6.PageRouteInfo<void> {
  const CanvasRoute({List<_i6.PageRouteInfo>? children})
      : super(CanvasRoute.name, initialChildren: children);

  static const String name = 'CanvasRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i1.CanvasPage();
    },
  );
}

/// generated route for
/// [_i2.GlobalPage]
class GlobalRoute extends _i6.PageRouteInfo<GlobalRouteArgs> {
  GlobalRoute({
    _i7.Key? key,
    required String title,
    required String description,
    bool isNamedConstructor = false,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          GlobalRoute.name,
          args: GlobalRouteArgs(
            key: key,
            title: title,
            description: description,
            isNamedConstructor: isNamedConstructor,
          ),
          rawPathParams: {
            'title': title,
            'description': description,
            'isNamedConstructor': isNamedConstructor,
          },
          initialChildren: children,
        );

  static const String name = 'GlobalRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<GlobalRouteArgs>(
        orElse: () => GlobalRouteArgs(
          title: pathParams.getString('title'),
          description: pathParams.getString('description'),
          isNamedConstructor: pathParams.getBool('isNamedConstructor', false),
        ),
      );
      return _i2.GlobalPage(
        key: args.key,
        title: args.title,
        description: args.description,
        isNamedConstructor: args.isNamedConstructor,
      );
    },
  );
}

class GlobalRouteArgs {
  const GlobalRouteArgs({
    this.key,
    required this.title,
    required this.description,
    this.isNamedConstructor = false,
  });

  final _i7.Key? key;

  final String title;

  final String description;

  final bool isNamedConstructor;

  @override
  String toString() {
    return 'GlobalRouteArgs{key: $key, title: $title, description: $description, isNamedConstructor: $isNamedConstructor}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! GlobalRouteArgs) return false;
    return key == other.key &&
        title == other.title &&
        description == other.description &&
        isNamedConstructor == other.isNamedConstructor;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      title.hashCode ^
      description.hashCode ^
      isNamedConstructor.hashCode;
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
      : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i3.HomePage();
    },
  );
}

/// generated route for
/// [_i4.OverviewPage]
class OverviewRoute extends _i6.PageRouteInfo<void> {
  const OverviewRoute({List<_i6.PageRouteInfo>? children})
      : super(OverviewRoute.name, initialChildren: children);

  static const String name = 'OverviewRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i4.OverviewPage();
    },
  );
}

/// generated route for
/// [_i5.StreamPage]
class StreamRoute extends _i6.PageRouteInfo<void> {
  const StreamRoute({List<_i6.PageRouteInfo>? children})
      : super(StreamRoute.name, initialChildren: children);

  static const String name = 'StreamRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i5.StreamPage();
    },
  );
}
