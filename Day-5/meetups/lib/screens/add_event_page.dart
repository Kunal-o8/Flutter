import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meetups/utils/event.dart';
import 'package:meetups/utils/location.dart';
import 'package:meetups/provider/events_provider.dart';

class AddEventPage extends ConsumerWidget {
  AddEventPage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _locationNameController = TextEditingController();
  final _locationAddressController = TextEditingController();
  final _locationLatitudeController = TextEditingController();
  final _locationLongitudeController = TextEditingController();
  final _imageController = TextEditingController();
  final _datesController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Event'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _titleController,
                  decoration: const InputDecoration(labelText: 'Title'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(labelText: 'Description'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a description';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _imageController,
                  decoration: const InputDecoration(labelText: 'Image URL'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an image URL';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _datesController,
                  decoration: const InputDecoration(
                      labelText: 'Dates (comma-separated)'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter dates';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _locationNameController,
                  decoration: const InputDecoration(labelText: 'Location Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a location name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _locationAddressController,
                  decoration:
                      const InputDecoration(labelText: 'Location Address'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a location address';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _locationLatitudeController,
                  decoration:
                      const InputDecoration(labelText: 'Location Latitude'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a location latitude';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _locationLongitudeController,
                  decoration:
                      const InputDecoration(labelText: 'Location Longitude'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a location longitude';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final newEvent = Event(
                          id: DateTime.now().toString(),
                          title: _titleController.text,
                          description: _descriptionController.text,
                          image: _imageController.text,
                          location: Location(
                            name: _locationNameController.text,
                            address: _locationAddressController.text,
                            latitude:
                                double.parse(_locationLatitudeController.text),
                            longitude:
                                double.parse(_locationLongitudeController.text),
                          ),
                          dates: _datesController.text
                              .split(',')
                              .map((date) => DateTime.parse(date))
                              .toList(),
                        );
                        ref.read(eventsProvider.notifier).addEvent(newEvent);
                        Navigator.pop(context);
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
