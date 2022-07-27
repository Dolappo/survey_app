

import 'package:stacked_services/stacked_services.dart';

import '../app/app_setup.locator.dart';
import '../core/models/generic_bottom_sheet.dart';
import '../core/models/generic_bottom_sheet_data_holders.dart';
import '../core/ui_enums/bottomsheet_type.dart';


void setupBottomSheetUi() {
  final bottomSheetService = locator<BottomSheetService>();

  final builders = {
    BottomSheetType.Generic: (
      context,
      sheetRequest,
      Function(SheetResponse<GenericBottomSheetResponse>) completer,
    ) =>
        GenericBottomSheet(
          request: sheetRequest,
          completer: completer,
        ),
  };

  bottomSheetService.setCustomSheetBuilders(builders);
}
