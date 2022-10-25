import 'package:stacked_services/stacked_services.dart';
import 'package:travel_planner/data/enums/bottom_sheet_type.dart';
import 'package:travel_planner/presentation/common/bottom_sheet/generic_bottom_sheet.dart';

import '../../../app/app.locator.dart';

void setupBottomSheetUi() {
  final bottomSheetService = locator<BottomSheetService>();

  final builders = {
    BottomSheetType.basic: (context, sheetRequest, completer) =>
        GenericBottomSheet(request: sheetRequest, completer: completer)
  };

  bottomSheetService.setCustomSheetBuilders(builders);
}
