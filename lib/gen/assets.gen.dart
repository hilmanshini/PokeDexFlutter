// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// Directory path: assets/fonts/larsseit-font-family
  $AssetsFontsLarsseitFontFamilyGen get larsseitFontFamily =>
      const $AssetsFontsLarsseitFontFamilyGen();
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/bulba.gif
  AssetGenImage get bulba => const AssetGenImage('assets/images/bulba.gif');

  /// File path: assets/images/female.svg
  String get female => 'assets/images/female.svg';

  /// File path: assets/images/male.svg
  String get male => 'assets/images/male.svg';

  /// File path: assets/images/pokeball-pokemon-svgrepo-com.svg
  String get pokeballPokemonSvgrepoCom =>
      'assets/images/pokeball-pokemon-svgrepo-com.svg';

  /// File path: assets/images/pokeball.svg
  String get pokeball => 'assets/images/pokeball.svg';

  /// File path: assets/images/top_right_icon.png
  AssetGenImage get topRightIcon =>
      const AssetGenImage('assets/images/top_right_icon.png');

  /// List of all assets
  List<dynamic> get values => [
    bulba,
    female,
    male,
    pokeballPokemonSvgrepoCom,
    pokeball,
    topRightIcon,
  ];
}

class $AssetsQueryGen {
  const $AssetsQueryGen();

  /// File path: assets/query/list_all.query
  String get listAll => 'assets/query/list_all.query';

  /// List of all assets
  List<String> get values => [listAll];
}

class $AssetsFontsLarsseitFontFamilyGen {
  const $AssetsFontsLarsseitFontFamilyGen();

  /// File path: assets/fonts/larsseit-font-family/Larsseit.otf
  String get larsseit => 'assets/fonts/larsseit-font-family/Larsseit.otf';

  /// File path: assets/fonts/larsseit-font-family/LarsseitBold.otf
  String get larsseitBold =>
      'assets/fonts/larsseit-font-family/LarsseitBold.otf';

  /// File path: assets/fonts/larsseit-font-family/LarsseitBoldItalic.otf
  String get larsseitBoldItalic =>
      'assets/fonts/larsseit-font-family/LarsseitBoldItalic.otf';

  /// File path: assets/fonts/larsseit-font-family/LarsseitExtraBold.otf
  String get larsseitExtraBold =>
      'assets/fonts/larsseit-font-family/LarsseitExtraBold.otf';

  /// File path: assets/fonts/larsseit-font-family/LarsseitExtraBoldItalic.otf
  String get larsseitExtraBoldItalic =>
      'assets/fonts/larsseit-font-family/LarsseitExtraBoldItalic.otf';

  /// File path: assets/fonts/larsseit-font-family/LarsseitItalic.otf
  String get larsseitItalic =>
      'assets/fonts/larsseit-font-family/LarsseitItalic.otf';

  /// File path: assets/fonts/larsseit-font-family/LarsseitLight.otf
  String get larsseitLight =>
      'assets/fonts/larsseit-font-family/LarsseitLight.otf';

  /// File path: assets/fonts/larsseit-font-family/LarsseitLightItalic.otf
  String get larsseitLightItalic =>
      'assets/fonts/larsseit-font-family/LarsseitLightItalic.otf';

  /// File path: assets/fonts/larsseit-font-family/LarsseitMedium.otf
  String get larsseitMedium =>
      'assets/fonts/larsseit-font-family/LarsseitMedium.otf';

  /// File path: assets/fonts/larsseit-font-family/LarsseitMediumItalic.otf
  String get larsseitMediumItalic =>
      'assets/fonts/larsseit-font-family/LarsseitMediumItalic.otf';

  /// File path: assets/fonts/larsseit-font-family/LarsseitThin.otf
  String get larsseitThin =>
      'assets/fonts/larsseit-font-family/LarsseitThin.otf';

  /// File path: assets/fonts/larsseit-font-family/LarsseitThinItalic.otf
  String get larsseitThinItalic =>
      'assets/fonts/larsseit-font-family/LarsseitThinItalic.otf';

  /// List of all assets
  List<String> get values => [
    larsseit,
    larsseitBold,
    larsseitBoldItalic,
    larsseitExtraBold,
    larsseitExtraBoldItalic,
    larsseitItalic,
    larsseitLight,
    larsseitLightItalic,
    larsseitMedium,
    larsseitMediumItalic,
    larsseitThin,
    larsseitThinItalic,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsQueryGen query = $AssetsQueryGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
