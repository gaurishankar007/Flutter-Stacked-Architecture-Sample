import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import 'contact_model.dart';

class ContactViewModel extends BaseViewModel {
  final bottomSheet = locator<BottomSheetService>();
  final dialog = locator<DialogService>();
  List<ContactModel> contacts = [];

  addContact(ContactModel contact) async {
    final contactExists = contacts.any(
      (e) => e.phoneNumber == contact.phoneNumber,
    );

    if (contactExists) {}

    await Future.delayed(const Duration(seconds: 1));
    contacts.add(contact);
    rebuildUi();
  }

  removeContact(ContactModel contact) async {
    await Future.delayed(const Duration(seconds: 1));
    contacts.add(contact);
    rebuildUi();
  }
}
