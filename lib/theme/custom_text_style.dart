import 'package:tdc_mobile/core/app_export.dart';

class CustomTextStyles {
  static get bodyLargePrimary => theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.primary,
      );

  static get bodyLargeRed400 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.red400,
      );

  static get bodyLarge18 => theme.textTheme.bodyLarge!.copyWith(
        fontSize: 18.fSize,
      );

  static get bodyLarge18Blue500 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.blue500,
        fontSize: 18.fSize,
      );

  static get bodyLarge18Black90001 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.black90001,
        fontSize: 18.fSize,
      );

  static get bodyMediumBlueGray400 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.blueGray400,
      );

  static get bodyMediumBlueGray40018 => theme.textTheme.bodyMedium!.copyWith(
        fontSize: 18.fSize,
        color: appTheme.blueGray400,
      );

  static get titleLargeBlueGray40016 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.blueGray400,
        fontSize: 16.fSize,
      );

  static get titleLargeWhite18 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.white,
        fontSize: 18.fSize,
      );

  static get titleLarge16Gray900 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray900,
        fontSize: 16.fSize,
      );
  static get titleLarge16Blue500 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.blue500,
        fontSize: 16.fSize,
      );

  //600
  static get titleLarge18Gray900 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray900,
        fontSize: 18.fSize,
      );

  static get titleLarge16Red700 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.red700,
        fontSize: 16.fSize,
      );

  static get titleMediumBlue20018 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.blue200,
        fontSize: 18.fSize,
      );

  static get titleMedium18Blue500 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.blue500,
        fontSize: 18.fSize,
      );

  static get titleMedium18 => theme.textTheme.titleMedium!.copyWith(
        fontSize: 18.fSize,
      );

  static get titleMedium16BlueGray500 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.blueGray500,
        fontSize: 16.fSize,
      );

  static get titleMediumBlueGray20018 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.blueGray200,
        fontSize: 18.fSize,
      );

  static get titleMediumBlueGray40018 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.blueGray400,
        fontSize: 18.fSize,
      );

  static get titleMediumBlueGray40024 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.blueGray400,
        fontSize: 24.fSize,
      );

  static get titleSmallBlueGray400 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.blueGray400,
      );

  static get titleSmallWhite => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.white,
      );

  static get titleSmall30BlueA700 => theme.textTheme.titleSmall!
      .copyWith(color: appTheme.blueA700, fontSize: 30.fSize);

  // Headline text style
  static get headlineLargePrimary => theme.textTheme.headlineLarge!.copyWith(
        color: theme.colorScheme.primary,
      );

  static get headlineSmall18 => theme.textTheme.headlineLarge!.copyWith(
        color: appTheme.blueGray400,
        fontSize: 18.fSize,
      );

  static get headlineSmall18Red700 => theme.textTheme.headlineLarge!.copyWith(
        color: appTheme.red700,
        fontSize: 18.fSize,
      );

  static get headlineSmallBlueA70018 => theme.textTheme.headlineLarge!.copyWith(
        color: appTheme.blueA700,
        fontSize: 18.fSize,
      );

  static get headlineSmallBlueGray70016 =>
      theme.textTheme.headlineLarge!.copyWith(
        color: appTheme.blueGray700,
        fontSize: 16.fSize,
      );

  static get headlineLarge20BlueGray700 =>
      theme.textTheme.headlineLarge!.copyWith(
        color: appTheme.blueGray700,
        fontSize: 20.fSize,
      );
}
