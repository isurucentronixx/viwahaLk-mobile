/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $LibGen {
  const $LibGen();

  $LibAssetsGen get assets => const $LibAssetsGen();
}

class $AssetsTranslationsGen {
  const $AssetsTranslationsGen();

  /// File path: assets/translations/en.json
  String get en => 'assets/translations/en.json';

  /// File path: assets/translations/si.json
  String get si => 'assets/translations/si.json';

  /// File path: assets/translations/ta.json
  String get ta => 'assets/translations/ta.json';

  /// List of all assets
  List<String> get values => [en, si, ta];
}

class $LibAssetsGen {
  const $LibAssetsGen();

  $LibAssetsImagesGen get images => const $LibAssetsImagesGen();
}

class $LibAssetsImagesGen {
  const $LibAssetsImagesGen();

  /// File path: lib/assets/images/Decorations.png
  AssetGenImage get decorations =>
      const AssetGenImage('lib/assets/images/Decorations.png');

  /// File path: lib/assets/images/Dressing.png
  AssetGenImage get dressing =>
      const AssetGenImage('lib/assets/images/Dressing.png');

  /// File path: lib/assets/images/Entertainment.png
  AssetGenImage get entertainment =>
      const AssetGenImage('lib/assets/images/Entertainment.png');

  /// File path: lib/assets/images/Food.png
  AssetGenImage get food => const AssetGenImage('lib/assets/images/Food.png');

  /// File path: lib/assets/images/Honeymoon.png
  AssetGenImage get honeymoon =>
      const AssetGenImage('lib/assets/images/Honeymoon.png');

  /// File path: lib/assets/images/Jewelry.png
  AssetGenImage get jewelry =>
      const AssetGenImage('lib/assets/images/Jewelry.png');

  /// File path: lib/assets/images/Makeup.png
  AssetGenImage get makeup =>
      const AssetGenImage('lib/assets/images/Makeup.png');

  /// File path: lib/assets/images/Music.png
  AssetGenImage get music => const AssetGenImage('lib/assets/images/Music.png');

  /// File path: lib/assets/images/Others.png
  AssetGenImage get others =>
      const AssetGenImage('lib/assets/images/Others.png');

  /// File path: lib/assets/images/Photography.png
  AssetGenImage get photography =>
      const AssetGenImage('lib/assets/images/Photography.png');

  /// File path: lib/assets/images/WeddingCars.png
  AssetGenImage get weddingCars =>
      const AssetGenImage('lib/assets/images/WeddingCars.png');

  /// File path: lib/assets/images/WeddingVenues.png
  AssetGenImage get weddingVenues =>
      const AssetGenImage('lib/assets/images/WeddingVenues.png');

  /// File path: lib/assets/images/color-logo.png
  AssetGenImage get colorLogo =>
      const AssetGenImage('lib/assets/images/color-logo.png');

  /// File path: lib/assets/images/couple.png
  AssetGenImage get couple =>
      const AssetGenImage('lib/assets/images/couple.png');

  /// File path: lib/assets/images/facebook.png
  AssetGenImage get facebook =>
      const AssetGenImage('lib/assets/images/facebook.png');

  $LibAssetsImagesFormGen get form => const $LibAssetsImagesFormGen();

  /// File path: lib/assets/images/google-logo.png
  AssetGenImage get googleLogo =>
      const AssetGenImage('lib/assets/images/google-logo.png');

  /// File path: lib/assets/images/logo-nav.png
  AssetGenImage get logoNav =>
      const AssetGenImage('lib/assets/images/logo-nav.png');

  /// File path: lib/assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('lib/assets/images/logo.png');

  /// File path: lib/assets/images/logo_dark.png
  AssetGenImage get logoDark =>
      const AssetGenImage('lib/assets/images/logo_dark.png');

  /// File path: lib/assets/images/no-profile.png
  AssetGenImage get noProfile =>
      const AssetGenImage('lib/assets/images/no-profile.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        decorations,
        dressing,
        entertainment,
        food,
        honeymoon,
        jewelry,
        makeup,
        music,
        others,
        photography,
        weddingCars,
        weddingVenues,
        colorLogo,
        couple,
        facebook,
        googleLogo,
        logoNav,
        logo,
        logoDark,
        noProfile
      ];
}

class $LibAssetsImagesFormGen {
  const $LibAssetsImagesFormGen();

  /// File path: lib/assets/images/form/AddGalleryImg.png.png
  AssetGenImage get addGalleryImgPng =>
      const AssetGenImage('lib/assets/images/form/AddGalleryImg.png.png');

  /// File path: lib/assets/images/form/addMainImg.png.png
  AssetGenImage get addMainImgPng =>
      const AssetGenImage('lib/assets/images/form/addMainImg.png.png');

  /// List of all assets
  List<AssetGenImage> get values => [addGalleryImgPng, addMainImgPng];
}

class Assets {
  Assets._();

  static const $AssetsTranslationsGen translations = $AssetsTranslationsGen();
  static const $LibGen lib = $LibGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

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
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
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

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
