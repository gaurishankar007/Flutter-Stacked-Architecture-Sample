// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedDialogGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/widgets/dialogs/generic_dialogs.dart';

enum DialogType {
  generic,
}

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final Map<DialogType, DialogBuilder> builders = {
    DialogType.generic: (context, request, completer) =>
        GenericDialog(request: request, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}
