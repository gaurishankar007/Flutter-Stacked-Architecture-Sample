import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../contact_model.dart';
import '../contact_view_model.dart';

class ContactFormWidget extends StatefulWidget {
  const ContactFormWidget({super.key});

  @override
  State<ContactFormWidget> createState() => _ContactFormWidgetState();
}

class _ContactFormWidgetState extends State<ContactFormWidget> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final loadingNotifier = ValueNotifier<bool>(false);

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            controller: nameController,
            decoration: const InputDecoration(
              labelText: 'Name',
              hintText: 'Enter your name',
              enabledBorder: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(),
              errorBorder: OutlineInputBorder(),
              focusedErrorBorder: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
          ),
          const SizedBox(height: 20.0),
          TextFormField(
            controller: phoneController,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              labelText: 'Phone',
              hintText: 'Enter your phone number',
              enabledBorder: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(),
              errorBorder: OutlineInputBorder(),
              focusedErrorBorder: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your phone number';
              } else if (double.tryParse(phoneController.text) == null) {
                return 'Enter a valid phone number';
              }
              return null;
            },
          ),
          const SizedBox(height: 20.0),
          TextFormField(
            controller: addressController,
            decoration: const InputDecoration(
              labelText: 'Address',
              hintText: 'Enter your address',
              enabledBorder: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(),
              errorBorder: OutlineInputBorder(),
              focusedErrorBorder: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your address';
              }
              return null;
            },
          ),
          const SizedBox(height: 20.0),
          ViewModelBuilder.reactive(
            viewModelBuilder: () => ContactViewModel(),
            builder: (context, viewModel, child) {
              return ValueListenableBuilder(
                valueListenable: loadingNotifier,
                builder: (context, loading, child) {
                  if (loading) {
                    return const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(),
                    );
                  }

                  return ElevatedButton(
                    onPressed: () => addContact(viewModel),
                    child: const Text('Register'),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  addContact(ContactViewModel viewModel) async {
    if (!formKey.currentState!.validate()) return;

    final contact = ContactModel(
      name: nameController.text,
      phoneNumber: phoneController.text,
      address: addressController.text,
    );
    await viewModel.addContact(contact);
  }
}
