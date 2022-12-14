import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:travel_planner/app/app.locator.dart';

import '../../../data/enums/snackbar_type.dart';
import '../../design/color_pallete.dart';

void setupSnackbarUi() {
  final service = locator<SnackbarService>();

  service.registerCustomSnackbarConfig(
    variant: SnackbarType.success,
    config: SnackbarConfig(
      snackPosition: SnackPosition.TOP,
      backgroundColor: ColorPalette.success,
      textColor: ColorPalette.onSuccess,
      borderRadius: 1,
      dismissDirection: DismissDirection.up,
    ),
  );

  service.registerCustomSnackbarConfig(
    variant: SnackbarType.error,
    config: SnackbarConfig(
      snackPosition: SnackPosition.TOP,
      backgroundColor: ColorPalette.error,
      textColor: ColorPalette.onError,
      borderRadius: 1,
      dismissDirection: DismissDirection.up,
    ),
  );

  service.registerCustomSnackbarConfig(
    variant: SnackbarType.info,
    config: SnackbarConfig(
      snackPosition: SnackPosition.TOP,
      backgroundColor: ColorPalette.info,
      textColor: ColorPalette.onInfo,
      borderRadius: 1,
      dismissDirection: DismissDirection.up,
    ),
  );

  service.registerCustomSnackbarConfig(
    variant: SnackbarType.warning,
    config: SnackbarConfig(
      snackPosition: SnackPosition.TOP,
      backgroundColor: ColorPalette.warning,
      textColor: ColorPalette.onWarning,
      borderRadius: 1,
      dismissDirection: DismissDirection.up,
    ),
  );
}
